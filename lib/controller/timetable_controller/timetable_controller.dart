import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:vidyaveechi_website/controller/class_controller/class_controller.dart';
import 'package:vidyaveechi_website/controller/subject_controller/subject_controller.dart';
import 'package:vidyaveechi_website/controller/teacher_controller/teacher_controller.dart';
import 'package:vidyaveechi_website/model/timetable_model/timetable_model.dart';
import 'package:vidyaveechi_website/view/constant/const.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';

import '../../view/widgets/progress indicator dialogue/progress_indicator_dialogue.dart';

class TimeTableController extends GetxController {
  List<String> weekList = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];
  RxString dayName = 'Select Day'.obs;
  RxString subjectName = 'Select Subject'.obs;
  RxString teacherName = 'Select Teacher'.obs;

  RxString selectclass = 'Select Class'.obs;
  RxString dayNames = ''.obs;

  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  TextEditingController startTimeviewController = TextEditingController();
  TextEditingController endTimeviewController = TextEditingController();
  TextEditingController periodController = TextEditingController();
  TextEditingController subjectNamecontroller = TextEditingController();
  TextEditingController periodcontroller = TextEditingController();
  TextEditingController timecontroller = TextEditingController();

  final classController = Get.put(ClassController());
  final subjectController = Get.put(SubjectController());
  final teacherController = Get.put(TeachersController());

  bool loadingStatus = false;

  RxBool ontapTimetable = false.obs;
  Rx<ButtonState> buttonstate = ButtonState.idle.obs;
  RxDouble progressValue = 0.0.obs; // Progress value initialized

  final Map<String, int> weekdayIndices = {
    'Monday': 0,
    'Tuesday': 1,
    'Wednesday': 2,
    'Thursday': 3,
    'Friday': 4,
    'Saturday': 5,
    'Sunday': 6,
  };

  Future<void> addTimeTableDataToFirebase(BuildContext context) async {
    progressValue.value = 0.1;  // Update progress
    
    showDialog(
      context: context,
      builder: (context) {
        return   ProgressDialog(progressValue: progressValue);
      },
    );

    final timetableDetails = TimeTableModel(
      selectClass: classController.className.value,
      dayName: dayName.value,
      teacherName: teacherController.teacherName,
      subjectName: subjectController.subjectName.value,
      periodNumber: periodController.text,
      startTime: startTimeController.text,
      endTime: endTimeController.text,
      selectColor: subjectController.subjectColor.value,
      docid: periodController.text,
    );

    final Map<String, dynamic> timetableData = timetableDetails.toMap();

    try {
      await FirebaseFirestore.instance
          .collection('SchoolListCollection')
          .doc(UserCredentialsController.schoolId)
          .collection(UserCredentialsController.batchId!)
          .doc(UserCredentialsController.batchId!)
          .collection('classes')
          .doc(classController.classDocID.value)
          .collection('timetables')
          .doc(dayName.value)
          .set({
            'docid': dayName.value,
            'day': dayName.value,
            'index': weekdayIndices[dayName.value],
          }).then(
              (value) async {
        progressValue.value = 0.5;  // Update progress
        await FirebaseFirestore.instance
            .collection('SchoolListCollection')
            .doc(UserCredentialsController.schoolId)
            .collection(UserCredentialsController.batchId!)
            .doc(UserCredentialsController.batchId!)
            .collection('classes')
            .doc(classController.classDocID.value)
            .collection('timetables')
            .doc(dayName.value)
            .collection('Subjects')
            .doc(periodController.text)
            .set(timetableData)
            .then((value) {
          progressValue.value = 1.0;  // Update progress

          dayName.value = 'Select Day';
          subjectName.value = 'Select Subject';
          teacherName.value = 'Select Teacher';
          selectclass.value = 'Select Class';
          startTimeController.clear();
          endTimeController.clear();
          buttonstate.value = ButtonState.success;
          showToast(msg: "TimeTable Created Successfully");
          Future.delayed(const Duration(seconds: 2)).then((value) {
            buttonstate.value = ButtonState.idle;
          });
        });
      });

      // Log the details
    //  log(UserCredentialsController.schoolId);
      log(UserCredentialsController.batchId!);
      log(classController.classDocID.value);
      log(dayName.value);
      log(timetableData.toString());
    } catch (e, stackTrace) {
      log('Error adding timetable: $e', stackTrace: stackTrace);
      showToast(msg: 'Failed to add timetable');

      buttonstate.value = ButtonState.fail;
      await Future.delayed(const Duration(seconds: 2)).then((value) {
        buttonstate.value = ButtonState.idle;
      });
    }
    Navigator.pop(context);
  }

  Future<void> enableUpdate(String docid, String daydocid) async {
    await FirebaseFirestore.instance
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection(UserCredentialsController.batchId!)
        .doc(UserCredentialsController.batchId!)
        .collection('classes')
        .doc(classController.classDocID.value)
        .collection('timetables')
        .doc(daydocid)
        .collection('Subjects')
        .doc(docid)
        .update({
      'subjectName': subjectNamecontroller.text,
      'periodNumber': periodController.text,
      'startTime': startTimeviewController.text,
      'endTime': endTimeviewController.text,
    });
  }

  Future<void> enableDelete(String docid, String daydocid) async {
    await FirebaseFirestore.instance
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection(UserCredentialsController.batchId!)
        .doc(UserCredentialsController.batchId!)
        .collection('classes')
        .doc(classController.classDocID.value)
        .collection('timetables')
        .doc(daydocid)
        .collection('Subjects')
        .doc(docid)
        .delete();
  }

  Future<void> selectTimesec(BuildContext context, TextEditingController controller) async {
    final TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (selectedTime != null) {
      final String formattedTime = selectedTime.format(context);
      controller.text = formattedTime;
    }
  }
}
