import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/timetable_controller/timetable_controller.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/google_poppins_widget.dart';

class BackButtonContainerWidget extends StatelessWidget {
  const BackButtonContainerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        final timeTableController = Get.put(TimeTableController());

        timeTableController.periodController.clear();
        timeTableController.subjectNamecontroller.clear();
        timeTableController.startTimeviewController.clear();
        timeTableController.endTimeviewController.clear();
      },
      child: Container(
        height: 30,
        width: 80,
        decoration: const BoxDecoration(
          color: themeColorBlue,
        ),
        child: Center(
          child: GooglePoppinsWidgets(
              text: 'BACK', color: cWhite, fontsize: 12, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

warningShowDilogueBox(
    {required BuildContext context,
    required String title,
    required String discripition,
    required void Function()? onPressed}) {
  return showDialog(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[Text(discripition)],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: onPressed,
            child: const Text('ok'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('cancel'),
          ),
        ],
      );
    },
  );
}
