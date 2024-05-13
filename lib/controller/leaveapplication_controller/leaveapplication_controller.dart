import 'dart:developer';

import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/class_controller/class_controller.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';

class LeaveApplicationController extends GetxController {
  List<String> fetchClassWiseDate = [];
RxString fetchClassWiseDatevalue = 'dd'.obs;
  RxBool leaveApplication = true.obs;

 Future<List<String>> fetchClassWiseDatefunction() async {
    try {
      await server
          .collection('SchoolListCollection')
          .doc(UserCredentialsController.schoolId)
          .collection(UserCredentialsController.batchId!)
          .doc(UserCredentialsController.batchId!)
          .collection('classes')
          .doc(Get.find<ClassController>().classDocID.value)
          .collection('LeaveApplication')
          .get()
          .then((value) {
        for (var i = 0; i < value.docs.length; i++) {
          fetchClassWiseDate.add(value.docs[i].data()['docid']);
        } 
      });
    } catch (e) {
      log(e.toString());
    }
       
    return fetchClassWiseDate; 
  } 
  
} 