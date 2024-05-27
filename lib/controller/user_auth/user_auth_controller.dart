import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/user_login_Controller/user_login_controller.dart';
import 'package:vidyaveechi_website/model/parent_model/parent_model.dart';
import 'package:vidyaveechi_website/model/student_model/student_model.dart';
import 'package:vidyaveechi_website/model/teacher_model/teacher_model.dart';
import 'package:vidyaveechi_website/view/constant/const.dart';
import 'package:vidyaveechi_website/view/home/main_screen.dart';
import 'package:vidyaveechi_website/view/splash_screen/splash_screen.dart';
import 'package:vidyaveechi_website/view/users/admin/admin_home.dart';
import 'package:vidyaveechi_website/view/users/parent_panel/parent_home.dart';
import 'package:vidyaveechi_website/view/users/student/student_home.dart';
import 'package:vidyaveechi_website/view/users/teacher/teachers_home.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';

class UserAuthController extends GetxController {
  RxBool loginAuthState = false.obs;
  Future<void> checkSavedLoginAuth() async {
    if (kDebugMode) {}
    FirebaseAuth auth = FirebaseAuth.instance;

    UserCredentialsController.userRole =
        SharedPreferencesHelper.getString(SharedPreferencesHelper.userRoleKey);
    UserCredentialsController.batchId =
        SharedPreferencesHelper.getString(SharedPreferencesHelper.batchIdKey);
    UserCredentialsController.schoolId =
        SharedPreferencesHelper.getString(SharedPreferencesHelper.schoolIdKey);
    UserCredentialsController.schoolName = SharedPreferencesHelper.getString(
        SharedPreferencesHelper.schoolNameKey);
    UserCredentialsController.classId =
        SharedPreferencesHelper.getString(SharedPreferencesHelper.classIdKey);
    UserCredentialsController.userloginKey =
        SharedPreferencesHelper.getString(SharedPreferencesHelper.userloginKey);
    UserCredentialsController.currentUserDocid =
        SharedPreferencesHelper.getString(
            SharedPreferencesHelper.currentUserDocid);

    if (auth.currentUser == null) {
      if (kDebugMode) {
        print("Google Auth null");
      }
      Get.offAll(() => const MainScreen());
    } else {
      if (UserCredentialsController.userRole == 'admin') {
        log("userlogin ID :  ${FirebaseAuth.instance.currentUser?.uid}");
        log("SchoolID :  ${UserCredentialsController.schoolId}");
        log("BatchID :  ${UserCredentialsController.batchId}");
        log("userrole :  ${UserCredentialsController.userRole}");
        log("userloginKey :  ${UserCredentialsController.userloginKey}");
        log("currentUserDocid :  ${UserCredentialsController.currentUserDocid}");
        await checkAdmin();
        loginAuthState.value = true;
        if (Get.find<UserLoginController>().logined.value == true) {
          Get.find<UserLoginController>()
              .loginSaveData()
              .then((value) => Get.offAll(() => SplashScreen()));
        } else {
          Get.offAll(() => const AdminHomeScreen());
        }
      } else if (UserCredentialsController.userRole == 'student') {
        await checkStudent(auth);
      } else if (UserCredentialsController.userRole == 'parent') {
        await checkParent(auth);
      } else if (UserCredentialsController.userRole == 'teacher') {
        await checkTeacher(auth);
      } else {
        if (kDebugMode) {
          print("shared pref Auth null");
        }
        Get.offAll(() => const MainScreen());
      }
    }
  }
}

Future<void> checkAdmin() async {
  if (UserCredentialsController.userRole == "" &&
      UserCredentialsController.batchId == "" &&
      UserCredentialsController.schoolId == "" &&
      UserCredentialsController.userloginKey == "" &&
      UserCredentialsController.currentUserDocid == '') {
    logoutUser();

    Get.offAll(() => SplashScreen());
  }
}

