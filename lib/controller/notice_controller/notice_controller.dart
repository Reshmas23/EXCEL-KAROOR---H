import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:uuid/uuid.dart';
import 'package:vidyaveechi_website/model/notice_model/notice_model.dart';
import 'package:vidyaveechi_website/view/constant/const.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';

class NoticeController extends GetxController {
  RxBool customValue = RxBool(false);
  RxBool studentValue = RxBool(false);
  RxBool parentValue = RxBool(false);
  RxBool teacherValue = RxBool(false);

  final formKey = GlobalKey<FormState>();

  Rx<ButtonState> buttonstate = ButtonState.idle.obs;

  final Rxn<DateTime> dateSelectedPublished = Rxn<DateTime>();
  final Rxn<DateTime> dateSelectedSubmission = Rxn<DateTime>();
  final Rxn<DateTime> dateSelectedOccasion = Rxn<DateTime>();

  // final Rx<String> noticePublishedDateController = ''.obs;
  // final Rx<String> noticeSubmissionDateController = ''.obs;
  // final Rx<String> noticeOccasionDateController = ''.obs;

  TextEditingController noticeHeadingController = TextEditingController();
  TextEditingController noticePublishedDateController = TextEditingController();
  TextEditingController noticeSubjectController = TextEditingController();
  TextEditingController noticeDateofoccationController =
      TextEditingController();
  TextEditingController noticeDateofSubmissionController =
      TextEditingController();
  TextEditingController editnoticePublishedDateController =
      TextEditingController();
  TextEditingController editnoticeDateofoccationController =
      TextEditingController();
  TextEditingController editnoticeDateofSubmissionController =
      TextEditingController();
  TextEditingController noticevenueController = TextEditingController();
  TextEditingController noticeGuestController = TextEditingController();
  TextEditingController noticeSignedByController = TextEditingController();

  Future<void> createNotice() async {
    final uuid = const Uuid().v1();
    final noticeDetails = NoticeModel(
        subject: noticeSubjectController.text,
        publishedDate: noticePublishedDateController.text,
        heading: noticeHeadingController.text,
        dateofoccation: noticeDateofoccationController.text,
        venue: noticevenueController.text,
        chiefGuest: noticeGuestController.text,
        dateOfSubmission: noticeDateofSubmissionController.text,
        signedBy: noticeSignedByController.text,
        noticeId: uuid);

    // final Map<String, dynamic> eventData = eventDetails.toMap();

    try {
      await server
          .collection('SchoolListCollection')
          .doc(UserCredentialsController.schoolId)
          .collection(UserCredentialsController.batchId!)
          .doc(UserCredentialsController.batchId!)
          .collection('AdminNotices')
          .doc(noticeDetails.noticeId)
          .set(noticeDetails.toMap())
          .then((value) async {
        noticeSubjectController.clear();
        noticePublishedDateController.clear();
        noticeHeadingController.clear();
        noticeDateofoccationController.clear();
        noticevenueController.clear();
        noticeGuestController.clear();
        noticeDateofSubmissionController.clear();
        noticeSignedByController.clear();
        buttonstate.value = ButtonState.success;
        print(UserCredentialsController.batchId!);

        showToast(msg: "Notice Created Successfully");
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

  Future<void> updateNotice(String noticeId, BuildContext context) async {
    // ignore: unused_local_variable
    //  String edit = snapshot.data!.docs[index]['eventName'];
    server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection(UserCredentialsController.batchId!)
        .doc(UserCredentialsController.batchId!)
        .collection('AdminNotices')
        .doc(noticeId)
        .update({
          'subject': noticeSubjectController.text,
          'publishedDate': editnoticePublishedDateController.text,
          'heading': noticeHeadingController.text,
          'dateofoccation': editnoticeDateofoccationController.text,
          'venue': noticevenueController.text,
          'chiefGuest': noticeGuestController.text,
          'dateOfSubmission': editnoticeDateofSubmissionController.text,
          'signedBy': noticeSignedByController.text,
        })
        .then((value) {
          noticeSubjectController.clear();
          editnoticePublishedDateController.clear();
          noticeHeadingController.clear();
          editnoticeDateofoccationController.clear();
          noticevenueController.clear();
          noticeGuestController.clear();
          editnoticeDateofSubmissionController.clear();
          noticeSignedByController.clear();
        })
        .then((value) => Navigator.pop(context))
        .then((value) => showToast(msg: 'Notice Updated!'));
  }

  Future<void> deleteNotice(String noticeId, BuildContext context) async {
    log(
      "noticeId -----------$noticeId",
    );
    // ignore: unused_local_variable
    // String delete = snapshot.data!.docs[index]['eventName'];
    server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection(UserCredentialsController.batchId!)
        .doc(UserCredentialsController.batchId!)
        .collection('AdminNotices')
        .doc(noticeId)
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
}
