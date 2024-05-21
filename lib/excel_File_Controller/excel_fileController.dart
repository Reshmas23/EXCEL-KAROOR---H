import 'dart:developer';

import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/class_controller/class_controller.dart';
import 'package:vidyaveechi_website/model/parent_model/parent_model.dart';
import 'package:vidyaveechi_website/model/student_model/student_model.dart';
import 'package:vidyaveechi_website/model/teacher_model/teacher_model.dart';
import 'package:vidyaveechi_website/view/constant/const.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';

class ExcelFileController extends GetxController {
  // RxBool excelisLoading = false.obs;
  List<StudentModel> excelStudentList = [];
  List<StudentModel> serverStudentList = [];
  List<TeacherModel> excelList = [];
  List<TeacherModel> serverTeacherList = [];

  Future<void> pickExcelForTeachers(
      {required String userCollection, required String userRole}) async {
    excelList.clear();
    serverTeacherList.clear();
    try {
      await getAllSchoolTeachers(userCollection: userCollection);
      //extract excel data
      final Excel? result = await extractDataFromExcel();
      // excelisLoading.value = true;
      if (result != null) {
        if (result.tables.isNotEmpty) {
          Sheet? table = result.tables[result.tables.keys.first];
          if (table != null) {
            for (int i = 1; i < table.maxRows; i++) {
              List<Data?>? firstRow = table.rows[i];

              //fetching data from excel cells
              if (firstRow[0]?.value != null &&
                  firstRow[1]?.value != null &&
                  firstRow[2]?.value != null) {
                //creating objects and upload to firebase
                final TeacherModel teacherModel = TeacherModel(
                  teacherName: firstRow[1]?.value.toString(),
                  employeeID: firstRow[0]?.value.toString(),
                  createdAt: DateTime.now().toString(),
                  teacherPhNo: firstRow[2]?.value.toString(),
                  userRole: userRole,
                );
                excelList.add(teacherModel);
              }
            }
            await server
                .collection('SchoolListCollection')
                .doc(UserCredentialsController.schoolId)
                .collection(userCollection)
                .get()
                .then((teacherCollectionvalue) {
              if (teacherCollectionvalue.docs.isEmpty) {
                createTeacherAsPerExcelData(userCollection: userCollection);
              } else {
                comapareDuplicateTeachers().then((value) async {
                  await createTeacherAsPerExcelData(
                      userCollection: userCollection);
                });
              }
            });
            // excelisLoading.value = false;
          } else {
            // excelisLoading.value = false;
            showToast(msg: 'Empty Sheet');
          }
        }
      }
      // excelisLoading.value = false;
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> getAllSchoolTeachers({required String userCollection}) async {
    await server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection(userCollection)
        .get()
        .then((value) {
      final teacherAllData = value.docs.map((e) {
        return TeacherModel.fromMap(e.data());
      }).toList();
      serverTeacherList.addAll(teacherAllData);
      log("school:$serverTeacherList ");
    });
  }

  Future<void> getAllSchoolStudent() async {
    await server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection('AllStudents')
        .get()
        .then((value) {
      final studentAllData = value.docs.map((e) {
        return StudentModel.fromMap(e.data());
      }).toList();
      serverStudentList.addAll(studentAllData);
    });
  }

  Future<void> comapareDuplicateStudent() async {
    excelStudentList.removeWhere((element) {
      return serverStudentList.any((serverStudentList) {
        if (serverStudentList.admissionNumber == element.admissionNumber) {
          showToast(
              msg:
                  '${serverStudentList.admissionNumber} Student ID Already Founded ❌');
        }
        return serverStudentList.admissionNumber == element.admissionNumber;
      });
    });
  }

  Future<void> comapareDuplicateTeachers() async {
    log('comapareDuplicateTeachers');
    excelList.removeWhere((element) {
      return serverTeacherList.any((serverTeacher) {
        if (serverTeacher.employeeID == element.employeeID) {
          showToast(
              msg: '${serverTeacher.employeeID} Teacher ID Already Founded ❌');
        }
        return serverTeacher.employeeID == element.employeeID;
      });
    });
  }

  Future<void> createTeacherAsPerExcelData(
      {required String userCollection}) async {
    try {
      for (var i = 0; i < excelList.length; i++) {
        final ranNo = getRandomNumber(3);
        final ranString = getRandomNumber(6);
        String teacherName = excelList[i].teacherName!.replaceAll(' ', '');
        final String teacherEmail = '${teacherName + ranNo}@gmail.com';
        await serverAuth
            .createUserWithEmailAndPassword(
                email: teacherEmail, password: ranString)
            .then((authvalue) async {
          excelList[i].docid = authvalue.user?.uid;
          excelList[i].password = ranString;
          excelList[i].teacherEmail = teacherEmail;
          await server
              .collection('SchoolListCollection')
              .doc(UserCredentialsController.schoolId)
              .collection(userCollection)
              .doc(authvalue.user?.uid)
              .set(excelList[i].toMap())
              .then((value) async {
            showToast(msg: '${excelList[i].employeeID} Account Created ✅');
          });
        });
      }
      excelList.clear();
      serverTeacherList.clear();
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> createStudentAsPerExcelData() async {
    try {
      for (var i = 0; i < excelStudentList.length; i++) {
        final ranNo = getRandomNumber(3);

        final ranString = getRandomNumber(6);
        String studentName =
            excelStudentList[i].studentName.replaceAll(' ', '');
        final String studentEmail = '${studentName + ranNo}@gmail.com';
        final String parentEmail =
            '${excelStudentList[i].admissionNumber}p${getRandomNumber(3)}@gmail.com';
        final String parentPass = getRandomNumber(6);
        await serverAuth
            .createUserWithEmailAndPassword(
                email: studentEmail, password: ranString)
            .then((authvalue) async {
          excelStudentList[i].docid = authvalue.user!.uid;
          excelStudentList[i].password = ranString;
          excelStudentList[i].studentemail = studentEmail;
          await server
              .collection('SchoolListCollection')
              .doc(UserCredentialsController.schoolId)
              .collection('AllStudents')
              .doc(authvalue.user?.uid)
              .set(excelStudentList[i].toMap())
              .then((value) async {
            await server
                .collection('SchoolListCollection')
                .doc(UserCredentialsController.schoolId)
                .collection(UserCredentialsController.batchId ?? "")
                .doc(UserCredentialsController.batchId)
                .collection('classes')
                .doc(Get.find<ClassController>().ontapClassDocID.value)
                .collection('Students')
                .doc(authvalue.user?.uid)
                .set(excelStudentList[i].toMap())
                .then((value) async {
              await serverAuth
                  .createUserWithEmailAndPassword(
                      email: parentEmail, password: parentPass)
                  .then((parentAuthvalue) async {
                final ParentModel parentDetail = ParentModel(
                  parentEmail: parentEmail,
                  password: parentPass,
                  studentID: authvalue.user?.uid,
                  docid: parentAuthvalue.user!.uid,
                );
                await server
                    .collection('SchoolListCollection')
                    .doc(UserCredentialsController.schoolId)
                    .collection('AllStudents')
                    .doc(authvalue.user?.uid)
                    .update({'parentId': parentAuthvalue.user!.uid});
                await server
                    .collection('SchoolListCollection')
                    .doc(UserCredentialsController.schoolId)
                    .collection(UserCredentialsController.batchId ?? "")
                    .doc(UserCredentialsController.batchId)
                    .collection('classes')
                    .doc(Get.find<ClassController>().ontapClassDocID.value)
                    .collection('Students')
                    .doc(authvalue.user?.uid)
                    .update({'parentId': parentAuthvalue.user!.uid});
                await server
                    .collection('SchoolListCollection')
                    .doc(UserCredentialsController.schoolId)
                    .collection('AllParents')
                    .doc(parentAuthvalue.user!.uid)
                    .set(parentDetail.toMap());
                await server
                    .collection('SchoolListCollection')
                    .doc(UserCredentialsController.schoolId)
                    .collection(UserCredentialsController.batchId ?? "")
                    .doc(UserCredentialsController.batchId)
                    .collection('classes')
                    .doc(Get.find<ClassController>().ontapClassDocID.value)
                    .collection('Parents')
                    .doc(parentAuthvalue.user!.uid)
                    .set(parentDetail.toMap());
              });

              showToast(
                  msg:
                      '${excelStudentList[i].admissionNumber} Account Created ✅');
            });
          });
        });
      }
      excelList.clear();
      serverTeacherList.clear();
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> pickExcelForStudent() async {
    excelStudentList.clear();
    serverStudentList.clear();
    try {
      await getAllSchoolStudent();
      //extract excel data
      final Excel? result = await extractDataFromExcel();
      // excelisLoading.value = true;
      if (result != null) {
        if (result.tables.isNotEmpty) {
          Sheet? table = result.tables[result.tables.keys.first];
          if (table != null) {
            for (int i = 1; i < table.maxRows; i++) {
              List<Data?>? firstRow = table.rows[i];

              //fetching data from excel cells
              if (firstRow[0]?.value != null &&
                  firstRow[1]?.value != null &&
                  firstRow[2]?.value != null) {
                //creating objects and upload to firebase
                final StudentModel studentModel = StudentModel(
                  nameofParent: '',
                  nameofClass: '',
                    admissionNumber: firstRow[0]?.value.toString() ?? '',
                    alPhoneNumber: '',
                    bloodgroup: '',
                    classId: Get.find<ClassController>().ontapClassDocID.value,
                    createDate: '',
                    dateofBirth: '',
                    district: '',
                    docid: '',
                    gender: '',
                    guardianId: '',
                    houseName: '',
                    parentId: '',
                    parentPhoneNumber: firstRow[2]?.value.toString() ?? '',
                    place: '',
                    profileImageId: '',
                    profileImageUrl: '',
                    studentName: firstRow[1]?.value.toString() ?? '',
                    password: '',
                    studentemail: '',
                    userRole: 'student', nameofParent: '', nameofClass: '');
                excelStudentList.add(studentModel);
              }
            }
            await server
                .collection('SchoolListCollection')
                .doc(UserCredentialsController.schoolId)
                .collection('AllStudents')
                .get()
                .then((studentCollectionvalue) {
              if (studentCollectionvalue.docs.isEmpty) {
                createStudentAsPerExcelData();
              } else {
                comapareDuplicateStudent().then((value) async {
                  await createStudentAsPerExcelData();
                });
              }
            });
            // excelisLoading.value = false;
          } else {
            // excelisLoading.value = false;
            showToast(msg: 'Empty Sheet');
          }
        }
      }
      // excelisLoading.value = false;
    } catch (e) {
      log(e.toString());
    }
  }

  Future<Excel?> extractDataFromExcel() async {
    /// Use FilePicker to pick files in Flutter Web
    ///
    try {
      FilePickerResult? pickedFile = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['xlsx'],
        allowMultiple: false,
      );

      /// file might be picked

      if (pickedFile != null) {
        Uint8List? bytes = pickedFile.files.single.bytes;
        if (bytes != null) {
          Excel excel = Excel.decodeBytes(bytes);

          return excel;
        }
      } else {
        showToast(msg: "Excel File Error");
      }
    } catch (e) {
      showToast(msg: "Something went wrong");
      log(e.toString());
      return null;
    }
    return null;
  }
}