Future<void> checkStudent(FirebaseAuth auth) async {
  log("userlogin ID :  ${FirebaseAuth.instance.currentUser?.uid}");
  log("SchoolID :  ${UserCredentialsController.schoolId}");
  log("BatchID :  ${UserCredentialsController.batchId}");
  log("userrole :  ${UserCredentialsController.userRole}");
  log("Class iD :  ${UserCredentialsController.classId}");
  final studentData = await server
      .collection('SchoolListCollection')
      .doc(UserCredentialsController.schoolId)
      .collection(UserCredentialsController.batchId ?? "")
      .doc(UserCredentialsController.batchId)
      .collection('classes')
      .doc(UserCredentialsController.classId)
      .collection('Students')
      .doc(auth.currentUser?.uid)
      .get();

  if (studentData.data() != null) {
    UserCredentialsController.studentModel =
        StudentModel.fromMap(studentData.data()!);
    if (Get.find<UserLoginController>().logined.value == true) {
      Get.find<UserLoginController>()
          .loginSaveData()
          .then((value) => Get.offAll(() => SplashScreen()));
    } else {
      Get.offAll(() => const StudentHomeScreen());
    }
  } else {
    showToast(msg: "Please login again");
    Get.offAll(() => const MainScreen());
    // Get.off(() => const DujoLoginScren());
  }
}

//////////////////////////////////////////////////////////////////////////////
Future<void> checkParent(FirebaseAuth auth) async {
  log("userlogin ID :  ${FirebaseAuth.instance.currentUser?.uid}");
  log("SchoolID :  ${UserCredentialsController.schoolId}");
  log("BatchID :  ${UserCredentialsController.batchId}");
  log("userrole :  ${UserCredentialsController.userRole}");
  log("Class iD :  ${UserCredentialsController.classId}");
  final parentData = await server
      .collection('SchoolListCollection')
      .doc(UserCredentialsController.schoolId)
      .collection(UserCredentialsController.batchId ?? "")
      .doc(UserCredentialsController.batchId)
      .collection('classes')
      .doc(UserCredentialsController.classId)
      .collection('Parents')
      .doc(auth.currentUser?.uid)
      .get();

  if (parentData.data() != null) {
    UserCredentialsController.parentModel =
        ParentModel.fromMap(parentData.data()!);
    if (Get.find<UserLoginController>().logined.value == true) {
      Get.find<UserLoginController>()
          .loginSaveData()
          .then((value) => Get.offAll(() => SplashScreen()));
    } else {
      Get.offAll(() => const ParentHomeScreen());
    }
    // Get.off(() => const StudentsMainHomeScreen());
  } else {
    showToast(msg: "Please login again");
    Get.offAll(() => const MainScreen());
    // Get.off(() => const DujoLoginScren());
  }
}

////////////////////////////////////////////////////////////////////////
Future<void> checkTeacher(FirebaseAuth auth) async {
  log("userlogin ID :  ${FirebaseAuth.instance.currentUser?.uid}");
  log("SchoolID :  ${UserCredentialsController.schoolId}");
  log("BatchID :  ${UserCredentialsController.batchId}");
  log("userrole :  ${UserCredentialsController.userRole}");
  log("Class iD :  ${UserCredentialsController.classId}");
  final teacherModel = await server
      .collection('SchoolListCollection')
      .doc(UserCredentialsController.schoolId)
      .collection('Teachers')
      .doc(auth.currentUser?.uid)
      .get();

  if (teacherModel.data() != null) {
    UserCredentialsController.teacherModel =
        TeacherModel.fromMap(teacherModel.data()!);
    if (Get.find<UserLoginController>().logined.value == true) {
      Get.find<UserLoginController>()
          .loginSaveData()
          .then((value) => Get.offAll(() => SplashScreen()));
    } else {
      Get.offAll(() => const TeachersHomeScreen());
    }
    // Get.off(() => const StudentsMainHomeScreen());
  } else {
    showToast(msg: "Please login again");
    Get.offAll(() => const MainScreen());
    // Get.off(() => const DujoLoginScren());
  }
}
