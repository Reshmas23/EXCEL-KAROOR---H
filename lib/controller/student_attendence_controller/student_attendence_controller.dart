import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:vidyaveechi_website/controller/class_controller/class_controller.dart';
import 'package:vidyaveechi_website/view/constant/const.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';

class StudentAttendenceController extends GetxController {
  RxInt totalStudent = 0.obs;
  int presentStudent = 0;
  int absentStudent = 0;

  RxInt totalStudentAttendance = 0.obs;
  RxInt presentStudentAttendance = 0.obs;
  RxInt absentStudentAttendance = 0.obs;

  void getStudentsAttendanceData({
    required String monthwise,
    required String formatted,
    required String subjectID,
  }) async {
    print('Updated');
    print('monthwise : $monthwise');
    print('formatted : $formatted');
    print('subjectID : $subjectID');
    int count = 0;
    try {
      await server
          .collection('SchoolListCollection')
          .doc(UserCredentialsController.schoolId)
          .collection(UserCredentialsController.batchId!)
          .doc(UserCredentialsController.batchId!)
          .collection('classes')
          .doc(Get.find<ClassController>().classDocID.value)
          .collection('Attendence')
          .doc(monthwise)
          .collection(monthwise)
          .doc(formatted)
          .collection('Subjects')
          .doc(subjectID)
          .collection('AttendenceList')
          .get()
          .then((value) {
        for (var element in value.docs) {
          if (element['present'] == true) {
            count++;
          }
        }
        totalStudent.value = value.docs.length;
        presentStudent = count;
        absentStudent = value.docs.length - count;
        print('present : $count');
        print('Total : ${value.docs.length}');
        print('absent : $absentStudent');
      });
    } catch (e) {
      showToast(msg: 'Error occured : $e');
    }
  }

  getSingleStudentAttendadance(
      {required String ClassId, required String studentId}) async {
    int count = 0;
    final studentAttendanceData = await server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection(UserCredentialsController.batchId!)
        .doc(UserCredentialsController.batchId!)
        .collection('classes')
        .doc(ClassId)
        .collection("Students")
        .doc(studentId)
        .collection('MyAttendenceList')
        .get();
    totalStudentAttendance.value = studentAttendanceData.docs.length;
    for (var element in studentAttendanceData.docs) {
      if (element['present'] == true) {
        count++;
      }
    }
    presentStudentAttendance.value = count;
    absentStudentAttendance.value =
        studentAttendanceData.docs.length - presentStudentAttendance.value;
  }
}
