import 'dart:developer';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vidyaveechi_website/view/constant/const.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';

class TeacherImageController extends GetxController {
  Rxn<Uint8List> image = Rxn();

  // for Picking images from gallery //
  pickImage() async {
    try {
      XFile? pickimage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickimage != null) {
        print("<>>>>>>>>>>>>>>>>>>>>>>>.gasudgisa");
        print(pickimage.readAsBytes());
        image.value = await pickimage.readAsBytes();
        updateProfilePicture();
        // return await pickimage.readAsBytes();
      }
    } catch (e) {
      log(e.toString());
    }
  }

  // images uploaded to firebase and return a image url //
  Future<String> uploapImageToFirebase(Uint8List image) async {
    String imageUrl = '';

    final imageName = 'image_${DateTime.now()}.jpg';
    Reference storageRef =
        FirebaseStorage.instance.ref().child('imagecollection$imageName');

    try {
      // final Uint8List imageByte = await image.readAsBytes();
      await storageRef.putData(image).whenComplete(
        () async {
          imageUrl = await storageRef.getDownloadURL();
        },
      );
      log("image uploaded to firebasefirestore");
      return imageUrl;
    } catch (e) {
      return "error";
    }
  }

  Future updateProfilePicture() async {
    // print('<<<<<<<<<<<<<<<<<<<<<<<<<<<<<${image.value}');
    String uploadedImage = await uploapImageToFirebase(image.value!);
    log('Image converted');

    final Map<String, dynamic> updateData = {
      "imageUrl": uploadedImage,
    };
    final DocumentReference collection1 = server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection('Teachers')
        .doc(serverAuth.currentUser?.uid);

    final collection1Snapshot = await collection1.get();

    if (collection1Snapshot.exists) {
      // Update data in collection 1
      try {
        await collection1.update(updateData);
        showToast(msg: 'Profile picture updated');
      } catch (e) {
        log('Error updating profile picture: $e');
        showToast(msg: 'Failed to update profile picture');
      }
    } else {
      // Handle the case where the user is not found in either collection
      print('User not found in any collection');
    }
  }
}

class TeacherProfileController extends GetxController {
  final getImageCtr = Get.put(TeacherImageController());
  RxBool onTapEdit = false.obs;
  RxString gender = ''.obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController userRoleController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  Future updateTeacherProfile() async {
    final Map<String, dynamic> updateProfile = {
      "teacherName": nameController.text,
      "userRole": userRoleController.text,
      "teacherPhNo": phoneController.text,
      "teacherEmail": emailController.text,
      "gender": gender.value,
    };
    final DocumentReference teacherCollection =  server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection('Teachers')
        .doc(serverAuth.currentUser?.uid);

    final collection1Snapshot = await teacherCollection.get();

    if (collection1Snapshot.exists) {
      // Update data in collection 1
      try {
        await teacherCollection
            .update(updateProfile)
            .then((_) => onTapEdit.value = false);
        showToast(msg: 'Profile updated');
      } catch (e) {
        log('Error updating profile: $e');
        showToast(msg: 'Failed to update profile');
      }
    } else {
      // Handle the case where the user is not found in either collection
      print('User not found in  collection');
    }
  }
}
