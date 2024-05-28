import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:vidyaveechi_website/controller/admin_section/parent_controller/parent_controller.dart';
import 'package:vidyaveechi_website/controller/class_controller/class_controller.dart';
import 'package:vidyaveechi_website/model/student_model/student_model.dart';
import 'package:vidyaveechi_website/view/constant/const.dart';
import 'package:vidyaveechi_website/view/constant/constant.validate.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';

class StudentController extends GetxController {
  final ParentController parentController = Get.put(ParentController());
  Rx<ButtonState> buttonstate = ButtonState.idle.obs;
  final TextEditingController stNameController = TextEditingController();
  final TextEditingController stAdNoController = TextEditingController();
  final TextEditingController stEmailController = TextEditingController();
  final TextEditingController stPhoneController = TextEditingController();
  final TextEditingController phoneNumberStdEditController =
      TextEditingController();

  final Rx<String> dateofbithController = ''.obs;
  final Rx<String> gender = ''.obs;
  final Rxn<DateTime> selectedDOB = Rxn<DateTime>();
  final List<StudentModel> studentclasswiseList = [];
  final RxString stdClassWiseValue = ''.obs;
  RxInt stAdNumber = 0000.obs; // Student Admission Number
  RxString stUID = ''.obs; // Student Email Auth ID
  Rxn<StudentModel> studentModelData = Rxn<StudentModel>();
  final _randomstring = getRandomString(6);
  final _randomNum = getRandomNumber(4);
//serach
  List<StudentModel> studentProfileList = [];
  RxBool onClassWiseSearch = false.obs;
  final _fbServer = server
      .collection('SchoolListCollection')
      .doc(UserCredentialsController.schoolId);

  RxBool ontapStudent = false.obs;
  RxBool ontapCreateStudent = false.obs;
  RxString dobSelectedDate = ''.obs;
  RxString joiningSelectedDate = ''.obs;

//......................  Add student Section

  RxBool automaticmail = false.obs;

  Future<void> classWiseStudentCreation({required String password}) async {
    final docid = uuid.v1();
    buttonstate.value = ButtonState.loading;
    try {
      final studentDetail = StudentModel(
          admissionNumber: stAdNoController.text.trim(),
          alPhoneNumber: '',
          bloodgroup: '',
          classId: Get.find<ClassController>().classDocID.value,
          createDate: '',
          dateofBirth: '',
          district: '',
          docid: docid,
          gender: '',
          guardianId: '',
          houseName: '',
          parentId: '',
          parentPhoneNumber: stPhoneController.text.trim(),
          place: '',
          profileImageId: '',
          profileImageUrl: '',
          studentName: stNameController.text.trim(),
          password:password ,
          studentemail: '',
          userRole: 'student',  nameofClass: '');
      await _fbServer
          .collection(UserCredentialsController.batchId!)
          .doc(UserCredentialsController.batchId!)
          .collection('classes')
          .doc(Get.find<ClassController>().classDocID.value)
          .collection('Temp_Students')
          .doc(docid)
          .set(studentDetail.toMap())
          .then((value) async {
        stNameController.clear();
        stPhoneController.clear();
          stAdNoController.clear();
        buttonstate.value = ButtonState.success;
        showToast(msg: "Student Added Successfully");
        await Future.delayed(const Duration(seconds: 2)).then((vazlue) {
          buttonstate.value = ButtonState.idle;
        });
      });
    } catch (e) {
      buttonstate.value = ButtonState.fail;
      await Future.delayed(const Duration(seconds: 2)).then((value) {
        buttonstate.value = ButtonState.idle;
      });
      log("Error .... $e");
    }
  }

  Future<void> enableorDisableUpdate(
    String docid,
    bool status,
  ) async {
    await _fbServer
        .collection("classes")
        .doc(docid)
        .update({'editoption': status});
  }

