import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vidyaveechi_website/controller/all_teachers_controller/all_teachers_controller.dart';

class SelectTeacherWiseSubjectDropDown extends StatelessWidget {

  const SelectTeacherWiseSubjectDropDown({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final allteacherscontroller = Get.put(Allteacherscontroller());
    return Center(
      child: DropdownSearch(
        validator: (item) {
          if (item == null) {
            return "Required field";
          } else {
            return null;
          }
        },
        items:allteacherscontroller.teacherList,
        itemAsString: ( value) => value,
        onChanged: (value) async {
          if (value != null) {
            // Handle the selected value here
          }
        },
        popupProps: const PopupProps.menu(
          searchFieldProps: TextFieldProps(
            decoration: InputDecoration(
              // hintText: "Search Subject",
              border: InputBorder.none,
            ),
          ),
          showSearchBox: true,
          searchDelay: Duration(microseconds: 10),
        ),
        dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration: const InputDecoration(border: InputBorder.none),
          baseStyle: GoogleFonts.poppins(
            fontSize: 13,
            color: Colors.black.withOpacity(0.7),
          ),
        ),
      ),
    );
  }
}
