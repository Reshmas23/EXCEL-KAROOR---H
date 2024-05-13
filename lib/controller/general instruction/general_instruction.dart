import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:vidyaveechi_website/model/general_instruction_model/general_instruction.dart';
import 'package:vidyaveechi_website/view/constant/const.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';

class GeneralInsructionController extends GetxController {
   TextEditingController instructionController =TextEditingController();
      TextEditingController timeController =TextEditingController();
    RxList<String> instructionList = <String>[].obs;
    RxBool isLoading = false.obs;
      final formKey = GlobalKey<FormState>();


    Future<void> addGeneralInstructions() async{
       final uuid =const  Uuid().v1();
       final generalInstructionsDetails = GeneralInstructionsModel(
        instruction: instructionController.text, 
        instructionId: uuid, 
        time: DateTime.now().toString()) ;
        try{
          await server
          .collection('SchoolListCollection')
          .doc(UserCredentialsController.schoolId)
          .collection(UserCredentialsController.batchId!)
          .doc(UserCredentialsController.batchId!)
          .collection('Admin_general_instructions')
          .doc(generalInstructionsDetails.instructionId)
          .set(generalInstructionsDetails.toMap())
          .then((value) async {
            instructionController.clear();
          });
         
        }  catch (e) { showToast(msg: 'Instruction Not Created');}
    }

     Future<void> removeInstruction(String instructionId,BuildContext context ) async {
             final uuid =const  Uuid().v1();
       // ignore: unused_local_variable
       final generalInstructionsDetails = GeneralInstructionsModel(
        instruction: instructionController.text, 
        instructionId: uuid, 
        time: DateTime.now().toString()) ;
    try {
      isLoading.value = true;
      server
          .collection('SchoolListCollection')
          .doc(UserCredentialsController.schoolId)
          .collection(UserCredentialsController.batchId!)
          .doc(UserCredentialsController.batchId!)
          .collection('Admin_general_instructions')
          .doc(instructionId)
          .delete()
          .then((value) => Navigator.pop(context ));
      isLoading.value = false;
      showToast(msg: 'Deleted Successfully');
    } catch (e) {
      showToast(msg: 'Failed');
      isLoading.value = false;
    }
  }

  Future<void> updateInstructions(String instructionId,BuildContext context) async {
       final uuid =const  Uuid().v1();
       // ignore: unused_local_variable
       final generalInstructionsDetails = GeneralInstructionsModel(
        instruction: instructionController.text, 
        instructionId: uuid, 
        time: DateTime.now().toString()) ;
    try {
      isLoading.value = true;
    server
          .collection('SchoolListCollection')
          .doc(UserCredentialsController.schoolId)
          .collection(UserCredentialsController.batchId!)
          .doc(UserCredentialsController.batchId!)
          .collection('Admin_general_instructions')
          .doc(instructionId)
          .update(
        {
         "instruction": instructionController.text,
          "time": DateTime.now().toString(),
        },
      )
      .then((value) => Navigator.pop(context ));
      isLoading.value = false;
      instructionController.clear();
      showToast(msg: 'Updated Succesfully');
    } catch (e) {
      showToast(msg: 'Updation Failed');
      isLoading.value = false;
    }
  }
}