  Future<void> manualCreateaNewStudent() async {
    buttonstate.value = ButtonState.loading;
    final studentEmail =
        '${stNameController.text.trim() + _randomNum}@gmail.com';
    String camelCaseText = studentEmail.split(" ").join();
    try {
      final StudentModel studentDetail = StudentModel(
          admissionNumber: stAdNoController.text.trim(),
          alPhoneNumber: '',
          bloodgroup: '',
          classId: Get.find<ClassController>().classDocID.value,
          createDate: DateTime.now().toString(),
          dateofBirth: dateofbithController.value,
          district: '',
          docid: stUID.value,
          gender: gender.value,
          guardianId: '',
          houseName: '',
          parentId: Get.find<ParentController>().stParentUID.value,
          parentPhoneNumber: stPhoneController.text.trim(),
          place: '',
          profileImageId: '',
          profileImageUrl: '',
          studentName: stNameController.text.trim(),
          password: _randomstring,
          studentemail: automaticmail.value == true
              ? camelCaseText
              : stEmailController.text.trim(),
          userRole: 'student',  nameofClass: '');
      await serverAuth
          .createUserWithEmailAndPassword(
              email: automaticmail.value == true
                  ? camelCaseText
                  : stEmailController.text.trim(),
              password: _randomstring)
          .then((value) async {
        stUID.value = value.user!.uid;
        studentDetail.docid = value.user!.uid;
        log("Student creation    ................${studentDetail.docid}");

        await Get.find<ParentController>()
            .createParentForStudent()
            .then((value) async {
          await _fbServer
              .collection('AllStudents')
              .doc(stUID.value)
              .set(studentDetail.toMap());
               await _fbServer
              .collection('CurrentStudentAttendance')
              .doc(stUID.value)
              .set(studentDetail.toMap())
              .then((value) async {
            await _fbServer
                .collection(UserCredentialsController.batchId!)
                .doc(UserCredentialsController.batchId!)
                .collection('classes')
                .doc(studentDetail.classId)
                .collection('Students')
                .doc(stUID.value)
                .set(
                  studentDetail.toMap(),
                )
                .then((value) async {
              await _fbServer
                  .collection(UserCredentialsController.batchId!)
                  .doc(UserCredentialsController.batchId!)
                  .collection('classes')
                  .doc(Get.find<ClassController>().classDocID.value)
                  .collection('Students')
                  .doc(Get.find<StudentController>().stUID.value)
                  .update(
                {'parentId': Get.find<ParentController>().stParentUID.value},
              ).then((value) async {
                await _fbServer
                    .collection('AllStudents')
                    .doc(Get.find<StudentController>().stUID.value)
                    .update(
                  {'parentId': Get.find<ParentController>().stParentUID.value},
                );
                await _fbServer
                    .collection('CurrentStudentAttendance')
                    .doc(Get.find<StudentController>().stUID.value)
                    .update(
                  {'parentId': Get.find<ParentController>().stParentUID.value},
                );
                return null;
              }).then((value) async {
                manuvalAfterStudentCreateGmailSender(
                  sendingmails: [stEmailController.text.trim()],
                  parentemail: Get.find<ParentController>().stParnetEmail.value,
                  parentpassword: '123456',
                  studentemail: stEmailController.text.trim(),
                  studentpassword: _randomstring,
                  schoolName: UserCredentialsController.schoolName ?? '',
                );
              }).then((value) async {
                if (automaticmail.value = true) {
                  
                }
                buttonstate.value = ButtonState.success;
                showToast(msg: "Student Added Successfully");
                await Future.delayed(const Duration(seconds: 2)).then((vazlue) {
                  buttonstate.value = ButtonState.idle;
                });
                stNameController.clear();
                stPhoneController.clear();
                stEmailController.clear();
                stAdNoController.clear();
                dateofbithController.value = '';
                automaticmail.value = false;
              });
            });
          });
        });
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        showToast(msg: 'Email is already in use');
        buttonstate.value = ButtonState.fail;
        await Future.delayed(const Duration(seconds: 2)).then((value) {
          buttonstate.value = ButtonState.idle;
        });
      } else {
        buttonstate.value = ButtonState.fail;
        await Future.delayed(const Duration(seconds: 2)).then((value) {
          buttonstate.value = ButtonState.idle;
        });
        log("Error .... $e");
      }
    }
  }

  // Future<String> increaseAdNo() async {
  //   final int newAdNo = stAdNumber.value + 1;

  //   await _fbServer
  //       .collection('AdmissionNumber')
  //       .doc('AdNo')
  //       .update({'AdNumber': newAdNo});

  //   return '000$newAdNo';
  // }

  // Future<int> getAdmissionNumber() async {
  //   final result =
  //       await _fbServer.collection('AdmissionNumber').doc('AdNo').get();

  //   if (result.data() == null) {
  //     await _fbServer
  //         .collection('AdmissionNumber')
  //         .doc('AdNo')
  //         .set({'AdNumber': stAdNumber.value});
  //   } else {
  //     print('.....................');
  //     stAdNumber.value = result.data()?['AdNumber'] ?? 0;
  //   }

  //   return stAdNumber.value;
  // }

  selectToDateofBirth(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDOB.value ?? DateTime.now(),
      firstDate: DateTime(1920),
      lastDate: DateTime(2100),
      // builder: (context, child) {
      //   return Container();
      // },
    );
    if (picked != null && picked != selectedDOB.value) {
      selectedDOB.value = picked;
      DateTime parseDate = DateTime.parse(selectedDOB.value.toString());
      final DateFormat formatter = DateFormat('yyyy-MMMM-dd');
      String formatted = formatter.format(parseDate);

      dateofbithController.value = formatted.toString();
      log(formatted.toString());
    }
  }

