import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/registration/model/registration_model.dart';

class RegisterController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController classController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController parentNameController = TextEditingController();
  TextEditingController dateofbirthController = TextEditingController();
  RxList<String> classes = <String>[].obs;

  Future<void> registerUser(String docid) async {
    final userDetails = RegisterModel(
        docid: docid,
        userName: nameController.text,
        userClass: classController.text,
        userEmail: emailController.text,
        phoneNumber: phoneController.text,
        parentName: parentNameController.text,
        dateofBirth: dateofbirthController.text);
    final firebase = FirebaseFirestore.instance;
    await firebase
        .collection('Registeruser')
        .doc(docid)
        .set(userDetails.toMap());
    nameController.clear();
    classController.clear();
    emailController.clear();
    phoneController.clear();
    parentNameController.clear();
    dateofbirthController.clear();
  }

  Future<List<RegisterModel>> fetchUserData() async {
    final firebase = FirebaseFirestore.instance;
    final querySnapshot = await firebase.collection('Registeruser').get();

    return querySnapshot.docs
        .map((doc) => RegisterModel.fromMap(doc.data()))
        .toList();
  }

}



     
// }   






