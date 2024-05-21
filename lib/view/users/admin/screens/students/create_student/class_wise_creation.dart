import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/admin_section/student_controller/student_controller.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/constant/constant.validate.dart';
import 'package:vidyaveechi_website/view/drop_down/select_class.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/widgets/progess_button/progress_button.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';
import 'package:vidyaveechi_website/view/widgets/textformFiledContainer/textformFiledBlueContainer.dart';

class ClassWiseStudentCreation extends StatelessWidget {
  final StudentController studentController = Get.put(StudentController());

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ClassWiseStudentCreation({super.key});

  @override
  Widget build(BuildContext context) {
    final classSWiseCreationList = [
      const TextFontWidget(
        text: 'Add New Student',
        fontsize: 18,
        fontWeight: FontWeight.bold,
      ), //////////////////////...............0
      Container(
        height: ResponsiveWebSite.isMobile(context) ? 80 : 100,
        color: cWhite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextFontWidget(text: 'Class *', fontsize: 12.5),
            const SizedBox(
              height: 05,
            ),
            SizedBox(
              height: 40,
              child: SelectClassDropDown(),
            ),
          ],
        ),
      ), //////////////////...........1

      TextFormFiledBlueContainerWidget(
        controller: studentController.stNameController,
        hintText: "Enter Student Name",
        title: 'Student Name',
        validator: checkFieldEmpty,
      ), ///////////////////..........2
      TextFormFiledBlueContainerWidget(
        controller: studentController.stPhoneController,
        hintText: "Enter Student Ph",
        title: 'Phone Number',
        validator: checkFieldPhoneNumberIsValid,
      ), /////////////.............3
      Obx(() => ProgressButtonWidget(
          function: () async {
            if (_formKey.currentState!.validate()) {
              final String subStringAdNo =
                  studentController.stAdNoController.text.trim().substring(
                      studentController.stAdNoController.text.trim().length -
                          2);
              final String subStringPhoneNO =
                  studentController.stPhoneController.text.trim().substring(
                      studentController.stPhoneController.text.trim().length -
                          4);
              await studentController.classWiseStudentCreation(
                  password: subStringAdNo + subStringPhoneNO);
            }
          },
          buttonstate: studentController.buttonstate.value,
          text: 'Create Student')), ////////////////////////////.............4
      TextFormFiledBlueContainerWidget(
        controller: studentController.stAdNoController,
        hintText: "Enter Student Admission ID",
        title: 'Admission No',
        validator: checkFieldEmpty,
      ),
    ];
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.only(
            top: ResponsiveWebSite.isMobile(context) ? 20 : 10,
            left: 8,
            right: 8),
        child: Container(
          color: cWhite,
          height: 600,
          width: double.infinity,
          child: Padding(
              padding: EdgeInsets.only(
                  top: ResponsiveWebSite.isMobile(context) ? 20 : 10),
              child: ResponsiveWebSite.isMobile(context)
                  ? Column(
                      children: [
                        classSWiseCreationList[0], //////heading
                        Padding(
                          padding: EdgeInsets.only(
                              top: ResponsiveWebSite.isMobile(context)
                                  ? 20
                                  : 30),
                          child: classSWiseCreationList[1], ////.....class
                        ),
                         classSWiseCreationList[
                            5],
                        classSWiseCreationList[
                            2], ////////////..............enter name
                        classSWiseCreationList[
                            3], ////////////........enter ph.no
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: classSWiseCreationList[4],
                        ), ////////////............create button
                      ],
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          classSWiseCreationList[0], //////heading
                          Padding(
                            padding: EdgeInsets.only(
                                top: ResponsiveWebSite.isMobile(context)
                                    ? 20
                                    : 30),
                            child: SizedBox(
                                width: 370,
                                child:
                                    classSWiseCreationList[1]), ////.....class
                          ),
                                SizedBox(
                            width: 370,
                            child: classSWiseCreationList[5],
                          ), 
                          SizedBox(
                            width: 370,
                            child: classSWiseCreationList[2],
                          ), ////////////..............enter name
                          SizedBox(
                              width: 370,
                              child: classSWiseCreationList[
                                  3]), ////////////........enter ph.no
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: classSWiseCreationList[4],
                          ), ////////////............create butto
                        ],
                      ),
                    )),
        ),
      ),
    );
  }
}
