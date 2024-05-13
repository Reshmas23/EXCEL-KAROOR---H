import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vidyaveechi_website/controller/attendence_controller/attendence_controller.dart';

class SelectClassAttendenceMonthDropDown extends StatelessWidget {
  SelectClassAttendenceMonthDropDown({
    Key? key,
  }) : super(key: key);

  final attendenceController = Get.put(AttendenceController());

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
        attendenceController.fetchClassWiseMonth.clear();

        return attendenceController.fetchClassWiseMonthsfunction();
      },
      itemAsString: (value) => value,
      onChanged: (value) async {
        if (value != null) {
          attendenceController.fetchClassWiseMonthvalue.value = value;
        }
      },
      popupProps: const PopupProps.menu(
          searchFieldProps: TextFieldProps(
              decoration: InputDecoration(
                  hintText: "Search Month", border: OutlineInputBorder())),
          showSearchBox: true,
          searchDelay: Duration(microseconds: 10)),
      dropdownDecoratorProps: DropDownDecoratorProps(
          baseStyle: GoogleFonts.poppins(
              fontSize: 13, color: Colors.black.withOpacity(0.7))),
    ));
  }
}
