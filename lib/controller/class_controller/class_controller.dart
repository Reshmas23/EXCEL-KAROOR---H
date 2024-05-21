import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:vidyaveechi_website/controller/batch_yearController/batch_year_Controller.dart';
import 'package:vidyaveechi_website/model/class_model/class_model.dart';
import 'package:vidyaveechi_website/model/student_model/student_model.dart';
import 'package:vidyaveechi_website/view/constant/const.dart';
import 'package:vidyaveechi_website/view/constant/constant.validate.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';
import 'package:vidyaveechi_website/view/widgets/drop_DownList/schoolDropDownList.dart';

class ClassController extends GetxController {
   final TextEditingController classTeacherController = TextEditingController();
  final TextEditingController classNameController = TextEditingController();
  final TextEditingController classNameEditController = TextEditingController();
  final TextEditingController classIdController = TextEditingController();
  final TextEditingController classIdEditController = TextEditingController();
  final TextEditingController classFeeController = TextEditingController();
  final TextEditingController classFeeEditController = TextEditingController();
  Rx<String> lastClassStatus = '......'.obs;
  Rx<ButtonState> buttonstate = ButtonState.idle.obs;
  List<StudentModel> allstudentList = [];
  List<ClassModel> allclassList = [];
  List<ClassModel> classwiseSubjectList = [];
  Rxn<ClassModel> classModelData = Rxn<ClassModel>();
  RxBool ontapLeaveApplication = false.obs;

  int boysCount = 0;
  int girlsCount = 0;

  RxString className = ''.obs;
  RxString classId = ''.obs;
  RxString classDocID = 'dd'.obs; 
  RxString studentName = ''.obs;
  RxString studentDocID = ''.obs;
  RxBool ontapClass = false.obs;
  RxBool ontapClassStudents = false.obs;
  // final server.collection(collectionPath) = server
  //     .collection('SchoolListCollection')
  //     .doc(UserCredentialsController.schoolId);

  Future<void> addNewClass() async {
    //.. Create New Class
    buttonstate.value = ButtonState.loading;
    try {
      final data = ClassModel(
          workingDaysCount: 0,
          classfee: int.parse(classFeeController.text.trim()),
          feeeditoption: false,
          editoption: false,
          docid: classNameController.text.trim() + uuid.v1(),
          className: classNameController.text.trim(),
          classId: classIdController.text.trim(),
          classTeacherName: classTeacherController.text.trim(),
          );
      server
          .collection('SchoolListCollection')
          .doc(UserCredentialsController.schoolId)
          .collection("classes")
          .doc(data.docid)
          .set(data.toMap())
          .then((value) async {
        classTeacherController.clear();
        classNameController.clear();
        classIdController.clear();
        classFeeController.clear();
        buttonstate.value = ButtonState.success;

        await Future.delayed(const Duration(seconds: 2)).then((vazlue) {
          buttonstate.value = ButtonState.idle;
        });

        showToast(msg: 'New Class Added');
      });
    } catch (e) {
      showToast(msg: 'Somthing went wrong please try again');
      buttonstate.value = ButtonState.fail;
      await Future.delayed(const Duration(seconds: 2)).then((value) {
        buttonstate.value = ButtonState.idle;
      });
      if (kDebugMode) {
        log(e.toString());
      }
    }
  }

  setClassForbatchYear(String classTeacherName,
      String className, String classId, String docid, int classfee) async {
    try {
      final data = ClassModel(
          workingDaysCount: 0,
          docid: docid,
          className: className,
          classTeacherName: classTeacherName,
          classId: classId,
          editoption: false,
          feeeditoption: false,
          classfee: classfee);
      server
          .collection('SchoolListCollection')
          .doc(UserCredentialsController.schoolId)
          .collection(UserCredentialsController.batchId!)
          .doc(UserCredentialsController.batchId!)
          .collection('classes')
          .doc(docid)
          .set(data.toMap())
          .then((value) => showToast(msg: 'Class Added to BatchYear'));
    } catch (e) {
      showToast(msg: 'Somthing went wrong please try again');
      log(e.toString());
    }
  }

