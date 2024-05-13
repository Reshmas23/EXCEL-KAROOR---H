import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vidyaveechi_website/view/splash_screen/splash_screen.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';
import 'package:vidyaveechi_website/view/widgets/drop_DownList/schoolDropDownList.dart';

import '../../view/constant/const.dart';

class BatchYearController extends GetxController {
  TextEditingController frombatchController = TextEditingController();
  TextEditingController tobatchController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  List<String> allbatchList = [];
  RxString batchyearValue = ''.obs;
  Future<List<String>> fetchBatchyear() async {
    final firebase = await server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection("BatchYear")
        .get();

    for (var i = 0; i < firebase.docs.length; i++) {
      final list = firebase.docs[i].data()['id'];
      allbatchList.add(list);
    }
    return allbatchList;
  }

  Future<void> setBatchYear() async {
    await SharedPreferencesHelper.setString(
            SharedPreferencesHelper.batchIdKey, batchyearValue.value)
        .then((value) async {
      Get.offAll(() => SplashScreen());
    });
  }

  Future<void> addBatchyear() async {
    // final userDetails =CreateNewAdninModel(docid: user!.uid, name: adminUserNameController.text, gender: gender.value, password: passwordController.text, email: emailController.text, phoneNumber: phoneNumberController.text);
    // setState(() {
    //   loadingStatus = true;
    // });

    try {
      await FirebaseFirestore.instance
          .collection('SchoolListCollection')
          .doc(UserCredentialsController.schoolId)
          .collection('BatchYear')
          .doc(
              '${frombatchController.text.trim()}-${tobatchController.text.trim()}')
          .set({
            'id':
                '${frombatchController.text.trim()}-${tobatchController.text.trim()}'
          })
          .then((value) => showToast(msg: 'New Batch Created Created'))
          .then((value) => {
                frombatchController.clear(),
                tobatchController.clear(),
              });
    } on FirebaseAuthException catch (e) {
      showToast(msg: e.code);
      log('Create batch  $e');
    } catch (e) {
      log(e.toString());
    }

    // setState(() {
    //   loadingStatus = false;
    // });
  }

  Future<void> enableDelete(
    String batchId,
  ) async {
    server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection('BatchYear')
        .doc(batchId)
        .delete();

    print(
      batchId,
    );
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
      String formattedDate = DateFormat('yyyy-MMMM').format(pickedDate);
      controller.text = formattedDate;
    }
  }

  Future<List<String>> userloginfetchBatchyear() async {
    final firebase = await server
        .collection('SchoolListCollection')
        .doc(schoolListValue['docid'])
        .collection("BatchYear")
        .get();

    for (var i = 0; i < firebase.docs.length; i++) {
      final list = firebase.docs[i].data()['id'];
      allbatchList.add(list);
    }
    return allbatchList;
  }
}
