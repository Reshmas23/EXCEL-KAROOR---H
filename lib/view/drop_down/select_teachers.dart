import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:vidyaveechi_website/model/teacher_model/teacher_model.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';

class SelectTeachersDropDown extends StatelessWidget {
  SelectTeachersDropDown({
    Key? key,
  }) : super(key: key);

  final classCtrl = Get.put(TeachersController());

  @override
  Widget build(BuildContext context) {
    return Center(
        child: DropdownSearch<TeacherModel>(
      validator: (item) {
        if (item == null) {
          return "Required field";
        } else {
          return null;
        }
      },

      // autoValidateMode: AutovalidateMode.always,

      asyncItems: (value) {
        classCtrl.allTeacherList.clear();

        return classCtrl.fetchTeacher();
      },
      itemAsString: (value) => value.teacherName!,
      onChanged: (value) async {
        if (value != null) {
          classCtrl.teacherName = value.teacherName!;
          classCtrl.teacherId = value.docid!;
        }
      },
      popupProps: const PopupProps.menu(
          searchFieldProps: TextFieldProps(
              decoration: InputDecoration(
                  hintText: "Search Class", border: OutlineInputBorder())),
          showSearchBox: true,
          searchDelay: Duration(microseconds: 10)),
      dropdownDecoratorProps: DropDownDecoratorProps(
          baseStyle: GoogleFonts.poppins(
              fontSize: 13, color: Colors.black.withOpacity(0.7))),
    ));
  }
}

class TeachersController extends GetxController {
  List<TeacherModel> allTeacherList = [];
  String teacherName = '';
  String teacherId = '';

  Future<List<TeacherModel>> fetchTeacher() async {
    final firebase = await server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection('Teachers')
        .get();

    allTeacherList =
        firebase.docs.map((e) => TeacherModel.fromMap(e.data())).toList();

    // for (var i = 0; i < firebase.docs.length; i++) {
    //   final list =
    //       firebase.docs.map((e) => TeacherModel.fromMap(e.data())).toList();
    //   allclassList.add(list[i]);
    // }
    return allTeacherList;
  }
}