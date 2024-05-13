import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/admin_login_screen/admin_login_screen_controller.dart';
import 'package:vidyaveechi_website/view/constant/const.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';

class AttendanceNotification extends GetxController{

  final TextEditingController timeController = TextEditingController();

    TimeOfDay? selectedTime;
  final formKey = GlobalKey<FormState>();
  bool notificationEnabledOrNot = false;



   Future<void> addTimeToFirebase() async {
    log("controller text ${timeController.text}");
    await server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection('Notifications')
        .doc('Attendance')
        .set({'timeToDeliverAbsenceNotification': timeController.text.trim(),'notificationNeededOrNot': true })
        .then((value) {timeController.clear();
        showToast(msg: "Successfully Added");
        });
   }


     Future<void> getDataFromfirebase() async {
   // DocumentSnapshot doc =
    await server
        .collection('SchoolListCollection')
        .doc(Get.find<AdminLoginScreenController>().schoolID)
        .collection('Notifications')
        .doc('Attendance')
        .get();

   
   Future <void> updateTime()async{
    await server
        .collection('SchoolListCollection')
        .doc(Get.find<AdminLoginScreenController>().schoolID)
        .collection('Notifications')
        .doc('Attendance').update({
        });

   }
  }
}