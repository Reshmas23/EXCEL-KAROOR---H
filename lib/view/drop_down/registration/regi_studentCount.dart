import 'dart:developer';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vidyaveechi_website/controller/registration_controller/registation_controller.dart';
import 'package:vidyaveechi_website/model/registation_student_count_model.dart/registration_studentCount_model.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';

class SelectRegClassStudntCountDropDown extends StatelessWidget {
  SelectRegClassStudntCountDropDown({
    Key? key,
  }) : super(key: key);

  final classCtrl = Get.put(RegistrationController());

  @override
  Widget build(BuildContext context) {
    return Center(
        child: DropdownSearch<RegistrationStudentCountModel>(
      //  dropdownDecoratorProps: DropDownDecoratorProps(dropdownSearchDecoration: InputDecoration(labelText: 'Select Class')),
      validator: (item) {
        if (item == null) {
          return "Required field";
        } else {
          return null;
        }
      },

      // autoValidateMode: AutovalidateMode.always,

      asyncItems: (value) {
        classCtrl.allClasswiseRegStudents.clear();

        return classCtrl.fetchClassStudent();
      },
      itemAsString: (value) =>
          '${value.className}  ${value.studentCount == 0 ? '' : '(${value.studentCount})'}',
      onChanged: (value) async {
        if (value != null) {
          classCtrl.classRegClassName.value = value.className;
          classCtrl.classRegClassID.value = value.classID;
          log("message ${classCtrl.classDocID.value}");
          try {
            log("message...............");
            await server
                .collection('SchoolListCollection')
                .doc(UserCredentialsController.schoolId)
                .collection(UserCredentialsController.batchId!)
                .doc(UserCredentialsController.batchId)
                .collection('RegStudentsNotifierCounter')
                .doc('count')
                .update({'counter': classCtrl.classRegClassCount.value});
          } catch (e) {
            log("XXXXXXx");
            log(e.toString());
          }
        }
      },
      popupProps: const PopupProps.menu(
          searchFieldProps: TextFieldProps(
              decoration: InputDecoration(
                  hintText: "Search Class", border: OutlineInputBorder())),
          showSearchBox: true,
          searchDelay: Duration(microseconds: 10)),
      dropdownDecoratorProps: DropDownDecoratorProps(
          // dropdownSearchDecoration: InputDecoration(labelText: 'Select Class',),
          baseStyle: GoogleFonts.poppins(
              fontSize: 13, color: Colors.black.withOpacity(0.7))),
    ));
  }
}
