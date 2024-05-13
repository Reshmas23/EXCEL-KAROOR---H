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

class ParentImageController extends GetxController {
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
      "profileImageURL": uploadedImage,
    };
    final DocumentReference collection1 = server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection(UserCredentialsController.batchId ?? "")
        .doc(UserCredentialsController.batchId)
        .collection('classes')
        .doc(UserCredentialsController.classId)
        .collection('Parents')
        .doc(serverAuth.currentUser?.uid);

    final collection1Snapshot = await collection1.get();

    if (collection1Snapshot.exists) {
      // Update data in collection 1
      try {
        await collection1.update(updateData);
        showToast(msg: 'Profile picture updated');
      } catch (e) {
        log('Error updating profile: $e');
        showToast(msg: 'Failed to update profile picture');
      }
    } else {
      // Handle the case where the user is not found in either collection
      print('User not found in any collection');
    }
  }
}

class ParentProfileController extends GetxController {
  final getImageCtr = Get.put(ParentImageController());
  RxBool onTapEdit = false.obs;
  RxString gender = ''.obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController userRoleController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  Future updateParentProfile() async {
    final Map<String, dynamic> updateProfile = {
      "parentName": nameController.text,
      "userRole": userRoleController.text,
      "parentPhoneNumber": phoneController.text,
      "parentEmail": emailController.text,
      "gender": gender.value,
    };
    final DocumentReference parentCollection = server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection(UserCredentialsController.batchId ?? "")
        .doc(UserCredentialsController.batchId)
        .collection('classes')
        .doc(UserCredentialsController.classId)
        .collection('Parents')
        .doc(serverAuth.currentUser?.uid);

    final collection1Snapshot = await parentCollection.get();

    if (collection1Snapshot.exists) {
      // Update data in collection 1
      try {
        await parentCollection
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

  // Future fetchData() async {
  //   final DocumentSnapshot collection1 = await FirebaseFirestore.instance
  //       .collection('SchoolListCollection')
  //       .doc(serverAuth.currentUser!.uid)
  //       .get();

  // }
}
