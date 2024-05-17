import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/admin_section/teacher_controller/teacher_controller.dart';
import 'package:vidyaveechi_website/model/teacher_model/teacher_model.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/constant/constant.validate.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/widgets/back_button/back_button_widget.dart';
import 'package:vidyaveechi_website/view/widgets/custom_showDilog/show_dialoge_box.dart';
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
            showDialogeBox(
              context: context,
              headerchild: const TextFontWidget(
                text: "Remember",
                fontsize: 14,
                fontWeight: FontWeight.bold,
              ),
              children: [
                const SizedBox(
                  height: 111,
                  width: 350,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 0),
                        child: TextFontWidget(
                          text: "User Passowrd :",
                          fontsize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: TextFontWidget(
                          text:
                              "Please find your 6-digit password for Sign UP. ",
                          fontsize: 12,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: TextFontWidget(
                          text:
                              "• Employee ID 'XXX-XXX last 2 digits\n• Phone No 'XXX-XXX last 4 digits ",
                          fontsize: 12,
                        ),
                      ),
                    ],
                  ),
                )
              ],
              actions: [
                const TextFontWidget(
                  color: cred,
                  text: "Cancel ",
                  fontsize: 14,
                  fontWeight: FontWeight.bold,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: GestureDetector(
                    onTap: () async {
                      final String subStringEmployeID = teacherController
                          .teacherIDController.text
                          .trim()
                          .substring(teacherController.teacherIDController.text
                                  .trim()
                                  .length -
                              2);
                      final String subStringPhoneNO = teacherController
                          .teacherPhoneNumeber.text
                          .trim()
                          .substring(teacherController.teacherPhoneNumeber.text
                                  .trim()
                                  .length -
                              4);
                      teacherController.createNewTeacher(
                        TeacherModel(
                          teacherName:
                              teacherController.teacherNameController.text,
                          employeeID:
                              teacherController.teacherIDController.text.trim(),
                          teacherPhNo:
                              teacherController.teacherPhoneNumeber.text.trim(),
                          password: subStringEmployeID + subStringPhoneNO,
                        ),
                      ).then((value) => Get.back());
                    },
                    child: const TextFontWidget(
                      color: themeColorBlue,
                      text: "OK TO PROCEED ",
                      fontsize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            );

            // teacherController.createNewTeacher( TeacherModel(
            // teacherName: teacherController.teacherNameController.text,
            // employeeID: teacherController.teacherIDController.text.trim(),
            // teacherPhNo: teacherController.teacherPhoneNumeber.text.trim())
            // );
          }
        },
        buttonstate: teacherController.buttonstate.value,
        text: 'Create Teacher')),
  ];
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Column(
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
