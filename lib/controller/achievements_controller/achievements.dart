import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:uuid/uuid.dart';
import 'package:vidyaveechi_website/model/achievement_model/achievement_model.dart';
import 'package:vidyaveechi_website/view/constant/const.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';

class AchievementsController extends GetxController {

 Rx<ButtonState> buttonstate = ButtonState.idle.obs;

  QueryDocumentSnapshot<Map<String, dynamic>>? classListValue;
  final FirebaseStorage storage = FirebaseStorage.instance;
  bool loadingStatus = false;
  String studentID = '';
  Uint8List? file;
  Uint8List? afile;

  TextEditingController achievementController = TextEditingController();
 TextEditingController dateController = TextEditingController();
  TextEditingController studentNameController = TextEditingController();
  TextEditingController admissionNumberController = TextEditingController();

 TextEditingController editdateController = TextEditingController();
 TextEditingController editachievementController = TextEditingController(); 
  TextEditingController editstudentNameController = TextEditingController();
  TextEditingController editadmissionNumberController = TextEditingController();
  final formKey = GlobalKey<FormState>();
   final Rx<String> dateControllerr = ''.obs;
     final Rxn<DateTime> dateSelected = Rxn<DateTime>();

  Future<void> uploadImageToStorage(
   // file
    ) async {
    try {
      String uid = const Uuid().v1();
      // UploadTask uploadTask = FirebaseStorage.instance
      //     .ref()
      //     .child("files/achievements/$uid")
      //     .putData(file!);

    //  final TaskSnapshot snap = await uploadTask;
   //   final String downloadUrl = await snap.ref.getDownloadURL();

      AchievementModel achievementDetails = AchievementModel(
        //  photoUrl: downloadUrl,
          studentName: studentNameController.text,
          dateofAchievement: dateController.text,
          achievementHead: achievementController.text,
          admissionNumber: admissionNumberController.text,
          uid: uid,
        //  studentID: studentID
          );

      server //d4srOy0ovzUPBmZs3CBFRoOImIU2
          .collection('SchoolListCollection')
          .doc(UserCredentialsController.schoolId)
          .collection(UserCredentialsController.batchId!)
          .doc(UserCredentialsController.batchId!)
          // .collection(Get.find<GetFireBaseData>().bYear.value)
          // .doc(Get.find<GetFireBaseData>().bYear.value)
          .collection('AdminAchievements')
          .doc(achievementDetails.uid)
          .set(achievementDetails.toMap())
          .then((value) {
        studentNameController.clear();
        dateController.clear();
        achievementController.clear();
        admissionNumberController.clear();
        //   if (afile == null) {
        //     showToast(msg: 'Select an image');
        //   } else {
        // showToast(msg: 'New Achievement Added!');}
      })
      .then((value) => showToast(msg: 'New Achievement Added!'));
       await Future.delayed(const Duration(seconds: 2)).then((vazlue) {
          buttonstate.value = ButtonState.idle;
        });

      // return {
      // //  "downloadUrl": downloadUrl,
      //   "imageUid": uid,
      // };
      //}
      //  else {
      //   return {};
      // }
    } catch (e) {
       buttonstate.value = ButtonState.fail;
      await Future.delayed(const Duration(seconds: 2)).then((value) {
        buttonstate.value = ButtonState.idle;
      });
      log(e.toString());
   //   return {};
    }
  }

  Future<void> updateAchievement(String studentName,String achievementHead,
  String dateofAchievement,String admissionNumber,
  String uid,BuildContext context) async {
     
    await server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection(UserCredentialsController.batchId!)
        .doc(UserCredentialsController.batchId!)
        // .collection(Get.find<GetFireBaseData>().bYear.value)
        // .doc(Get.find<GetFireBaseData>().bYear.value)
        .collection('AdminAchievements')
        .doc(uid)
        .update({
          'studentName':editstudentNameController.text,
           'dateofAchievement':editdateController.text,
           'achievementHead':editachievementController.text,
           'admissionNumber':editadmissionNumberController.text,
          // 'photoUrl': downloadUrl,
    })  .then((value) => Navigator.pop(context ))
        .then((value) => showToast(msg: 'Achievement Updated!'));
  }

  Future<void> deleteAchievements(String uid,BuildContext context) async {
    await server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection(UserCredentialsController.batchId!)
        .doc(UserCredentialsController.batchId!)
        // .collection(Get.find<GetFireBaseData>().bYear.value)
        // .doc(Get.find<GetFireBaseData>().bYear.value)
        .collection('AdminAchievements')
        .doc(uid)
        .delete()
        .then((value) => showToast(msg: 'Successfully Deleted!'));
  }

  Future<void> selectDate(BuildContext context, TextEditingController controller) async {
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

  //   selectDate(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //     context: context,
  //     initialDate: dateSelected.value ?? DateTime.now(),
  //     firstDate: DateTime(1920),
  //     lastDate: DateTime(2100),
  //     // builder: (context, child) {
  //     //   return Container();
  //     // },
  //   );
  //   if (picked != null && picked != dateSelected.value) {
  //     dateSelected.value = picked;
  //     DateTime parseDate = DateTime.parse(dateSelected.value.toString());
  //     final DateFormat formatter = DateFormat('yyyy-MMMM-dd');
  //     String formatted = formatter.format(parseDate);

  //     dateControllerr.value = formatted.toString();
  //     log(formatted.toString());
  //   }
  // }
}
