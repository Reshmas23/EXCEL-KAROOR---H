import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/admin_section/parent_controller/parent_controller.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/constant/constant.validate.dart';
import 'package:vidyaveechi_website/view/drop_down/allStudent.dart';
import 'package:vidyaveechi_website/view/drop_down/select_class.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/widgets/progess_button/progress_button.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';
import 'package:vidyaveechi_website/view/widgets/routeSelectedTextContainer/routeSelectedTextContainer.dart';
import 'package:vidyaveechi_website/view/widgets/routeSelectedTextContainer/route_NonSelectedContainer.dart';
import 'package:vidyaveechi_website/view/widgets/textformFiledContainer/textformFiledBlueContainer.dart';

class CreateParent extends StatelessWidget {
  final ParentController parentController = Get.put(ParentController());

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  CreateParent({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> createStudentListWidget = [
      const TextFontWidget(
        text: 'Add New Parent',
        fontsize: 18,
        fontWeight: FontWeight.bold,
      ), //////////////////////////0.....................
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
              height: 55,
              child: SelectClassDropDown(),
            ),
          ],
        ),
      ), ////////////////////1..............class...........
      Container(
        height: ResponsiveWebSite.isMobile(context) ? 80 : 100,
        color: cWhite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextFontWidget(text: 'Select Student *', fontsize: 12.5),
            const SizedBox(
              height: 05,
            ),
            SizedBox(
              height: 55,
              child: AllStudentDropDown(),
              // child: SelectStudentsDropDown()
              //  DropdownSearch(
              //   items: const ['Sruthy', 'Abin'],
              //   onChanged: (value) {
              //     parentController.studentName.value = value ?? '';
              //   },
              // ),
            ),
          ],
        ),
      ), ////////////////////2..............slect.student..........
      TextFormFiledBlueContainerWidget(
        controller: parentController.parentNameController,
        hintText: " Enter Parent Name",
        title: 'Parent Name',
        validator: checkFieldEmpty,
      ), /////////////////////////////3.....................name

      TextFormFiledBlueContainerWidget(
        controller: parentController.parentPhNOController,
        hintText: " Enter Parent Ph",
        title: 'Phone Number',
        validator: checkFieldPhoneNumberIsValid,
      ), /////////////////////////.....4.........................number

      Obx(() => ProgressButtonWidget(
          function: () async {
            if (_formKey.currentState!.validate()) {
              parentController.addParent();
            }
          },
          buttonstate: parentController.buttonstate.value,
          text:
              'Create Parent')), /////////////........................................5...
    ];
    return Form(
      key: _formKey,
      child: Container(
        color: screenContainerbackgroundColor,
        height: ResponsiveWebSite.isMobile(context) ? 1200 : 820,
        padding: const EdgeInsets.only(left: 15, right: 15, top: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextFontWidget(
              text: 'Create A New Parent',
              fontsize: 18,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      parentController.ontapParent.value = false;
                    },
                    child: const RouteNonSelectedTextContainer(title: 'Home')),
                const RouteSelectedTextContainer(
                    width: 140, title: 'Create Parent'),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ResponsiveWebSite.isMobile(context)
                ? SingleChildScrollView(
                    child: Container(
                      color: cWhite,
                      height: 1000,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 15),
                            child:
                                createStudentListWidget[0], ////////////heading
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(
                              children: [
                                Padding(
                                    padding: const EdgeInsets.only(
                                        right: 20, left: 10, top: 5),
                                    child: createStudentListWidget[
                                        1] ///////////class
                                    ),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        right: 20, left: 10, top: 5),
                                    child: createStudentListWidget[
                                        2] ////////std name............
                                    ),
                                // Padding(
                                //     padding: const EdgeInsets.only(
                                //         right: 20, left: 10, top: 10),
                                //     child:
                                //         createStudentListWidget[3] ////////number
                                //     ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 20),
                                  child: createStudentListWidget[3] //////name
                                  ),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 20),
                                  child: createStudentListWidget[4] /////number
                                  ),
                              // Padding(
                              //     padding:
                              //         const EdgeInsets.only(left: 10, right: 20),
                              //     child: createStudentListWidget[6] ///////dob
                              //     ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, left: 20),
                                  child: createStudentListWidget[
                                      5] ////////////button
                                  ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ) /////////////////////////////////////////////////////////////////////////
                : Container(
                    color: cWhite,
                    height: 550,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(left: 20, top: 15),
                            child: createStudentListWidget[0] ///////////heading
                            ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 20, left: 10, top: 30),
                                    child: createStudentListWidget[
                                        1] ///////////class
                                    ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 20, left: 10, top: 30),
                                    child: createStudentListWidget[
                                        2] /////////////////////stdent name....
                                    ),
                              ),
                              // Expanded(
                              //   flex: 1,
                              //   child: Padding(
                              //       padding: const EdgeInsets.only(
                              //           right: 20, left: 10, top: 30),
                              //       child:
                              //           createStudentListWidget[3] ///////number
                              //       ),
                              // ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 20),
                                    child: createStudentListWidget[
                                        3] ////////.....name
                                    )),
                            Expanded(
                                flex: 1,
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 20),
                                    child: createStudentListWidget[
                                        4] //////....number
                                    )),
                            // Expanded(
                            //     flex: 1,
                            //     child: Padding(
                            //         padding: const EdgeInsets.only(
                            //             left: 10, right: 20),
                            //         child: createStudentListWidget[6] ////dob
                            //         )),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, left: 20),
                                child: createStudentListWidget[5] //////button
                                ),
                          ],
                        )
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
