import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:vidyaveechi_website/controller/exam_result_controller/exam_result_controller.dart';

class SelectClassExamDropDown extends StatelessWidget {
  SelectClassExamDropDown({
    Key? key,
    required this.classId,
  }) : super(key: key);

  final String classId;
  final classCtrl = Get.put(ExamResultController());

  @override
  Widget build(BuildContext context) {
    return Center(
        child: DropdownSearch<String>(
      validator: (item) {
        if (item == null) {
          return "Required field";
        } else {
          return null;
        }
      },
      // autoValidateMode: AutovalidateMode.always,

      asyncItems: (value) {
        classCtrl.examList.clear();

        return classCtrl.fetchExamClass(classId: classId);
      },
      itemAsString: (value) => value,
      onChanged: (value) async {
        if (value != null) {
          // classCtrl.className.value = value.className;
          // classCtrl.classDocID.value = value.docid;
          classCtrl.examId.value = value;
        }
      },
      popupProps: const PopupProps.menu(
          searchFieldProps: TextFieldProps(
              decoration: InputDecoration(
                  hintText: "Search Exam", border: OutlineInputBorder())),
          showSearchBox: true,
          searchDelay: Duration(microseconds: 10)),
      dropdownDecoratorProps: DropDownDecoratorProps(
          baseStyle: GoogleFonts.poppins(
              fontSize: 13, color: Colors.black.withOpacity(0.7))),
    ));
  }
}
