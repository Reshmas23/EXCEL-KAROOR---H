import 'dart:developer';

import 'package:awesome_side_sheet/Enums/sheet_position.dart';
import 'package:awesome_side_sheet/side_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:progress_state_button/progress_button.dart';
import 'package:vidyaveechi_website/controller/class_controller/class_controller.dart';
import 'package:vidyaveechi_website/model/class_model/class_model.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/constant/constant.validate.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/class/create_class/edit_class_Container.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';
import 'package:vidyaveechi_website/view/widgets/progess_button/progress_button.dart';
import 'package:vidyaveechi_website/view/widgets/textformFiledContainer/textformFiledBlueContainer.dart';
//import 'package:vidyaveechi_website/view/widgets/textformFiledContainer/textformFiledContainer.dart';

createClassFunction(BuildContext context) {
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
                child: TextFontWidget(text: "${UserCredentialsController.batchId}", fontsize: 19),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 08, right: 08),
            child: TextFormFiledBlueContainerWidget(
              controller: Get.find<ClassController>().classNameController,
              hintText: "  Enter Class Name",
              title: 'Class Name',
              validator: checkFieldEmpty,
            ),
          ),
           Padding(
            padding: const EdgeInsets.only(left: 08, right: 08),
            child: TextFormFiledBlueContainerWidget(
               controller: Get.find<ClassController>().classIdController,
              hintText: "  Enter Class Id",
              title: 'Class Id',
              validator: checkFieldEmpty,
            ),
          ),
           Padding(
            padding: const EdgeInsets.only(left: 08, right: 08),
            child: TextFormFiledBlueContainerWidget(
              controller:  Get.find<ClassController>().classTeacherController,
              hintText: "  Enter Class Teacher",
              title: 'Class Teacher',
             // validator: checkFieldEmpty,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 08, right: 08,),
            child: TextFormFiledBlueContainerWidgetWithOutColor(
              controller: Get.find<ClassController>().classFeeController,
              hintText:
                  " Enter Class fee for this Class per/ 1 month eg :1000,5000",
              title: 'Class Fee',
              validator: checkFieldEmpty,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: SizedBox(
              // color: Colors.amber,
              height: 40,
              width: 180,
              child: Obx(() => ProgressButtonWidget(
                  function: () async {
                    Get.find<ClassController>().addNewClass();
                    log("state   ${Get.find<ClassController>().buttonstate}");
                  },
                  buttonstate: Get.find<ClassController>().buttonstate.value,
                  text: 'Create Class')),
            ),
          ),
          Expanded(
            child: SizedBox(
              child: StreamBuilder(
                  stream: server
                      .collection('SchoolListCollection')
                      .doc(UserCredentialsController.schoolId)
                      .collection('classes')
                      .snapshots(),
                  builder: (context, snap) {
                    if (snap.hasData) {
                      if (snap.data!.docs.isEmpty) {
                        return  const Center(
                          child: TextFontWidget(
                              text: "No class found add new classes",
                              fontsize: 12.5),
                        );
                      } else {
                        return ListView.separated(
                            itemBuilder: (context, index) {
                              final data = ClassModel.fromMap(
                                  snap.data!.docs[index].data());
                              return Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 08),
                                child: data.editoption == true
                                    ? ClassNameEditWidget(
                                        docid: data.docid,
                                      )
                                    : data.feeeditoption == true
                                        ? FeesEditWidget(docid: data.docid)
                                        : Container(
                                            color: Colors.blue.withOpacity(0.2),
                                            height: 35,
                                            width: double.infinity,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: TextFontWidget(
                                                    text: data.className,
                                                    fontsize: 13,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: TextFontWidget(
                                                    text: '${data.classfee} /-',
                                                    fontsize: 13,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                Tooltip(
                                                  message: 'Edit Class fee',
                                                  child: GestureDetector(
                                                    onTap: () => Get.find<
                                                            ClassController>()
                                                        .enableorDisableUpdate(
                                                            'feeeditoption',
                                                            data.docid,
                                                            true),
                                                    child: const Icon(
                                                      weight: 50,
                                                      Icons.edit,
                                                      color: cgreen,
                                                      size: 18,
                                                    ),
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
                                                        Tooltip(
                                                          message:
                                                              'Add class to this batch year',
                                                          child:
                                                              GestureDetector(
                                                            onTap: () => Get.find<
                                                                    ClassController>()
                                                                .setClassForbatchYear(
                                                                  data.classTeacherName??'',
                                                                    data.className,
                                                                    data.classId,
                                                                    data.docid,
                                                                    data.classfee!),
                                                            child: const Icon(
                                                              weight: 50,
                                                              Icons.add,
                                                              color:
                                                                  themeColorBlue,
                                                              size: 18,
                                                            ),
                                                          ),
                                                        ), ///////////////////////////................add
                                                        Container(
                                                          width: 1,
                                                          color: cWhite,
                                                        ),
                                                        GestureDetector(
                                                          onTap: () => Get.find<
                                                                  ClassController>()
                                                              .enableorDisableUpdate(
                                                            'editoption',
                                                            data.docid,
                                                            true,
                                                          ),
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
                                                            Get.find<
                                                                    ClassController>()
                                                                .deleteClass(
                                                                    data.docid,
                                                                    context);
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
                            itemCount: snap.data!.docs.length);
                      }
                    } else {
                      return circularProgressIndicator;
                    }
                  }),
            ),
          ),
        ],
      ));
}
