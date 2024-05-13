import 'package:awesome_side_sheet/Enums/sheet_position.dart';
import 'package:awesome_side_sheet/side_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
//import 'package:progress_state_button/progress_button.dart';
import 'package:vidyaveechi_website/controller/class_controller/class_controller.dart';
import 'package:vidyaveechi_website/controller/exam_notification/exam_notification.dart';
import 'package:vidyaveechi_website/model/exam_notification/exam_notification.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/constant/constant.validate.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/exam_notification/exam_functions_n_list/edit_function.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';
import 'package:vidyaveechi_website/view/widgets/progess_button/progress_button.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';
import 'package:vidyaveechi_website/view/widgets/textformFiledContainer/textformFiledBlueContainer.dart';
//import 'package:vidyaveechi_website/view/widgets/textformFiledContainer/textformFiledContainer.dart';

createExamNotificationFunction(BuildContext context) {
  final getExamNotificationCtr = Get.put(ExamNotificationController());
  final GlobalKey<FormState> fkey = GlobalKey<FormState>();
  getExamNotificationCtr.examNameCtr.text = '';
  getExamNotificationCtr.startDateCtr.text = '';
  getExamNotificationCtr.endDateCtr.text = '';
  aweSideSheet(
      context: context,
      footer: Container(),
      sheetPosition: SheetPosition.right,
      // title: 'Create Class',
      header: Container(),
      // t
      body: Form(
        key: fkey,
        child: Column(
          children: [
             Row(
              children: [
                BackButton(),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child:
                      TextFontWidget(text: "Batch 2024 - 2025", fontsize: 19),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 08, right: 08),
              child: TextFormFiledBlueContainerWidget(
                hintText: "  Enter Exam Name",
                title: 'Exam Name',
                validator: checkFieldEmpty,
                controller: getExamNotificationCtr.examNameCtr,
              ),
            ), /////////////////////////..........................................
            Padding(
              padding: const EdgeInsets.only(left: 08, right: 08),
              child: SizedBox(
                height: ResponsiveWebSite.isMobile(context) ? 80 : 100,
                // color: cWhite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // const TextFontWidget(
                    //     text: 'Starting Date🗓️ *', fontsize: 12.5),
                    // const SizedBox(
                    //   height: 05,
                    // ),
                    GestureDetector(
                      onTap: () {
                        getExamNotificationCtr.setStartDate(context);
                      },
                      child: AbsorbPointer(
                        absorbing: true,
                        child: TextFormFiledBlueContainerWidget(
                          hintText: "  Start Date",
                          title: 'Starting Date🗓️ ',
                          validator: checkFieldEmpty,
                          // readOnly: true,
                          controller: getExamNotificationCtr.startDateCtr,
                        ),
                      ),

                      // child: Container(
                      //   height: 45,
                      //   decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(05),
                      //       color: screenContainerbackgroundColor,
                      //       border: Border.all(color: cBlack.withOpacity(0.4))),
                      //   width: double.infinity,
                      //   alignment: Alignment.centerLeft,
                      //   child: Padding(
                      //     padding: EdgeInsets.all(8.0),
                      //     // child: TextFontWidget(
                      //     //     text: 'DD/MM/YYYY *', fontsize: 12.5),
                      //     child: Obx(
                      //       () => TextFontWidget(
                      //           text: getExamNotificationCtr.startDate.value,
                      //           fontsize: 12.5),
                      //     ),
                      //   ),
                      // ),
                    ),
                  ],
                ),
              ),
            ), ///////////////////////////////////////////............................
            Padding(
              padding: const EdgeInsets.only(left: 08, right: 08),
              child: SizedBox(
                height: ResponsiveWebSite.isMobile(context) ? 80 : 100,
                // color: cWhite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        getExamNotificationCtr.setEndDate(context);
                      },
                      child: AbsorbPointer(
                        absorbing: true,
                        child: TextFormFiledBlueContainerWidget(
                          hintText: "  End Date",
                          title: 'Ending Date🗓️ ',
                          validator: checkFieldEmpty,
                          readOnly: true,
                          controller: getExamNotificationCtr.endDateCtr,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ), ///////////////////////////..............................................
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: SizedBox(
                // color: Colors.amber,
                height: 40,
                width: 180,
                child: Obx(() => ProgressButtonWidget(
                    function: () async {
                      if (fkey.currentState?.validate() ?? false) {
                        getExamNotificationCtr.addExamNotifcation(
                            examName: getExamNotificationCtr.examNameCtr.text,
                            startDate: getExamNotificationCtr.startDate,
                            endDate: getExamNotificationCtr.endDate);
                      }
                    },
                    buttonstate: Get.find<ClassController>().buttonstate.value,
                    text: ' Exam')),
              ),
            ), ///////////////////////////////////////////////......................................
            Expanded(
              //color: cBlue,
              // height: ResponsiveWebSite.isDesktop(context) ? 350 : 240,
              child: StreamBuilder(
                  stream: server
                      .collection('SchoolListCollection')
                      .doc(UserCredentialsController.schoolId)
                      .collection(UserCredentialsController.batchId!)
                      .doc(UserCredentialsController.batchId!)
                      .collection('ExamNotification')
                      .snapshots(),
                  builder: (context, snap) {
                    if (snap.hasData) {
                      if (snap.data!.docs.isEmpty) {
                        return  Center(
                          child: TextFontWidget(
                              text: "No Exam found, add new exams",
                              fontsize: 12.5),
                        );
                      } else {
                        return ListView.separated(
                            itemBuilder: (context, index) {
                              final data = ExamNotificationModel.fromMap(
                                  snap.data!.docs[index].data());
                              return Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 08),
                                child:
                                    //  data.editoption == true
                                    //     ? ClassNameEditWidget(
                                    //         docid: data.docid,
                                    //       )
                                    //     :
                                    Container(
                                  color: Colors.blue.withOpacity(0.2),
                                  height: 35,
                                  width: double.infinity,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: SizedBox(
                                          height: 35,
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: TextFontWidget(
                                              text: data.examName,
                                              fontsize: 13,
                                              fontWeight: FontWeight.w600,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                            color:
                                                screenContainerbackgroundColor,
                                            height: 35,
                                            //   width: 90,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                // Tooltip(
                                                //   message:
                                                //       'Add Exam to this batch year',
                                                //   child: GestureDetector(
                                                //     onTap: () {
                                                //       getExamNotificationCtr
                                                //           .addExamNotifcationToBatchYear(
                                                //               data: data);
                                                //     },
                                                //     child: const Icon(
                                                //       weight: 50,
                                                //       Icons.add,
                                                //       color: themeColorBlue,
                                                //       size: 18,
                                                //     ),
                                                //   ),
                                                // ), ///////////////////////////................add
                                                // Container(
                                                //   width: 1,
                                                //   color: cWhite,
                                                // ),
                                                GestureDetector(
                                                  onTap: () {
                                                    editFunctionOfExam(
                                                        context, data);
                                                  },
                                                  child: const Icon(
                                                    Icons.edit,
                                                    color: cgreen,
                                                    size: 18,
                                                  ),
                                                ), ///////////////////////////...edit
                                                Container(
                                                  width: 1,
                                                  color: cWhite,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    showDialogWidget(
                                                        context: context,
                                                        title:
                                                            'Are you sure to Delete',
                                                        function: () {
                                                          getExamNotificationCtr
                                                              .deletExamNotification(
                                                                  docId: data
                                                                      .docId);
                                                        });
                                                  },
                                                  child: const Icon(
                                                    Icons.delete,
                                                    color: cred,
                                                    size: 18,
                                                  ),
                                                ), /////////////////////////delete
                                              ],
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  height: 1,
                                ),
                            itemCount: snap.data!.docs.length);
                      } //
                    } else {
                      return circularProgressIndicator;
                    }
                  }), //
            ),
          ],
        ),
      ));
}
