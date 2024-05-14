import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/class_controller/class_controller.dart';
import 'package:vidyaveechi_website/view/drop_down/allStudent.dart';
import 'package:vidyaveechi_website/view/widgets/custom_showDilog/custom_showdilog.dart';

addStudentToClass(BuildContext context, String classDocid) {
  Get.find<ClassController>().allstudentList.clear();
  customShowDilogBox2(
    context: context,
    title: 'All Student',
    children: [AllStudentDropDown()],
    doyouwantActionButton: true,
    actiononTapfuction: () async {
      await Get.find<ClassController>().addStudentToClassController(classDocid);
      Navigator.pop(context);
    },
  );
}
