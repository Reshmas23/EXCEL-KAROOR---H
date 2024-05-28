import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';

import '../../view/utils/firebase/firebase.dart';



class CardController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController classController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController parentNameController = TextEditingController();
  TextEditingController dateofbirthController = TextEditingController();
  TextEditingController admissionController = TextEditingController();
  RxList<String> classes = <String>[].obs;
  RxInt onTapValue =int.parse('0000').obs;
  Future <void> increaseFunction()async{
    onTapValue.value++;
    
  }
   Future <void> decreaseFunction()async{
    onTapValue.value--;


    
  }
   Future<void> enableDelete(
    String docId,
  ) async {
    server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection('AllStudents')
        .doc(docId)
        .delete();

    print(
      docId,
    );
  }
  



}



     
// }   






