import 'dart:developer';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vidyaveechi_website/controller/class_controller/class_controller.dart';
import 'package:vidyaveechi_website/model/class_model/class_model.dart';

class SelectClassDropDownLogin extends StatelessWidget {
  SelectClassDropDownLogin({
    Key? key,
  }) : super(key: key);

  final classCtrl = Get.put(ClassController());

  @override
  Widget build(BuildContext context) {
    return Center(
        child: DropdownSearch<ClassModel>(

        //  dropdownDecoratorProps: DropDownDecoratorProps(dropdownSearchDecoration: InputDecoration(labelText: 'Select Class')),
      validator: (item) {
        if (item == null) {
          return "Select Class";
        } else {
          return null;
        }
      },


      // autoValidateMode: AutovalidateMode.always,

      asyncItems: (value) {
        classCtrl.allclassList.clear();

        return classCtrl.userloginfetchClass();
      },
      itemAsString: (value) => value.className,
      onChanged: (value) async {
        if (value != null) {
          classCtrl.className.value = value.className;
          classCtrl.classDocID.value = value.docid;
          log("message ${classCtrl.classDocID.value}");
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
