import 'package:awesome_side_sheet/Enums/sheet_position.dart';
import 'package:awesome_side_sheet/side_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/general%20instruction/general_instruction.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/constant/constant.validate.dart';
import 'package:vidyaveechi_website/view/fonts/google_poppins_widget.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/widgets/textformFiledContainer/textformFiledContainer.dart';

addFunctionGenernalInstruction(
  BuildContext context,
) {
  final GeneralInsructionController generalInsructionController =
      Get.put(GeneralInsructionController());
  aweSideSheet(
      context: context,
      sheetPosition: SheetPosition.right,
      header: Container(),
      // title: "General Instructions",
      body: Padding(
        padding: const EdgeInsets.only(left: 10, top: 10),
        child: Column(
          children: [
            const Row(
              children: [
                BackButton(),
                SizedBox(
                  width: 20,
                ),
                TextFontWidget(
                  text: 'General Instruction',
                  fontsize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            SizedBox(
              height: 550,
              child: Container(
                  margin: const EdgeInsets.only(top: 10),
                  child:
                      // Obx(() {
                      //   return
                      Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                              flex: 3,
                              child: Form(
                                key: generalInsructionController.formKey,
                                child: TextFormFiledContainerWidget(
                                    hintText: 'General Instruction',
                                    title: 'Enter general instruction',
                                    width: 500,
                                    validator: checkFieldEmpty,
                                    controller: generalInsructionController
                                        .instructionController),
                              )),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 28, left: 20),
                              child: GestureDetector(
                                  onTap: () {
                                    if (generalInsructionController
                                        .formKey.currentState!
                                        .validate()) {
                                      generalInsructionController
                                          .addGeneralInstructions();
                                    }
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: adminePrimayColor),
                                      height: 38,
                                      width: 100,
                                      child: Center(
                                          child: GooglePoppinsWidgets(
                                        text: 'Add',
                                        fontsize: 14,
                                        fontWeight: FontWeight.w500,
                                      )),
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      ),

                      // sizedBoxH20,

                      // Expanded(
                      //   flex: 9,
                      //   child: Container(
                      //  //   color: cBlue,
                      //     width: 400,
                      //     child: ListView.builder(
                      //       itemCount: generalInsructionController
                      //           .instructionList.length,
                      //       itemBuilder: (context, index) {
                      //         return Column(
                      //           children: [
                      //             Row(
                      //               children: [
                      //                 Expanded(
                      //                   child: GooglePoppinsWidgets(
                      //                     text:
                      //                         '•${generalInsructionController.instructionList[index]}',
                      //                     fontsize: 14,
                      //                   ),
                      //                 ),
                      //                 // const Spacer(),
                      //                 GestureDetector(
                      //                     onTap: () {
                      //                       customShowDilogBox(
                      //                           context: context,
                      //                           title: 'Edit',
                      //                           children: [
                      //                             TextFormFiledBlueContainerWidgetWithOutColor(
                      //                                 hintText: generalInsructionController.instructionController.text,
                      //                                 title:
                      //                                     'General Instruction')
                      //                           ],actiononTapfuction: () {
                      //                              generalInsructionController.update();

                      //                           },
                      //                           doyouwantActionButton: true,
                      //                           actiontext: 'Update');
                      //                     },
                      //                     child: Icon(
                      //                       Icons.edit,
                      //                       color: cgreen.withOpacity(1),
                      //                     )),
                      //                 const SizedBox(
                      //                   width: 10,
                      //                 ),
                      //                 GestureDetector(
                      //                   child: Icon(
                      //                     Icons.delete,
                      //                     color: cred.withOpacity(1),
                      //                   ),
                      //                   onTap: () {
                      //                     customShowDilogBox(
                      //                         context: context,
                      //                         title: 'Delete',
                      //                         children: [
                      //                           GooglePoppinsWidgets(
                      //                               text:
                      //                                   'Are you sure to want delete',
                      //                               fontsize: ResponsiveWebSite
                      //                                       .isMobile(context)
                      //                                   ? 12
                      //                                   : 15)
                      //                         ],
                      //                         doyouwantActionButton: true,
                      //                         actiononTapfuction: () {
                      //                           generalInsructionController.removeInstruction();
                      //                         },
                      //                         );
                      //                   },
                      //                 )
                      //               ],
                      //             ),
                      //           ],
                      //         );
                      //       },
                      //     ),
                      //   ),
                      // ),
                      // Expanded(
                      //     flex: 1,
                      //     child: Center(
                      //         child: MaterialButton(
                      //       onPressed: () {
                      //         generalInsructionController.addGeneralInstructions();
                      //         // generalInsructionController.   instructionController.clear();
                      //       },
                      //       color: adminePrimayColor,
                      //       child: GooglePoppinsWidgets(
                      //           text: 'Upload', fontsize: 15),
                      //     )))
                    ],
                  )
                  // }),
                  ),
            ),
          ],
        ),
      ),
      showCloseButton: false,
      footer: Container());
}