  // class GmailModel {
//   List<String> to;

// }

  manuvalAfterStudentCreateGmailSender({
    required List<String> sendingmails,
    required String parentemail,
    required String parentpassword,
    required String studentemail,
    required String studentpassword,
    required String schoolName,
  }) async {
    try {
      Map<String, dynamic> emailData = {
        'to': sendingmails,
        'message': {
          'subject': 'Account Created !!!',
          'text': 'This is the plaintext section of the email body.',
          'html': '''
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            line-height: 1.6;
            margin: 20px;
        }

        h1 {
            color: #3498db;
        }

        p {
            margin-bottom: 15px;
        }

        .details {
            background-color: #f2f2f2;
            padding: 10px;
            border-radius: 5px;
        }

        .signature {
            margin-top: 20px;
            font-style: italic;
            color: #7f8c8d;
        }
    </style>
</head>

<body>
    <h1>Congratulations on successfully creating your account with $schoolName at $schoolName Tuition Center!</h1>

    <p>Here are your account details:</p>

    <div class="details">
        <p><strong>Email:</strong> $studentemail</p>
        <p><strong>Password:</strong> $studentpassword</p>
    </div>
        <div class="details">
        <p><strong>Email:</strong> $parentemail</p>
        <p><strong>Password:</strong> $parentpassword</p>
    </div>
 

    <p>Thank you for joining us! If you have any questions or need assistance, feel free to reach out.</p>

    <p class="signature">Best regards,<br>[ ${UserCredentialsController.schoolName}} ]<br>$schoolName - ${UserCredentialsController.schoolName} Tuition Center</p>
</body>

</html>
''',
        },
      };
      server.collection("EmailDocumentCollection").add(emailData).then(
        (value) {
          log("Queued email for delivery!");
        },
      ).catchError(
        (error) {
          log("Error sending email: $error");
        },
      );
    } catch (e) {
      log("Gmail Failed  ${e.toString()}");
    }
  }

  Future<void> fetchAllStudents() async {
    try {
      log("fetchAllStudents......................");
      final data = await _fbServer.collection('AllStudents').get();
      studentProfileList =
          data.docs.map((e) => StudentModel.fromMap(e.data())).toList();
      print(studentProfileList[0]);
    } catch (e) {
      showToast(msg: "User Data Error");
    }
  }

  @override
  void onReady() async {
    print("On Ready");
    // await getAdmissionNumber();
    await fetchAllStudents();

    super.onReady();
  }

  Future<List<StudentModel>> fetchStudentClassWise() async {
    final result = await _fbServer
        .collection(UserCredentialsController.batchId!)
        .doc(UserCredentialsController.batchId!)
        .collection('classes')
        .get();

    for (var i = 0; i < result.docs.length; i++) {
      final list =
          result.docs.map((e) => StudentModel.fromMap(e.data())).toList();
      studentclasswiseList.add(list[i]);
    }
    return studentclasswiseList;
  }

  Future<void> updatePhoneNumber(String docid) async {
    //................. Update Class Name
    //.... Update Class Name
    try {
      _fbServer.collection("classes").doc(docid).update({
        'phoneNumber': phoneNumberStdEditController.text.trim(),
        'editoption': false,
      }).then((value) {
        _fbServer
            .collection(UserCredentialsController.batchId!)
            .doc(UserCredentialsController.batchId!)
            .collection('phoneNumber')
            .doc(docid)
            .update({
          'phoneNumberStdEditController':
              phoneNumberStdEditController.text.trim()
        }).then((value) => showToast(msg: 'Phone Number Changed'));
        phoneNumberStdEditController.clear();
      });
    } catch (e) {
      showToast(msg: 'Somthing went wrong please try again');
      if (kDebugMode) {
        log(e.toString());
      }
    }
  }
}