  Future<void> enableorDisableUpdate(
    String data,
    String docid,
    bool status,
  ) async {
    server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection("classes")
        .doc(docid)
        .update({data: status});
  }

  Future<void> updateClassFees(String docid) async {
    //................. Update Class Name
    //.... Update Class Name
    try {
      server
          .collection('SchoolListCollection')
          .doc(UserCredentialsController.schoolId)
          .collection("classes")
          .doc(docid)
          .update({
        'classfee': int.parse(classFeeEditController.text.trim()),
        'feeeditoption': false,
      }).then((value) {
        server
            .collection('SchoolListCollection')
            .doc(UserCredentialsController.schoolId)
            .collection(UserCredentialsController.batchId!)
            .doc(UserCredentialsController.batchId!)
            .collection('classes')
            .doc(docid)
            .update({
          'classfee': int.parse(classFeeEditController.text.trim())
        }).then((value) => showToast(msg: 'Class Name Changed'));
        classFeeEditController.clear();
      });
    } catch (e) {
      showToast(msg: 'Somthing went wrong please try again');
      if (kDebugMode) {
        log(e.toString());
      }
    }
  }

  Future<void> updateClassName(String docid) async {
    //................. Update Class Name
    //.... Update Class Name
    try {
      server
          .collection('SchoolListCollection')
          .doc(UserCredentialsController.schoolId)
          .collection("classes")
          .doc(docid)
          .update({
        'className': classNameEditController.text.trim(),
        'editoption': false,
      }).then((value) {
        server
            .collection('SchoolListCollection')
            .doc(UserCredentialsController.schoolId)
            .collection(UserCredentialsController.batchId!)
            .doc(UserCredentialsController.batchId!)
            .collection('classes')
            .doc(docid)
            .update({'className': classNameEditController.text.trim()}).then(
                (value) => showToast(msg: 'Class Name Changed'));
        classNameEditController.clear();
      });
    } catch (e) {
      showToast(msg: 'Somthing went wrong please try again');
      if (kDebugMode) {
        log(e.toString());
      }
    }
  }

