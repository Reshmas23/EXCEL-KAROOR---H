import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:vidyaveechi_website/controller/class_controller/class_controller.dart';
import 'package:vidyaveechi_website/controller/subject_controller/subject_controller.dart';
import 'package:vidyaveechi_website/controller/teacher_controller/teacher_controller.dart';
import 'package:vidyaveechi_website/model/timetable_model/timetable_model.dart';
import 'package:vidyaveechi_website/view/constant/const.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';

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
        return Center(
          child: SizedBox(
            height: 200,
            width: 300,
            child: Obx(() => SfRadialGauge(
              axes: <RadialAxis>[
                RadialAxis( minimum: 0,
                        maximum: 100,
                        showLabels: false,
                        showTicks: false,
                        startAngle: 270,
                        endAngle: 270,
                        axisLineStyle: const AxisLineStyle(
                          thickness: 1,
                          color: Color.fromARGB(255, 0, 169, 181),
                          thicknessUnit: GaugeSizeUnit.factor,
                        ),
                        pointers: <GaugePointer>[
                          RangePointer(
                            value:progressValue.value * 100,
                            width: 0.15,
                            color: Colors.white,
                            pointerOffset: 0.1,
                            cornerStyle: CornerStyle.bothCurve,
                            sizeUnit: GaugeSizeUnit.factor,
                          )
                        ],
                  // minimum: 0,
                  // maximum: 100,
                  // showLabels: false,
                  // showTicks: false,
                  // startAngle: 270,
                  // endAngle: 270,
                  // axisLineStyle: const AxisLineStyle(
                  //   thickness: 0.05,
                  //   color: Color.fromARGB(100, 0, 169, 181),
                  //   thicknessUnit: GaugeSizeUnit.factor,
                  // ),
                  // pointers: <GaugePointer>[
                  //   RangePointer(
                  //     value: progressValue.value * 100,
                  //     width: 0.95,
                  //     pointerOffset: 0.05,
                  //     sizeUnit: GaugeSizeUnit.factor,
                  //   )
                  // ],
                ),
              ],
            )),
          ),
        );
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
