import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class AppUtils {
  static String timeStampToDateString({required int timeStamp}) {
    if (timeStamp == -1) {
      return "";
    }

    try {
      final DateTime dt = DateTime.fromMillisecondsSinceEpoch(timeStamp);
      final String d12 = DateFormat('dd-MM-yyyy').format(dt);
      return d12;
    } catch (e) {
      return "";
    }
  }

  static Future<int> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null) {}
    return picked?.millisecondsSinceEpoch ?? -1;
  }
}
