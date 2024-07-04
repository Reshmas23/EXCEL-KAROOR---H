import 'dart:developer';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:uuid/uuid.dart';
import 'package:vidyaveechi_website/view/constant/const.dart';
import 'package:vidyaveechi_website/view/web_DashBoard/pages/client_management/model/create_client_model.dart';

class ClientManagementController extends GetxController {
   final FirebaseStorage _cstorage = FirebaseStorage.instance;
    final FirebaseStorage _fstorage = FirebaseStorage.instance;
 String clientImageUrl = '';
 String clientFilep='';
//  String followUpDate='';
  var isUploading = false.obs;
  // For Selected Date
  RxString dobSelectedDate =''.obs;
  RxString marriageSelectedDate =''.obs;
  RxString enteredSelectedDate =''.obs;
  RxString seperationSelectedDate =''.obs;
  RxString followUpDateSelectedDate =''.obs;
  Rxn<Uint8List>  imagePath = Rxn();
  Rxn<Uint8List>  filePath = Rxn();
  final firebase = FirebaseFirestore.instance
      .collection('ClientManagement')
      .doc('ClientManagement');

  Future<void> addclientDetailsToSever({
    required String clientName,
    required String caseNo,
    required String mobileNo,
    required String emailID,
    required String gender,
    required String dob,
    required String marriageDate,
    required String typeofcase,
    required String address,
    required String casediscription,
    required String oppositeadvocate,
    required String state,
    required String typeofMarriage,
    required String seperationDate,
     String? noofChildren,
    required String enteredDate,
    required String enterBy,
   required String  clientoccupation,
    String? whatsAppNo, 
    required BuildContext context,
  }) async {
    CreateClientClassModel clientDetails = CreateClientClassModel(
        clientName: clientName,
        caseNo: caseNo,
        index:0,
        mobileNo: mobileNo,
        emailID: emailID,
        gender: gender,
        dob: dob,
        marriageDate: marriageDate,
        typeofcase: typeofcase,
        address: address,
        casediscription: casediscription,
        oppositeadvocate: oppositeadvocate,
        state: state,
        typeofMarriage: typeofMarriage,
        seperationDate: seperationDate,
        noofChildren: noofChildren,
        enteredDate: enteredDate,
        enterBy: enterBy,
        clientoccupation:  clientoccupation,
        whatsAppNo: whatsAppNo);

    /// Adding details to firebase
   try {
      await checkingIndexinCollection().then((value) async {
        await firebase
            .collection('Cases')
            .doc(caseNo)
            .set(clientDetails.toMap())
            .then((value) async {
          await firebase
              .collection('Cases')
              .doc(caseNo)
              .update({'index': await addIndexToClient()});
        }).then((value) {
          showToast(msg: "Added Successfully");
          Navigator.pop(context);
        });
      });
    } catch (e) {}
  }

  Future<void> deActivateThisClient({
  required String clientName,
  required String caseNo,
  required String mobileNo,
  required String whatsAppNo,
  required String emailID,
  required String gender,
  required String dob,
  required String marriageDate,
  required String typeofcase,
  required String clientoccupation,
  required String address,
  required String casediscription,
  required String oppositeadvocate,
  required String typeofMarriage,
  required String noofChildren,
  required String seperationDate,
  required String enteredDate,
  required String enterBy,
  String? clientImage,
  String? clientFile,
  required String state,
  String? followUpDate,
  required BuildContext context,
  }) async {
    try {
      CreateClientClassModel clientDetails = CreateClientClassModel(
          index: 0,
          clientName:clientName,
         caseNo: caseNo,
          mobileNo: mobileNo,
          emailID: emailID,
          gender: gender,
          dob: dob,
          marriageDate: marriageDate,
          typeofcase: typeofcase,
          address: address,
          casediscription: casediscription,
          clientoccupation:clientoccupation,
          oppositeadvocate: oppositeadvocate,
          typeofMarriage:typeofMarriage,
          noofChildren:noofChildren,
          seperationDate:seperationDate,
          enteredDate:enteredDate,
          state: state,
          enterBy:enterBy,
          followUpDate: followUpDate,
          clientImage:clientImage,
          clientFile:clientFile,
          whatsAppNo: whatsAppNo);
      await firebase
          .collection('Closed Cases')
          .doc(caseNo)
          .set(clientDetails.toMap())
          .then((value) async {
        await firebase.collection('Cases').doc(caseNo).delete();
      }).then((value) {
        showToast(msg: "Closed Successfully");
        Navigator.pop(context);
      });
    // ignore: empty_catches
    } catch (e) {}
  }

