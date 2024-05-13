import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vidyaveechi_website/controller/admin_section/student_controller/student_controller.dart';
import 'package:vidyaveechi_website/model/student_model/student_model.dart';

class SelectCStudentClassWiseDropDown extends StatelessWidget {
  SelectCStudentClassWiseDropDown({
    Key? key,
  }) : super(key: key);

  final studentController = Get.put(StudentController());

  @override
  Widget build(BuildContext context) {
    return Center(
        child: DropdownSearch<StudentModel>(
      validator: (item) {
        if (item == null) {
          return "Required field";
        } else {
          return null;
        }
      },

      // autoValidateMode: AutovalidateMode.always,
      asyncItems: (value) {
        studentController.studentclasswiseList.clear();

        return studentController.fetchStudentClassWise();
      },
      itemAsString: (value) => value.studentName,
      onChanged: (value) async {
        if (value != null) {
          studentController.stdClassWiseValue.value = value.docid;
        }
      },
      dropdownDecoratorProps: DropDownDecoratorProps(
          baseStyle: GoogleFonts.poppins(
              fontSize: 13, color: Colors.black.withOpacity(0.7))),
    ));
  }
}
