import 'dart:developer';

import 'package:awesome_side_sheet/Enums/sheet_position.dart';
import 'package:awesome_side_sheet/side_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:progress_state_button/progress_button.dart';
import 'package:vidyaveechi_website/controller/class_controller/class_controller.dart';
import 'package:vidyaveechi_website/controller/subject_controller/subject_controller.dart';
import 'package:vidyaveechi_website/model/subject_model/subject_model.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/constant/constant.validate.dart';
import 'package:vidyaveechi_website/view/drop_down/class_wise_subject.dart';
import 'package:vidyaveechi_website/view/drop_down/select_class.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';
import 'package:vidyaveechi_website/view/widgets/custom_showDilog/custom_showdilog.dart';
import 'package:vidyaveechi_website/view/widgets/progess_button/progress_button.dart';
import 'package:vidyaveechi_website/view/widgets/textformFiledContainer/textformFiledBlueContainer.dart';

aSignSubjectFunction(
    BuildContext context, String teacherDocid, String teacherName) {
  final SubjectController subjectController = Get.put(SubjectController());
  aweSideSheet(
      context: context,
      footer: Container(),
      sheetPosition: SheetPosition.right,
      // title: 'Create Class',
      header: Container(),
      // t
      body: Column(
        children: [
            Row(
            children: [
              const BackButton(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFontWidget(text: UserCredentialsController.batchId!, fontsize: 19),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 08, right: 08),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               const TextFontWidget(text: "Select Class *", fontsize: 12),
                SelectClassDropDown(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 08, right: 08, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               const TextFontWidget(text: "Select Subject *", fontsize: 12),
                SelectClassWiseSubjectDropDown(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 08, right: 08, top: 10),
            child: TextFormFiledBlueContainerWidgetWithOutColor(
              controller: subjectController.subFeeController,
              hintText:
                  " Enter teacher fee for this subject per/ 1 hr eg :100,500",
              title: 'Subject Fee',
              validator: checkFieldEmpty,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20, top: 10),
            child: SizedBox(
              // color: Colors.amber,
              height: 40,
              width: 180,
              child: Obx(() => ProgressButtonWidget(
                  function: () async {
                    subjectController.asignSubjectToTeacher(
                        teacherName: teacherName, teacherDocid: teacherDocid);
                  },
                  buttonstate: subjectController.buttonstate.value,
                  text: 'Assign Subject')),
            ),
          ),
          Obx(
            () => Expanded(
              child: SizedBox(
                child: StreamBuilder(
                    stream: server
                        .collection('SchoolListCollection')
                        .doc(UserCredentialsController.schoolId)
                        .collection(UserCredentialsController.batchId!)
                        .doc(UserCredentialsController.batchId)
                        .collection('classes')
                        .doc(Get.find<ClassController>().classDocID.value)
                        .collection('teachers')
                        .doc(teacherDocid)
                        .collection('teacherSubject')
                        .snapshots(),
                    builder: (context, snap) {
                      log('teacher docid $teacherDocid');
                      log('class docid${Get.find<ClassController>().classDocID.value}');
                      if (snap.hasData) {
                        if (snap.data!.docs.isEmpty) {
                          return Center(
                            child: Column(
                              children: [
                                TextFontWidget(
                                    text: Get.find<ClassController>()
                                                .classDocID
                                                .value ==
                                            'dd'
                                        ? 'Please Select a class'
                                        : 'Class Selected = ${Get.find<ClassController>().className.value}',
                                    fontsize: 12.5),
                                 const TextFontWidget(
                                    text: "No subjects found add new subjects",
                                    fontsize: 12.5),
                              ],
                            ),
                          );
                        } else {
                          return Column(
                            children: [
                              TextFontWidget(
                                  text: Get.find<ClassController>()
                                              .classDocID
                                              .value ==
                                          'dd'
                                      ? 'Please Select a class'
                                      : 'Class Selected = ${Get.find<ClassController>().className.value}',
                                  fontsize: 12.5),
                              Expanded(
                                child: ListView.separated(
                                    itemBuilder: (context, index) {
                                      final data = SubjectModel.fromMap(
                                          snap.data!.docs[index].data());
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, top: 08),
                                        child: Container(
                                          color: Colors.blue.withOpacity(0.2),
                                          height: 35,
                                          width: double.infinity,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: TextFontWidget(
                                                  text: data.subjectName,
                                                  fontsize: 13,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Container(
                                                  color:
                                                      screenContainerbackgroundColor,
                                                  height: 35,
                                                  width: 90,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Container(
                                                        width: 1,
                                                        color: cWhite,
                                                      ),
                                                      /////////////////...edit
                                                      Container(
                                                        width: 1,
                                                        color: cWhite,
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          customShowDilogBox2(
                                                            context: context,
                                                            title: 'Alert',
                                                            children: [
                                                               const TextFontWidget(
                                                                  text:
                                                                      'Do you remove this subject from teacher?\nOnce you remove all data will related this subject will be delete!!',
                                                                  fontsize: 12)
                                                            ],
                                                            doyouwantActionButton:
                                                                true,
                                                            actiononTapfuction:
                                                                () {
                                                              subjectController
                                                                  .asignSubRemoveFromTr(
                                                                      teacherDocid,
                                                                      data.docid);
                                                            },
                                                          );
                                                        },
                                                        child: const Icon(
                                                          Icons.delete,
                                                          color: cred,
                                                          size: 18,
                                                        ),
                                                      ), /////////////////////////delete
                                                    ],
                                                  )),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(
                                          height: 1,
                                        ),
                                    itemCount: snap.data!.docs.length),
                              ),
                            ],
                          );
                        }
                      } else {
                        return circularProgressIndicator;
                      }
                    }),
              ),
            ),
          ),
        ],
      ));
}
