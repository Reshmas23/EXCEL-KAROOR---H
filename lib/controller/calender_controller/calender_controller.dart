import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vidyaveechi_website/view/constant/constant.validate.dart';

class CalenderController extends GetxController {
  DateTime date = DateTime.now();
  String monthYear = '';
  String time = '';

  TextEditingController dateCtr = TextEditingController();
  setDate({required BuildContext context, DateTime? lastDay}) async {
    final sDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: lastDay ?? DateTime(2030),
      helpText: 'Select a date',
      cancelText: 'Cancel',
      confirmText: 'OK',
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: const Color(0xFF2296F3), // Header background color
            // accentColor: Colors.white, // Selection color
            colorScheme: const ColorScheme.light(primary: Color(0xFF2296F3)),
            buttonTheme: const ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
          ),
          child: child!,
        );
      },
    );
    if (sDate != null) {
      date = sDate;
      dateCtr.text = dateConvert(sDate);
      monthYear = DateFormat('MMMM-yyyy').format(sDate);
    }
  }
}
