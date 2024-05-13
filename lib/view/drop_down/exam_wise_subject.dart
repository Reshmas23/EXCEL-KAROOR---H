import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vidyaveechi_website/controller/exam_result_controller/exam_result_controller.dart';
import 'package:vidyaveechi_website/controller/subject_controller/subject_controller.dart';

class SelectExamWiseSubjectDropDown extends StatelessWidget {
  SelectExamWiseSubjectDropDown({
    Key? key,
  }) : super(key: key);

  final subjectCtrl = Get.put(SubjectController());
  final examCtrl = Get.put(ExamResultController());

  @override
  Widget build(BuildContext context) {
    return Center(
        child: DropdownSearch<DocumentSnapshot>(
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

        return subjectCtrl.fetchExamWiseSubject(examCtrl.examId.value);
      },
      itemAsString: (value) => value['subject'],
      onChanged: (value) async {
        if (value != null) {
          subjectCtrl.subjectName.value = value['subject'];
          subjectCtrl.subjectID.value = value['subjectid'];
          examCtrl.getNumberOfTotalStudentAttendExamInClass();
          examCtrl.getNumberOfStudentPassedExamInClass();
          examCtrl.getClassExamResultList();
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
