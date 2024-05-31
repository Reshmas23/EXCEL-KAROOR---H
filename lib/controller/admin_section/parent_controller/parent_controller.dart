import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:vidyaveechi_website/controller/admin_section/student_controller/student_controller.dart';
import 'package:vidyaveechi_website/controller/class_controller/class_controller.dart';
import 'package:vidyaveechi_website/model/parent_model/parent_model.dart';
import 'package:vidyaveechi_website/view/constant/const.dart';
import 'package:vidyaveechi_website/view/constant/constant.validate.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';

class ParentController extends GetxController {
  TextEditingController parentNameController = TextEditingController();
  TextEditingController parentPhNOController = TextEditingController();
  Rx<ButtonState> buttonstate = ButtonState.idle.obs;
  final docUID = uuid.v1();

  final Rx<String> studentName = ''.obs;
  RxBool ontapParent = false.obs;
  RxString dobSelectedDate = ''.obs;
  RxString joiningSelectedDate = ''.obs;
  RxString stParentUID = ''.obs; // Parent Email Auth ID
  RxString stParnetEmail = ''.obs;
  RxBool ontapviewParent = false.obs;
  Rxn<ParentModel> parentModelData = Rxn<ParentModel>();
  List<ParentModel> parentProfileList = [];

//......................  Add Parent Section

  RxBool automaticmail = false.obs;
  final _fbServer = server
      .collection('SchoolListCollection')
      .doc(UserCredentialsController.schoolId);
  Future<void> createParentForStudent() async {
    try {
      final String parentEmail =
          '${Get.find<StudentController>().stNameController.text.trim() + Get.find<StudentController>().stAdNumber.value.toString()}prnt@gmail.com';
      String camelCaseText = parentEmail.split(" ").join();
      log("Parent Email : $camelCaseText");
      final parentDetail = ParentModel(
          createdate: DateTime.now().toString(),
          docid: stParentUID.value,
          studentID: Get.find<StudentController>().stUID.value,
          parentEmail: camelCaseText,
          userRole: 'parent');
      await serverAuth
          .createUserWithEmailAndPassword(
              email: camelCaseText, password: '123456')
          .then((value) async {
        stParentUID.value = value.user!.uid;
        stParnetEmail.value = camelCaseText;
        parentDetail.docid = value.user!.uid;
        log("Parent creation    ................${parentDetail.docid}");
        await _fbServer
            .collection('AllParents')
            .doc(stParentUID.value)
            .set(parentDetail.toMap())
            .then((value) async {
          await _fbServer
              .collection(UserCredentialsController.batchId!)
              .doc(UserCredentialsController.batchId!)
              .collection('classes')
              .doc(Get.find<ClassController>().classDocID.value)
              .collection('Parents')
              .doc(stParentUID.value)
              .set(parentDetail.toMap());
        });
      });
    } catch (e) {
      log("Error Message $e");
    }
  }

  Future<void> addParent() async {
    buttonstate.value = ButtonState.loading;
    try {
      ParentModel data = ParentModel(
          parentName: parentNameController.text.trim(),
          parentPhoneNumber: parentPhNOController.text.trim(),
          studentID: Get.find<ClassController>().studentDocID.value,
          createdate: DateTime.now().toString(),
          docid: docUID);

      await _fbServer
          .collection(UserCredentialsController.batchId!)
          .doc(UserCredentialsController.batchId!)
          .collection("classes")
          .doc(Get.find<ClassController>().classDocID.value)
          .collection('Temp_ParentCollection')
          .doc(data.docid)
          .set(data.toMap())
          .then((value) async {
        parentNameController.clear();
        parentPhNOController.clear();
        Get.find<ClassController>().classDocID.value = '';
        Get.find<ClassController>().classDocID.value = '';
        buttonstate.value = ButtonState.success;
        showToast(msg: "Parent Added Successfully");
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

  Future<void> fetchAllParents() async {
    try {
      log("fetchAllParents......................");
      final data = await _fbServer.collection('AllParents').get();
      parentProfileList =
          data.docs.map((e) => ParentModel.fromMap(e.data())).toList();
      print(parentProfileList[0]);
    } catch (e) {
      showToast(msg: "User Data Error");
    }
  }
}
