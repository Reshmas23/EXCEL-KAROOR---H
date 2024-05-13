import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vidyaveechi_website/controller/admin_section/teacher_controller/teacher_controller.dart';


class SelectTeacherAttendenceDayDropDown extends StatelessWidget {
  SelectTeacherAttendenceDayDropDown({
    Key? key,
  }) : super(key: key);

  final attendenceController = Get.put(TeacherController());

  @override
  Widget build(BuildContext context) {
    return Center(
        child: DropdownSearch(
      validator: (item) {
        if (item == null) {
          return "Required field";
        } else {
          return null;
        }
      },


      asyncItems: (value) {
        attendenceController.teacherAttendeceMonthList.clear();

        return attendenceController.fetchTeacherAttenceMonthfunction();
      },
      itemAsString: (value) => value,
      onChanged: (value) async {
        if (value != null) {
          attendenceController.selectedMonthView.value = value;
        }
      },
      popupProps: const PopupProps.menu(
          searchFieldProps: TextFieldProps(
              decoration: InputDecoration(
                  hintText: "Search Day", border: OutlineInputBorder())),
          showSearchBox: true,
          searchDelay: Duration(microseconds: 10)),
      dropdownDecoratorProps: DropDownDecoratorProps(
          baseStyle: GoogleFonts.poppins(
              fontSize: 13, color: Colors.black.withOpacity(0.7))),
    ));
  }
}
