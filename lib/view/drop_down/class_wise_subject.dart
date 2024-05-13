import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vidyaveechi_website/controller/subject_controller/subject_controller.dart';
import 'package:vidyaveechi_website/model/subject_model/subject_model.dart';

class SelectClassWiseSubjectDropDown extends StatelessWidget {
  SelectClassWiseSubjectDropDown({
    Key? key,
  }) : super(key: key);

  final subjectCtrl = Get.put(SubjectController());

  @override
  Widget build(BuildContext context) {
    return Center(
        child: DropdownSearch<SubjectModel>(
      validator: (item) {
        if (item == null) {
          return "Required field";
        } else {
          return null;
        }
      },

      // autoValidateMode: AutovalidateMode.always,
      asyncItems: (value) {
        subjectCtrl.classwiseSubjectList.clear();

        return subjectCtrl.fetchClassWiseSubject();
      },
      itemAsString: (value) => value.subjectName,
      onChanged: (value) async {
        if (value != null) {
          subjectCtrl.subjectName.value = value.subjectName;
          subjectCtrl.subjectID.value = value.docid;
          subjectCtrl.subjectColor.value = value.subjectColor;

        }
      },
      popupProps: const PopupProps.menu(
          searchFieldProps: TextFieldProps(
              decoration: InputDecoration(
                  hintText: "Search Subject", border: OutlineInputBorder())),
          showSearchBox: true,
          searchDelay: Duration(microseconds: 10)),
      dropdownDecoratorProps: DropDownDecoratorProps(
          baseStyle: GoogleFonts.poppins(
              fontSize: 13, color: Colors.black.withOpacity(0.7))),
    ));
  }
}
