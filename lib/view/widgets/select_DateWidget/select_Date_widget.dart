import 'dart:developer';

import 'package:flutter/material.dart';

Future selectDateFunction(BuildContext context) async {
  try {
    DateTime? selectedDateResult;
    await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 100),
      lastDate: DateTime.now().add(const Duration(days: 356)),
    ).then((selectedDate) async {
      selectedDateResult = selectedDate;

      if (selectedDate != null) {
        selectedDateResult = selectedDate;
        return selectedDateResult;
      }
    });
    log("Selected date$selectedDateResult");
    return selectedDateResult;
  } catch (e) {
    log(e.toString());
  }
}
