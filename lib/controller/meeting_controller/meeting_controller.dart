import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:uuid/uuid.dart';
import 'package:vidyaveechi_website/model/meeting_model/meeting_model.dart';
import 'package:vidyaveechi_website/view/constant/const.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';

class MeetingController extends GetxController {
  TextEditingController topicController = TextEditingController();
  // Rx<String> dateController =  ''.obs;
  TextEditingController timeController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  TextEditingController categoryController = TextEditingController();
  TextEditingController memberController = TextEditingController();
  TextEditingController specialguestController = TextEditingController();
  TextEditingController venueController = TextEditingController();

  TextEditingController edittopicController = TextEditingController();
  TextEditingController edittimeController = TextEditingController();
  TextEditingController editdateController = TextEditingController();
  TextEditingController editcategoryController = TextEditingController();
  TextEditingController editmemberController = TextEditingController();
  TextEditingController editspecialguestController = TextEditingController();
  TextEditingController editvenueController = TextEditingController();

  Rx<ButtonState> buttonstate = ButtonState.idle.obs;
  RxBool ontapMeeting = false.obs;
  final Rxn<DateTime> dateSelected = Rxn<DateTime>();
  final formKey = GlobalKey<FormState>();

  Future<void> createMeeting() async {
    final uuid = const Uuid().v1();
    final meetingDetails = MeetingModel(
        topic: topicController.text,
        date: dateController.text,
        time: timeController.text,
        category: categoryController.text,
        members: memberController.text,
        specialGuest: specialguestController.text,
        venue: venueController.text,
        meetingId: uuid);

    // final Map<String, dynamic> eventData = eventDetails.toMap();

    try {
      await server
          .collection('SchoolListCollection')
          .doc(UserCredentialsController.schoolId)
          .collection(UserCredentialsController.batchId!)
          .doc(UserCredentialsController.batchId!)
          .collection('AdminMeetings')
          .doc(meetingDetails.meetingId)
          .set(meetingDetails.toMap())
          .then((value) async {
        topicController.clear();
        dateController.clear();
        timeController.clear();
        categoryController.clear();
        memberController.clear();
        specialguestController.clear();
        venueController.clear();
        buttonstate.value = ButtonState.success;

        print(meetingDetails.meetingId);
        showToast(msg: "Meeting Created Successfully");
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

  Future<void> updateMeeting(String meetingId, BuildContext context) async {
    // ignore: unused_local_variable
    //  String edit = snapshot.data!.docs[index]['eventName'];
    server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection(UserCredentialsController.batchId!)
        .doc(UserCredentialsController.batchId!)
        .collection('AdminMeetings')
        .doc(meetingId)
        .update({
          'topic': edittopicController.text,
          'date': editdateController.text,
          'time': edittimeController.text,
          'category': editcategoryController.text,
          'members': editmemberController.text,
          'specialGuest': editspecialguestController.text,
          'venue': editvenueController.text,
        })
        .then((value) => Navigator.pop(context))
        .then((value) => showToast(msg: 'Meeting Updated!'));
    print("object");
  }

  Future<void> deleteMeeting(String meetingId, BuildContext context) async {
    // ignore: unused_local_variable
    // String delete = snapshot.data!.docs[index]['eventName'];
    server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection(UserCredentialsController.batchId!)
        .doc(UserCredentialsController.batchId!)
        .collection('AdminMeetings')
        .doc(meetingId)
        .delete();
  }

  Future<void> selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
      controller.text = formattedDate;
    }
  }

  Future<void> selectTimesec(
      BuildContext context, TextEditingController controller) async {
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
