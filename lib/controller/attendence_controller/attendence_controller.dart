import 'dart:developer';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'package:vidyaveechi_website/controller/calender_controller/calender_controller.dart';
import 'package:vidyaveechi_website/controller/class_controller/class_controller.dart';
import 'package:vidyaveechi_website/controller/period_controller/period_controller.dart';
import 'package:vidyaveechi_website/controller/subject_controller/subject_controller.dart';
import 'package:vidyaveechi_website/model/student_Attendece_model/student_attendence_model.dart';
import 'package:vidyaveechi_website/view/constant/const.dart';
import 'package:vidyaveechi_website/view/constant/constant.validate.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';

class AttendenceController extends GetxController {
  RxInt periodSelectedIndex = 0.obs;
  List<String> fetchClassWiseMonth = [];
  List<String> fetchClassWiseDate = [];
  RxBool todayAttendence = true.obs;
  

  RxBool ontapaddAttendence = false.obs;
  RxBool fetchClassMonthActivate = false.obs;
  RxString fetchClassWiseMonthvalue = 'dd'.obs;
  RxString fetchClassWiseDatevalue = 'dd'.obs;

  RxBool isAttendanceNotAvail = true.obs;
  // RxBool attandanceStatus = false.obs;

  RxString className = ''.obs;
  RxString period = ''.obs;

  RxList<StudentAttendanceModel> studentAttenanceList = RxList([]);
  RxList<StudentAttendanceModel> allStudentAttenanceList = RxList([]);

  RxInt absentStudent = 0.obs;
  RxInt totalStudents = 0.obs;

  RxBool isShowDialogLoading = false.obs;

  Future<List<String>> fetchClassWiseMonthsfunction() async {
    try {
      await server
          .collection('SchoolListCollection')
          .doc(UserCredentialsController.schoolId)
          .collection(UserCredentialsController.batchId!)
          .doc(UserCredentialsController.batchId!)
          .collection('classes')
          .doc(Get.find<ClassController>().classDocID.value)
          .collection('Attendence')
          .get()
          .then((value) {
        for (var i = 0; i < value.docs.length; i++) {
          fetchClassWiseMonth.add(value.docs[i].data()['id']);
        }
      });
    } catch (e) {
      log(e.toString());
    }

    return fetchClassWiseMonth;
  }

  Future<List<String>> fetchClassWiseDatefunction() async {
    try {
      await server
          .collection('SchoolListCollection')
          .doc(UserCredentialsController.schoolId)
          .collection(UserCredentialsController.batchId!)
          .doc(UserCredentialsController.batchId!)
          .collection('classes')
          .doc(Get.find<ClassController>().classDocID.value)
          .collection('Attendence')
          .doc(fetchClassWiseMonthvalue.value)
          .collection(fetchClassWiseMonthvalue.value)
          .get()
          .then((value) {
        for (var i = 0; i < value.docs.length; i++) {
          fetchClassWiseDate.add(value.docs[i].data()['docid']);
        }
      });
    } catch (e) {
      log(e.toString());
    }

    return fetchClassWiseDate;
  }

  Future<int> getStudentAbsentCount({
    required String periodID,
  }) async {
    try {
      log("getStudentAbsentList Loading...................");
      final date = DateTime.now();
      DateTime parseDate = DateTime.parse(date.toString());
      final month = DateFormat('MMMM-yyyy');
      String monthwise = month.format(parseDate);
      final DateFormat formatter = DateFormat('dd-MM-yyyy');
      String formatted = formatter.format(parseDate);
      todayAttendence.value == true
          ? await server
              .collection(UserCredentialsController.batchId!)
              .doc(UserCredentialsController.batchId)
              .collection('classes')
              .doc(UserCredentialsController.classId)
              .collection('Attendence')
              .doc(monthwise)
              .collection(monthwise)
              .doc(formatted)
              .collection('Subjects')
              .doc(periodID)
              .collection('AttendenceList')
              .get()
              .then((abResult) async {
              for (var i = 0; i < abResult.docs.length; i++) {
                if (abResult.docs[i].data()['present'] == false) {
                  absentStudent.value + 1;
                }
              }
            })
          : await server
              .collection(UserCredentialsController.batchId!)
              .doc(UserCredentialsController.batchId)
              .collection('classes')
              .doc(UserCredentialsController.classId)
              .collection('Attendence')
              .doc(fetchClassWiseMonthvalue.value)
              .collection(fetchClassWiseMonthvalue.value)
              .doc(fetchClassWiseDatevalue.value)
              .collection('Subjects')
              .doc(periodID)
              .collection('AttendenceList')
              .get()
              .then((abResult) async {
              for (var i = 0; i < abResult.docs.length; i++) {
                if (abResult.docs[i].data()['present'] == false) {
                  absentStudent.value + 1;
                }
              }
            });
    } catch (e) {
      log(e.toString());
    }
    return absentStudent.value;
  }

