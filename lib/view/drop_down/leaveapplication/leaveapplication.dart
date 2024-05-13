import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vidyaveechi_website/controller/leaveapplication_controller/leaveapplication_controller.dart';

class SelectLeaveApplicationDate extends StatelessWidget {
  SelectLeaveApplicationDate({
    Key? key,
  }) : super(key: key);

  final leaveapplicationcontroller = Get.put(LeaveApplicationController());

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
        leaveapplicationcontroller.fetchClassWiseDate.clear();

        return leaveapplicationcontroller.fetchClassWiseDatefunction();
      },
      itemAsString: (value) => value,
      onChanged: (value) async {
        if (value != null) {
          leaveapplicationcontroller.fetchClassWiseDatevalue.value = value;
          // print(leaveapplicationcontroller.fetchClassWiseDatevalue.value);
        }
      },
      popupProps: const PopupProps.menu(
          searchFieldProps: TextFieldProps(
              decoration: InputDecoration(hintText: "Search Day", border: OutlineInputBorder())),
          showSearchBox: true,
          searchDelay: Duration(microseconds: 10)),
      dropdownDecoratorProps: DropDownDecoratorProps(
          baseStyle: GoogleFonts.poppins(fontSize: 13, color: Colors.black.withOpacity(0.7))),
    ));
  }
}
