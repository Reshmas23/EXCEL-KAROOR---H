import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vidyaveechi_website/model/student_model/student_model.dart';

import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';

class SelectStudentsDropDown extends StatelessWidget {
  SelectStudentsDropDown({
    Key? key,
  }) : super(key: key);

  final classCtrl = Get.put(StudentsController());

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
        classCtrl.allStudentsList.clear();

        return classCtrl.fetchStudent();
      },
      itemAsString: (value) => value.studentName,
      onChanged: (value) async {
        if (value != null) {
          classCtrl.studentName = value.studentName;
          classCtrl.studentId = value.docid;
        }
      },
      popupProps: const PopupProps.menu(
          searchFieldProps: TextFieldProps(
              decoration: InputDecoration(
                  hintText: "Search Student", border: OutlineInputBorder())),
          showSearchBox: true,
          searchDelay: Duration(microseconds: 10)),
      dropdownDecoratorProps: DropDownDecoratorProps(
          baseStyle: GoogleFonts.poppins(
              fontSize: 13, color: Colors.black.withOpacity(0.7))),
    ));
  }
}

class StudentsController extends GetxController {
  List<StudentModel> allStudentsList = [];
  String studentName = '';
  String studentId = '';
  

  Future<List<StudentModel>> fetchStudent() async {
    final firebase = await server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection('AllStudents')
        .get();

    allStudentsList =
        firebase.docs.map((e) => StudentModel.fromMap(e.data())).toList();

    // for (var i = 0; i < firebase.docs.length; i++) {
    //   final list =
    //       firebase.docs.map((e) => StudentModel.fromMap(e.data())).toList();
    //   allclassList.add(list[i]);
    // }
    return allStudentsList;
  }
}