  addAttendance() async {
    await server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection(UserCredentialsController.batchId!)
        .doc(UserCredentialsController.batchId!)
        .collection('classes')
        .doc(Get.find<ClassController>().classDocID.value)
        .collection('Attendence')
        .doc(Get.find<CalenderController>().monthYear)
        .collection(Get.find<CalenderController>().monthYear)
        .doc(dateConvert(Get.find<CalenderController>().date))
        .collection('Subjects')
        .doc()
        .set({});
  }

  void getClassStudentDetails() async {
    final studentData = await server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection(UserCredentialsController.batchId!)
        .doc(UserCredentialsController.batchId!)
        .collection('classes')
        .doc(Get.find<ClassController>().classDocID.value)
        .collection('Students')
        .get();

    allStudentAttenanceList.value = studentData.docs.map((e) {
      return StudentAttendanceModel(
          date: '', present: false, studentName: e['studentName'], uid: e['docid']);
    }).toList();
  }

  void checkAttendance() async {
    final attandanceData = await server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection(UserCredentialsController.batchId!)
        .doc(UserCredentialsController.batchId!)
        .collection('classes')
        .doc(Get.find<ClassController>().classDocID.value)
        .collection('Attendence')
        .doc(Get.find<CalenderController>().monthYear)
        .collection(Get.find<CalenderController>().monthYear)
        .doc(Get.find<CalenderController>().dateCtr.text)
        .collection('Subjects')
        .where('period', isEqualTo: Get.find<PeriodController>().periodName.value)
        .get();

    className.value = Get.find<ClassController>().className.value;
    period.value = Get.find<PeriodController>().periodName.value;

    if (attandanceData.docs.isNotEmpty) {
      isAttendanceNotAvail.value = false;

      final studentData = await server
          .collection('SchoolListCollection')
          .doc(UserCredentialsController.schoolId)
          .collection(UserCredentialsController.batchId!)
          .doc(UserCredentialsController.batchId!)
          .collection('classes')
          .doc(Get.find<ClassController>().classDocID.value)
          .collection('Attendence')
          .doc(Get.find<CalenderController>().monthYear)
          .collection(Get.find<CalenderController>().monthYear)
          .doc(Get.find<CalenderController>().dateCtr.text)
          .collection('Subjects')
          .doc(attandanceData.docs.first['docid'])
          .collection('AttendenceList')
          .get();

      studentAttenanceList.value = studentData.docs.map((e) {
        print(e['present']);
        return StudentAttendanceModel(
            date: '', present: e['present'], studentName: e['studentName'], uid: e['uid']);
      }).toList();
    } else {
      isAttendanceNotAvail.value = true;
      studentAttenanceList.value = [];
    }
  }

  setAttendance(String docId, bool status) {
    // ignore: invalid_use_of_protected_member
    for (StudentAttendanceModel data in allStudentAttenanceList.value) {
      if (data.uid == docId) {
        if (status == true) {
          data.present = false;
        } else {
          data.present = true;
        }
      }
    }
  }

