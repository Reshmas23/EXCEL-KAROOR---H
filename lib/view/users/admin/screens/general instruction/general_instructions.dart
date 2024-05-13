import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vidyaveechi_website/controller/general%20instruction/general_instruction.dart';
import 'package:vidyaveechi_website/model/general_instruction_model/general_instruction.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/google_poppins_widget.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/general%20instruction/add_general_instruction.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';
import 'package:vidyaveechi_website/view/widgets/blue_Container_widget/blue_Container_widget.dart';
import 'package:vidyaveechi_website/view/widgets/custom_showdialouge/custom_showdialouge.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';
import 'package:vidyaveechi_website/view/widgets/textformFiledContainer/textformFiledBlueContainer.dart';

class GeneralInsructions extends StatelessWidget {
  final GeneralInsructionController generalInsructionController =
      Get.put(GeneralInsructionController());
  GeneralInsructions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1000,
      color: screenContainerbackgroundColor,
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 25),
                child: Row(
                  children: [
                    const TextFontWidget(
                      text: 'General Instructions',
                      fontsize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    const Spacer(),
                    GestureDetector(
                        onTap: () {
                          addFunctionGenernalInstruction(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: adminePrimayColor),
                            height: 38,
                            width: 80,
                            child: Center(
                                child: GooglePoppinsWidgets(
                              text: 'Add',
                              fontsize: 14,
                              fontWeight: FontWeight.w500,
                              color: cWhite,
                            )),
                          ),
                        ))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: 25,
                    left: ResponsiveWebSite.isMobile(context) ? 05 : 10),
              ),
              // Obx(() {
              //   return generalInsructionController.isLoading.value
              //       ? const Center(
              //           child: CircularProgressIndicator(),
              //         )
              //    :
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: cWhite, border: Border.all(color: cBlue)),
                    height: 700,
                    width: double.infinity,
                    child: StreamBuilder(
                        stream: server
                            .collection('SchoolListCollection')
                            .doc(UserCredentialsController.schoolId)
                            .collection(UserCredentialsController.batchId!)
                            .doc(UserCredentialsController.batchId!)
                            .collection('Admin_general_instructions')
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                          // ignore: prefer_is_empty
                          if (snapshot.data!.docs.length == 0) {
                            return Center(
                                child: Text(
                              'No General_instructions',
                              style: GoogleFonts.poppins(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ));
                          }
                          return Column(
                            children: [
                              SizedBox(
                                height: 650,
                                child: GridView.builder(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: ResponsiveWebSite.isMobile(
                                            context)
                                        ? 1
                                        : 3, // Number of columns in the grid
                                    crossAxisSpacing:
                                        3, // Spacing between columns
                                    mainAxisSpacing: 5, // Spacing between rows
                                    // mainAxisExtent: 200,
                                  ),
                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder: (context, index) {
                                    GeneralInstructionsModel data =
                                        GeneralInstructionsModel.fromMap(
                                            snapshot.data!.docs[index].data());
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      //  child: Container(
                                      //   height: 50,
                                      //   width: double.infinity,
                                      //   decoration: BoxDecoration(border: Border.all(color: adminePrimayColor)),
                                      //   alignment: Alignment.centerLeft,
                                      child: Container(
                                        // height: 200,
                                        padding: const EdgeInsets.only(
                                            top: 30,
                                            bottom: 15,
                                            right: 20,
                                            left: 20),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: screenContainerbackgroundColor,
                                        ),
                                        child: Column(
                                          // mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Expanded(
                                              child: SingleChildScrollView(
                                                child: TextFontWidget(
                                                  text: ' ${data.instruction}',
                                                  fontsize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  overflow: TextOverflow.clip,
                                                ),
                                              ),
                                            ),
                                            // const Spacer(),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      customShowDilogBox(
                                                          context: context,
                                                          title: 'Edit',
                                                          children: [
                                                            TextFormFiledBlueContainerWidgetWithOutColor(
                                                                controller:
                                                                    generalInsructionController
                                                                        .instructionController,
                                                                hintText:
                                                                    generalInsructionController
                                                                        .instructionController
                                                                        .text,
                                                                title:
                                                                    'General Instruction')
                                                          ],
                                                          actiononTapfuction:
                                                              () {
                                                            generalInsructionController
                                                                .updateInstructions(
                                                                    data.instructionId,
                                                                    context);
                                                          },
                                                          doyouwantActionButton:
                                                              true,
                                                          actiontext: 'Update');
                                                    },
                                                    child: const Text(
                                                      'Edit',
                                                      style: TextStyle(
                                                          color: cgreen,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  GestureDetector(
                                                    child: const Text(
                                                      'Delete',
                                                      style: TextStyle(
                                                          color: Colors.red,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    // child: Icon(
                                                    //   Icons.delete,
                                                    //   color: cred.withOpacity(1),
                                                    // ),
                                                    onTap: () {
                                                      showDialog(
                                                        context: context,
                                                        barrierDismissible:
                                                            false, // user must tap button!
                                                        builder: (context) =>
                                                            AlertDialog(
                                                          insetPadding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                            horizontal: 20,
                                                          ),
                                                          actionsPadding:
                                                              const EdgeInsets
                                                                  .all(20),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          0)),
                                                          title: const Text(
                                                            "Delete",
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ),
                                                          content: const Text(
                                                            "Are you sure do you want to delete ?",
                                                            style: TextStyle(
                                                                fontSize: 14),
                                                          ),
                                                          actions: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                GestureDetector(
                                                                    onTap: () {
                                                                      Navigator.pop(
                                                                          context);
                                                                    },
                                                                    child:
                                                                        BlueContainerWidget(
                                                                      title:
                                                                          "No",
                                                                      fontSize:
                                                                          12,
                                                                      color:
                                                                          adminePrimayColor,
                                                                    )),
                                                                GestureDetector(
                                                                    onTap: () {
                                                                      generalInsructionController.removeInstruction(
                                                                          data.instructionId,
                                                                          context);
                                                                    },
                                                                    child:
                                                                        BlueContainerWidget(
                                                                      title:
                                                                          "Yes",
                                                                      fontSize:
                                                                          12,
                                                                      color:
                                                                          adminePrimayColor,
                                                                    )),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      );

                                                      // customShowDilogBox(
                                                      //     context: context,
                                                      //     title: 'Delete',
                                                      //     children: [
                                                      //       GooglePoppinsWidgets(
                                                      //           text:
                                                      //               'Are you sure to want delete',
                                                      //           fontsize: ResponsiveWebSite
                                                      //                   .isMobile(context)
                                                      //               ? 12
                                                      //               : 15)
                                                      //     ],
                                                      //     doyouwantActionButton: true,
                                                      //     actiononTapfuction: () {
                                                      //       generalInsructionController.removeInstruction();
                                                      //     },
                                                      //     );
                                                    },
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      //  ),
                                    );
                                  },

                                  // child:
                                ),
                              )
                            ],
                          );
                        }),
                  ),
                ),

                // child: SizedBox(
                //   // height: 800,
                //   width: 1000,
                //   child: Padding(
                //     padding: const EdgeInsets.symmetric(
                //       horizontal: 100,
                //       vertical: 30,
                //     ),
                //     child: Container(
                //       margin: const EdgeInsets.only(top: 10),
                //       child: StreamBuilder(
                //         stream: server
                //       .collection('SchoolListCollection')
                //       .doc(UserCredentialsController.schoolId)
                //       .collection(UserCredentialsController.batchId!)
                //       .doc(UserCredentialsController.batchId!)
                //       .collection('Admin_general_instructions')
                //       .snapshots(),
                //         builder: (context, snapshot) {
                //            if (snapshot.connectionState ==
                //         ConnectionState.waiting) {
                //       return const Center(
                //           child: CircularProgressIndicator());
                //     }
                //     // ignore: prefer_is_empty
                //     if (snapshot.data!.docs.length == 0) {
                //       return Center(
                //           child: Text(
                //         'No General_instructions',
                //         style: GoogleFonts.poppins(
                //             fontSize: 20, fontWeight: FontWeight.w500),
                //       ));
                //     }
                //           return Column(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             crossAxisAlignment: CrossAxisAlignment.center,
                //             children: [
                //               Container(
                //                 width: 1000,
                //                 decoration: BoxDecoration(
                //                     color: cWhite,
                //                     borderRadius: BorderRadius.circular(5)),
                //                 child: Column(
                //                   children: [
                //                     Center(
                //                         child: Padding(
                //                       padding:
                //                           const EdgeInsets.only(top: 20),
                //                       child: GooglePoppinsWidgets(
                //                         text: 'General Instructions',
                //                         fontsize: 18,
                //                         fontWeight: FontWeight.bold,
                //                       ),
                //                     )),
                //                     Padding(
                //                       padding: const EdgeInsets.only(
                //                           left: 40, top: 20),
                //                       child: ListView.separated(
                //                           shrinkWrap: true,
                //                           itemBuilder: (context, index) {
                //                             final data = GeneralInstructionsModel.fromMap(
                //                                     snapshot.data!.docs[index].data());
                //                             // if (index ==
                //                             //     (generalInstructionsController
                //                             //         .listOfGeneralIModel.length))
                //                             {
                //                               return Padding(
                //                                 padding:
                //                                     const EdgeInsets.only(
                //                                         right: 20),
                //                                 child: Column(
                //                                   crossAxisAlignment:
                //                                       CrossAxisAlignment
                //                                           .end,
                //                                   children: [
                //                                     const SizedBox(
                //                                       height: 10,
                //                                     ),
                //                                     Row(
                //                                         mainAxisAlignment: MainAxisAlignment  .start,
                //                                         children: [
                //                                           Flexible(
                //                                             child: Text(
                //                                               data.instruction,
                //                                               style: GoogleFonts.roboto(
                //                                                   fontSize: ResponsiveWebSite.isMobile(
                //                                                           context)
                //                                                       ? 12
                //                                                       : 15),
                //                                               softWrap:
                //                                                   true,
                //                                             ),
                //                                           ),
                //                                         ]),
                //                                   ],
                //                                 ),
                //                               );
                //                             }
                //                             // return InstructionTextWidget(
                //                             //   count: (index + 1).toString(),
                //                             //   text: generalInstructionsController
                //                             //       .listOfGeneralIModel[index].instruction,
                //                             // );
                //                           },
                //                           separatorBuilder:
                //                               (context, index) {
                //                             return const SizedBox(
                //                               height: 20,
                //                             );
                //                           },
                //                           itemCount: snapshot.data!.docs.length
                //                           // generalInstructionsController.listOfGeneralIModel.length +1
                //                           ),
                //                     ),
                //                   ],
                //                 ),
                //               )

                //               // sizedBoxH20,

                //               // Expanded(
                //               //   child: ListView.builder(
                //               //       itemCount: generalInsructionController
                //               //           .instructionList.length,
                //               //       itemBuilder: (context, index) {
                //               //         return Text(
                //               //             '•  ${generalInsructionController.instructionList[index]}');
                //               //       }),
                //               // ),
                //             ],
                //           );
                //         }
                //       ),
                //     ),
                //   ),
                // ),
              )
              // })
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable