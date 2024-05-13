import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:vidyaveechi_website/controller/class_controller/class_controller.dart';
import 'package:vidyaveechi_website/model/subject_model/subject_model.dart';
import 'package:vidyaveechi_website/view/constant/const.dart';
import 'package:vidyaveechi_website/view/constant/constant.validate.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';

class SubjectController extends GetxController {
  List<SubjectModel> classwiseSubjectList = [];
  TextEditingController subNameController = TextEditingController();
  TextEditingController subNameEditController = TextEditingController();
  TextEditingController subFeeController = TextEditingController();
  RxString subjectName = ''.obs;
  RxString subjectID = ''.obs;
  Rx<ButtonState> buttonstate = ButtonState.idle.obs;
  Rx<Color> subjectColor = Rx(Colors.amber);
  final _firebase = server
      .collection('SchoolListCollection')
      .doc(UserCredentialsController.schoolId)
      .collection(UserCredentialsController.batchId!)
      .doc(UserCredentialsController.batchId!)
      .collection('classes');
  Future<void> asignSubjectToTeacher(
      {required String teacherName, required String teacherDocid}) async {
    buttonstate.value = ButtonState.loading;
    try {
      final asignSubDetail = SubjectModel(
          subjectColor: subjectColor.value,
          subjectFeefortr: int.parse(subFeeController.text.trim()),
          subjectNameedit: false,
          docid: subjectID.value,
          subjectName: subjectName.value,
          teacherId: teacherDocid,
          teacherName: teacherName);
      log("Color value $asignSubDetail");
      await _firebase
          .doc(Get.find<ClassController>().classDocID.value)
          .collection('teachers')
          .doc(teacherDocid)
          .set({
        'teacherId': asignSubDetail.teacherId,
        'teacherName': asignSubDetail.teacherName
      }, SetOptions(merge: true)).then((value) async {
        await _firebase
            .doc(Get.find<ClassController>().classDocID.value)
            .collection('teachers')
            .doc(teacherDocid)
            .collection('teacherSubject')
            .doc(subjectID.value)
            .set(asignSubDetail.toMap())
            .then((value) async {
          await _firebase
              .doc(Get.find<ClassController>().classDocID.value)
              .collection('subjects')
              .doc(subjectID.value)
              .collection('teachers')
              .doc(teacherDocid)
              .set({
            'teacherId': asignSubDetail.teacherId,
            'teacherName': asignSubDetail.teacherName
          }, SetOptions(merge: true)).then((value) async {
            buttonstate.value = ButtonState.success;
            showToast(msg: 'Subject added to this teacher');
            subFeeController.clear();
            await Future.delayed(const Duration(seconds: 2)).then((value) {
              buttonstate.value = ButtonState.idle;
            });
          });
        });
      });
    } catch (e) {
      showToast(msg: 'Somthing went wrong please try again');
      buttonstate.value = ButtonState.fail;
      await Future.delayed(const Duration(seconds: 2)).then((value) {
        buttonstate.value = ButtonState.idle;
      });
      if (kDebugMode) {
        log(e.toString());
      }
    }
  }

  Future<void> addSubjectIntoClass({required String classID}) async {
    buttonstate.value = ButtonState.loading;
    try {
      final String subDocid = subNameController.text.trim() + uuid.v1();
      final SubjectModel subjDetails = SubjectModel(
          docid: subDocid,
          subjectName: subNameController.text,
          subjectNameedit: false,
          subjectColor: subjectColor.value);
      await _firebase
          .doc(classID)
          .collection('subjects')
          .doc(subDocid)
          .set(subjDetails.toMap())
          .then((value) async {
        buttonstate.value = ButtonState.success;
        subNameController.clear();
        await Future.delayed(const Duration(seconds: 2)).then((vazlue) {
          buttonstate.value = ButtonState.idle;
        });
      });
    } catch (e) {
      showToast(msg: 'Somthing went wrong please try again');
      buttonstate.value = ButtonState.fail;
      await Future.delayed(const Duration(seconds: 2)).then((value) {
        buttonstate.value = ButtonState.idle;
      });
      if (kDebugMode) {
        log(e.toString());
      }
    }
  }

  Future<List<SubjectModel>> fetchClassWiseSubject() async {
    final firebase = await _firebase
        .doc(Get.find<ClassController>().classDocID.value)
        .collection('subjects')
        .get();

    for (var i = 0; i < firebase.docs.length; i++) {
      final list =
          firebase.docs.map((e) => SubjectModel.fromMap(e.data())).toList();
      classwiseSubjectList.add(list[i]);
    }
    return classwiseSubjectList;
  }

  Future<void> enableorDisableUpdate(
    String docid,
    bool status,
  ) async {
    await _firebase
        .doc(Get.find<ClassController>().classModelData.value!.docid)
        .collection("subjects")
        .doc(docid)
        .update({'subjectNameedit': status});
  }

  Future<void> updateSubjectName(String docid) async {
    //................. Update Class Name
    //.... Update Class Name
    try {
      await _firebase
          .doc(Get.find<ClassController>().classModelData.value!.docid)
          .collection("subjects")
          .doc(docid)
          .update({
        'subjectNameedit': false,
        'subjectName': subNameEditController.text
      }).then((value) => subNameEditController.clear());
    } catch (e) {
      showToast(msg: 'Somthing went wrong please try again');
      if (kDebugMode) {
        log(e.toString());
      }
    }
  }

  Future<void> asignSubRemoveFromTr(
      String teacherdocid, String subjectID) async {
    //................. Update Class Name
    //.... Update Class Name
    try {
      _firebase
          .doc(Get.find<ClassController>().classDocID.value)
          .collection('teachers')
          .doc(teacherdocid)
          .collection('teacherSubject')
          .doc(subjectID)
          .delete()
          .then((value) {
        showToast(msg: 'Subject Removed');
        Get.back();
      });
    } catch (e) {
      showToast(msg: 'Somthing went wrong please try again');
      if (kDebugMode) {
        log(e.toString());
      }
    }
  }

  Future<List<DocumentSnapshot>> fetchExamWiseSubject(examName) async {
    print(examName);
    final firebase = await server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection(UserCredentialsController.batchId!)
        .doc(UserCredentialsController.batchId!)
        .collection('classes')
        .doc(Get.find<ClassController>().classModelData.value!.docid)
        .collection('Exam Results')
        .doc(examName)
        .collection('Subjects')
        .get();

    // for (var i = 0; i < firebase.docs.length; i++) {
    //   final list =
    //       firebase.docs.map((e) => SubjectModel.fromMap(e.data())).toList();
    //   classwiseSubjectList.add(list[i]);
    // }
    return firebase.docs;
  }
}
