import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/admin_section/teacher_controller/teacher_controller.dart';
import 'package:vidyaveechi_website/model/teacher_model/teacher_model.dart';
import 'package:vidyaveechi_website/view/constant/constant.validate.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/widgets/back_button/back_button_widget.dart';
import 'package:vidyaveechi_website/view/widgets/progess_button/progress_button.dart';
import 'package:vidyaveechi_website/view/widgets/textformFiledContainer/textformFiledBlueContainer.dart';

createTeacherFunction(BuildContext context) {
  final TeacherController teacherController = Get.put(TeacherController());
  final createTeacherList = [
    TextFormFiledBlueContainerWidgetWithOutColor(
      controller: teacherController.teacherNameController,
      hintText: " Enter Teacher Name",
      title: 'Teacher Name',
      validator: checkFieldEmpty,
    ), /////////////////////////...........................0....................name
    TextFormFiledBlueContainerWidgetWithOutColor(
      controller: teacherController.teacherPhoneNumeber,
      hintText: " Enter Teacher Ph",
      title: 'Phone Number',
      validator: checkFieldPhoneNumberIsValid,
    ), //////////////////1....................number...................
    TextFormFiledBlueContainerWidgetWithOutColor(
      controller: teacherController.teacherIDController,
      hintText: " Enter Employee Id",
      title: 'Employee Id',
      validator: checkFieldEmpty,
    ), ///////////////////4.......................
    Obx(() => ProgressButtonWidget(
    
        function: () async {
           if (teacherController.formKey.currentState!.validate()) {
              teacherController.createNewTeacher( TeacherModel(
              teacherName: teacherController.teacherNameController.text,
              employeeID: teacherController.teacherIDController.text.trim(),
              teacherPhNo: teacherController.teacherPhoneNumeber.text.trim())
              );
            }
          
    //  teacherController.createNewTeacher(
    //              TeacherModel(
    //           teacherName: teacherController.teacherNameController.text,
    //           employeeID: teacherController.teacherIDController.text.trim(),
    //           teacherPhNo: teacherController.teacherPhoneNumeber.text.trim())
    //           );
        },
        buttonstate: teacherController.buttonstate.value,
        text: 'Create Teacher')),
  ];
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BackButtonContainerWidget(),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: TextFontWidget(
                text: "Create Teacher",
                fontsize: 15,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
        content: SizedBox(
          height: 380,
          width: 300,
          child: Form(
            key: teacherController.formKey,
            child: Column(
              children: [
                createTeacherList[0],
                createTeacherList[1],
                createTeacherList[2],
                createTeacherList[3],
              ],
            ),
          ),
        ),
      );
    },
  );
}