  uploadAttendanceList() async {
    final docId = const Uuid().v1();
    final date = DateTime.now().toString();
    await server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection(UserCredentialsController.batchId!)
        .doc(UserCredentialsController.batchId!)
        .collection('classes')
        .doc(Get.find<ClassController>().classDocID.value)
        .collection('Attendence')
        .doc(Get.find<CalenderController>().monthYear)
        .collection(Get.find<CalenderController>().monthYear)
        .doc(Get.find<CalenderController>().dateCtr.text)
        .collection('Subjects')
        .doc(docId)
        .set({
      'date': date,
      'docid': docId,
      'exTime': date,
      'onSubmit': false,
      'period': Get.find<PeriodController>().periodName.value,
      'subject': Get.find<SubjectController>().subjectName.value
    }).then((value) async {
      // ignore: invalid_use_of_protected_member
      for (StudentAttendanceModel data in allStudentAttenanceList.value) {
        await server
            .collection('SchoolListCollection')
            .doc(UserCredentialsController.schoolId)
            .collection(UserCredentialsController.batchId!)
            .doc(UserCredentialsController.batchId!)
            .collection('classes')
            .doc(Get.find<ClassController>().classDocID.value)
            .collection('Attendence')
            .doc(Get.find<CalenderController>().monthYear)
            .collection(Get.find<CalenderController>().monthYear)
            .doc(Get.find<CalenderController>().dateCtr.text)
            .collection('Subjects')
            .doc(docId)
            .collection('AttendenceList')
            .doc(data.uid)
            .set(data.toMap());
      }
    });
    checkAttendance();
    showToast(msg: 'Attendance updated');
  }

  getEditAttendanceList() async {
    isShowDialogLoading.value == true;
    final attandanceData = await server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection(UserCredentialsController.batchId!)
        .doc(UserCredentialsController.batchId!)
        .collection('classes')
        .doc(Get.find<ClassController>().classDocID.value)
        .collection('Attendence')
        .doc(Get.find<CalenderController>().monthYear)
        .collection(Get.find<CalenderController>().monthYear)
        .doc(Get.find<CalenderController>().dateCtr.text)
        .collection('Subjects')
        .where('period', isEqualTo: Get.find<PeriodController>().periodName.value)
        .get();

    if (attandanceData.docs.isNotEmpty) {
      final studentData = await server
          .collection('SchoolListCollection')
          .doc(UserCredentialsController.schoolId)
          .collection(UserCredentialsController.batchId!)
          .doc(UserCredentialsController.batchId!)
          .collection('classes')
          .doc(Get.find<ClassController>().classDocID.value)
          .collection('Attendence')
          .doc(Get.find<CalenderController>().monthYear)
          .collection(Get.find<CalenderController>().monthYear)
          .doc(Get.find<CalenderController>().dateCtr.text)
          .collection('Subjects')
          .doc(attandanceData.docs.first['docid'])
          .collection('AttendenceList')
          .get();

      allStudentAttenanceList.value = studentData.docs.map((e) {
        print(e['present']);
        return StudentAttendanceModel(
            date: e['Date'], present: e['present'], studentName: e['studentName'], uid: e['uid']);
      }).toList();
    }
    // isShowDialogLoading.value = false;
  }

  editAttendance() async {
    final attandanceData = await server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection(UserCredentialsController.batchId!)
        .doc(UserCredentialsController.batchId!)
        .collection('classes')
        .doc(Get.find<ClassController>().classDocID.value)
        .collection('Attendence')
        .doc(Get.find<CalenderController>().monthYear)
        .collection(Get.find<CalenderController>().monthYear)
        .doc(Get.find<CalenderController>().dateCtr.text)
        .collection('Subjects')
        .where('period', isEqualTo: Get.find<PeriodController>().periodName.value)
        .get();

    if (attandanceData.docs.isNotEmpty) {
      // ignore: invalid_use_of_protected_member
      for (StudentAttendanceModel data in allStudentAttenanceList.value) {
        await server
            .collection('SchoolListCollection')
            .doc(UserCredentialsController.schoolId)
            .collection(UserCredentialsController.batchId!)
            .doc(UserCredentialsController.batchId!)
            .collection('classes')
            .doc(Get.find<ClassController>().classDocID.value)
            .collection('Attendence')
            .doc(Get.find<CalenderController>().monthYear)
            .collection(Get.find<CalenderController>().monthYear)
            .doc(Get.find<CalenderController>().dateCtr.text)
            .collection('Subjects')
            .doc(attandanceData.docs.first['docid'])
            .collection('AttendenceList')
            .doc(data.uid)
            .set(data.toMap());
      }
    }
    checkAttendance();
    showToast(msg: 'Attendance updated');
  }
}