  deleteClass(String docid, BuildContext context) async {
    ///////////............................. Delete Global Classes
    if (UserCredentialsController.schoolId == serverAuth.currentUser!.uid) {
      showDialog(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(),
            title: const Text('Alert'),
            content: const SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(
                      'Once you delete a class all data will be lost \n Are you sure ?')
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Ok'),
                onPressed: () async {
                  try {
                    server
                        .collection('SchoolListCollection')
                        .doc(UserCredentialsController.schoolId)
                        .collection("classes")
                        .doc(docid)
                        .delete()
                        .then((value) => showToast(msg: 'Class Deleted'));
                    Navigator.pop(context);
                  } catch (e) {
                    showToast(msg: 'Somthing went wrong please try again');
                    if (kDebugMode) {
                      log(e.toString());
                    }
                  }
                },
              ),
            ],
          );
        },
      );
    } else {
      return showDialog(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Alert'),
            content: const SingleChildScrollView(
              child: ListBody(
                children: <Widget>[Text('Sorry you have no access to delete')],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  deleteBatchClasses(BuildContext context, String docid) async {
    //................. Delete Batch Year Classes
    if (UserCredentialsController.schoolId == serverAuth.currentUser!.uid) {
      showDialog(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Alert'),
            content: const SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(
                      'Once you delete a class all data will be lost \n Are you sure ?')
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Ok'),
                onPressed: () async {
                  try {
                    server
                        .collection('SchoolListCollection')
                        .doc(UserCredentialsController.schoolId)
                        .collection(UserCredentialsController.batchId!)
                        .doc(UserCredentialsController.batchId!)
                        .collection('classes')
                        .doc(docid)
                        .delete()
                        .then((value) => showToast(msg: 'Class Deleted'));
                  } catch (e) {
                    showToast(msg: 'Somthing went wrong please try again');
                    if (kDebugMode) {
                      log(e.toString());
                    }
                  }
                },
              ),
            ],
          );
        },
      );
    } else {
      return showDialog(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Alert'),
            content: const SingleChildScrollView(
              child: ListBody(
                children: <Widget>[Text('Sorry you have no access to delete')],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  Future<List<ClassModel>> fetchClass() async {
    final firebase = await server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection(UserCredentialsController.batchId!)
        .doc(UserCredentialsController.batchId!)
        .collection('classes')
        .get();

    for (var i = 0; i < firebase.docs.length; i++) {
      final list =
          firebase.docs.map((e) => ClassModel.fromMap(e.data())).toList();
      allclassList.add(list[i]);
      allclassList.sort((a, b) => a.className.compareTo(b.className));
    }
    return allclassList;
  }

  Future<List<ClassModel>> userloginfetchClass() async {
    final firebase = await server
        .collection('SchoolListCollection')
        .doc(schoolListValue['docid'])
        .collection(Get.find<BatchYearController>().batchyearValue.value)
        .doc(Get.find<BatchYearController>().batchyearValue.value)
        .collection('classes')
        .get();

    for (var i = 0; i < firebase.docs.length; i++) {
      final list =
          firebase.docs.map((e) => ClassModel.fromMap(e.data())).toList();
      allclassList.add(list[i]);
      allclassList.sort((a, b) => a.className.compareTo(b.className));
    }
    return allclassList;
  }

  Future<List<StudentModel>> fetchAllStudents() async {
    final firebase = await server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection('AllStudents')
        .get();

    for (var i = 0; i < firebase.docs.length; i++) {
      final list =
          firebase.docs.map((e) => StudentModel.fromMap(e.data())).toList();
      allstudentList.add(list[i]);
    }
    return allstudentList;
  }

  Future<void> addStudentToClassController(String classDocid) async {
    try {
      log("studentDocID.value ${studentDocID.value}");
      log("sclassDocid $classDocid");
      final studentResult = await server
          .collection('SchoolListCollection')
          .doc(UserCredentialsController.schoolId)
          .collection('AllStudents')
          .doc(studentDocID.value)
          .get();
      if (studentDocID.value != '') {
        final data = StudentModel.fromMap(studentResult.data()!);
        await server
            .collection('SchoolListCollection')
            .doc(UserCredentialsController.schoolId)
            .collection('AllStudents')
            .doc(studentDocID.value)
            .update({'classId': classDocid}).then((value) async {
          await server
              .collection('SchoolListCollection')
              .doc(UserCredentialsController.schoolId)
              .collection(UserCredentialsController.batchId!)
              .doc(UserCredentialsController.batchId!)
              .collection('classes')
              .doc(classDocid)
              .collection('Students')
              .doc(studentDocID.value)
              .set(data.toMap())
              .then((value) async {
            showToast(msg: 'Added');
            allstudentList.clear();
          });
        });
      }
    } catch (e) {
      log(e.toString());
      showToast(msg: 'Somthing went wrong please try again');
      allstudentList.clear();
    }
  }

  getClassBoyCount() async {
    log("Batch ID ${UserCredentialsController.batchId}");
    int count = 0;
    final classData = await server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection(UserCredentialsController.batchId!)
        .doc(UserCredentialsController.batchId)
        .collection('classes')
        .doc(classModelData.value!.docid)
        .collection('Students')
        .get();
    for (var element in classData.docs) {
      if (element['gender'] == 'Male') {
        count++;
      }
    }
    boysCount = count;
    girlsCount = classData.docs.length - boysCount;
  }

  RxString firstSubjectId = 'dd'.obs;
  Future<void> getFirstSubjectId() async {
    final date = DateTime.now();
    DateTime parseDate = DateTime.parse(date.toString());
    final month = DateFormat('MMMM-yyyy');
    String monthwise = month.format(parseDate);
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    String formatted = formatter.format(parseDate);

    await server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection(UserCredentialsController.batchId!)
        .doc(UserCredentialsController.batchId!)
        .collection('classes')
        .doc(classModelData.value!.docid)
        .collection('Attendence')
        .doc(monthwise)
        .collection(monthwise)
        .doc(formatted)
        .collection('Subjects')
        .get()
        .then((value) {
    firstSubjectId.value =  value.docs[0].data()['docid'] ;  ///////////////////error on the index
      log("dddd ${firstSubjectId.value }");
    });
  } 
}
