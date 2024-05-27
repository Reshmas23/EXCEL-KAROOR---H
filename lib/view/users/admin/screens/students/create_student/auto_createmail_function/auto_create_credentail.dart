import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';

autoCreateMailDetails(BuildContext context,String studentemail,
String studentpassword,String parentemail,String parentpassword){
  showDialogeBox(
    context: context,
     barrierDismissible: false, 
    headerchild: const TextFontWidget(
      text: "Credentail For Auto Mail Create Student",
      fontsize: 14,
      fontWeight: FontWeight.bold,
    ),
    children: [
       SizedBox(
        height: 115,
        width: 350,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: TextFontWidget(
                text: "Student Email: $studentemail",
                fontsize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: TextFontWidget(
                text: "Student Passowrd : $studentpassword",
                fontsize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: TextFontWidget(
                text: "Parent Email: $parentemail",
                fontsize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: TextFontWidget(
                text: "parent Passowrd : $parentpassword",
                fontsize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      )
    ],
    actions: [
      GestureDetector(
           onTap: () => Get.back(),
        child: const TextFontWidget(
          color: cgreen,
          text: "OK ",
          fontsize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}




Future<void> showDialogeBox({
  required BuildContext context,
  bool barrierDismissible = true,
  required Widget headerchild,
  required List<Widget> children,
  required List<Widget> actions,
}) {
  return showDialog<void>(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (BuildContext context) {
      return AlertDialog(
        title: headerchild,
        content: SingleChildScrollView(
          child: ListBody(
            children: children,
          ),
        ),
        actions: actions,
      );
    },
  );
}