  Future<void> checkingIndexinCollection() async {
    DocumentSnapshot<Map<String, dynamic>> getingIndex = await firebase.get();
    final result = await getingIndex.data()?['index'];

    log("message   ${getingIndex.data()?['index']}");
    if (getingIndex.data()?['index'] == null) {
      await firebase.set({'index': 1});
    } else {
      await firebase.update({'index': result + 1});
    }
  }

  Future addIndexToClient() async {
    DocumentSnapshot<Map<String, dynamic>> getingIndex = await firebase.get();
    int index = 0;
    if (getingIndex.data()?['index'] == null) {
      await firebase.set({'index': 1});
    } else {
      int result = await getingIndex.data()!['index'];
      index = result;
    }

    return index;
  }

  Future<void> changeIndexClientInFirebase(
      {required String docid,
      required int index,
      required BuildContext context}) async {
    await firebase
        .collection('Cases')
        .doc(docid)
        .update({'index': index}).then((value) {
      showToast(msg: "Changed Successfully");
      Navigator.pop(context);
    });
  }
  Future<void> uploadImage(Uint8List imagepath, String storagePath) async {
        final String uid = const Uuid().v1();
    isUploading(true);

    final ref = _cstorage
        .ref()
        .child('clientMangement')
        .child('Images')
        .child('${uid}image.jpg');
    final uploadTask = ref.putData(imagepath);

    await uploadTask.whenComplete(() async {
      final String downloadURL = await ref.getDownloadURL();
      clientImageUrl = downloadURL;

      isUploading(false);

      showToast(msg: 'Image Uploaded Successfully');
      log("Getx Valuee --->>.$clientImageUrl");
    });
  }
  Future<void> uploadFile(Uint8List filepath, String storagePath) async {
        final String uid =  const Uuid().v1();
    isUploading(true);

    final ref = _fstorage
        .ref()
        .child('clientManagement')
        .child('File')
        .child('$uid.pdf');
    final uploadTask = ref.putData(filepath);

    await uploadTask.whenComplete(() async {
      final String downloadURL = await ref.getDownloadURL();
      clientFilep = downloadURL;

      isUploading(false);

      showToast(msg: 'File Uploaded Successfully');
      log("Getx Value --->>.$clientFilep");
    });
  }
pickFileFunction({required String format}) async {
  final String uid = const Uuid().v1();
  FirebaseStorage storage = FirebaseStorage.instance;
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['jpg', 'pdf', 'doc'],
  );
  if (result != null) {
    final ref = storage
    .ref()
    .child('ImageBucket')
    .child('Files')
    .child("$uid.$format");
    ref.putData(result.files.first.bytes!)
    .whenComplete(() async {
      final String downloadUrl = await ref.getDownloadURL();
      // ignore: avoid_print
      print("Download url From FireBase $downloadUrl");
    });

    // ignore: avoid_print
    print("message ${result.files.first.bytes}");
  } else {
    // User canceled the picker
  }
}
addFollowUpDateToFirebase()async {
final firebase = FirebaseFirestore.instance;
const caseNo="caseNo";
await firebase
      .collection('ClientManagement')
      .doc('ClientManagement')
      .collection("Cases")
      .doc(caseNo)
      //.collection('followUpDate')
      .set({'followUpDate':followUpDateSelectedDate.value});
}

  // addFollowUpDateToFirebase()async {
  //   final firebase =  FirebaseFirestore.instance;
  //   await firebase
  //   .collection('ClientManagement')
  //   .doc('clientManagement')
  //   .set(clientDetails.toMap())
  //         .then((value) async {
  //       await firebase.collection('Cases').doc(caseNo).add({'followUpDate':followUpDateSelectedDate.value});
  //     }).then((value) {
  //       showToast(msg: "Added Successfully");
  //       Navigator.pop(context as BuildContext);
  //   });
  // }
}
