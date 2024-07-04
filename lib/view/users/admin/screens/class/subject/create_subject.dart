import 'package:awesome_side_sheet/Enums/sheet_position.dart';
import 'package:awesome_side_sheet/side_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/subject_controller/subject_controller.dart';
import 'package:vidyaveechi_website/model/subject_model/subject_model.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/constant/constant.validate.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/class/subject/edit_subject_container.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';
import 'package:vidyaveechi_website/view/widgets/progess_button/progress_button.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';
import 'package:vidyaveechi_website/view/widgets/textformFiledContainer/textformFiledBlueContainer.dart';

createSubjectFunction(BuildContext context, String classId) {
  final SubjectController subjectController = Get.put(SubjectController());
  aweSideSheet(
      context: context,
      footer: Container(),
      sheetPosition: SheetPosition.right,
      // title: 'Create Class',
      header: Container(),
      // t
      body: SizedBox(
        height: 500,
        child: SingleChildScrollView(
          child: Column(
            children: [
               const Row(
                children: [
                  BackButton(),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFontWidget(text: "Batch 2024 - 2025", fontsize: 19),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 08, right: 08),
                child: TextFormFiledBlueContainerWidgetWithOutColor(
                  controller: subjectController.subNameController,
                  hintText: " Enter Subject Name",
                  title: 'Subject Name',
                  validator: checkFieldEmpty,
                ),
              ),
              Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Obx(
              () => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black, width: 0.5),
                ),
                width: 360,
                child: DropdownButtonFormField<Color>(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                  ),
                  value: subjectController.subjectColor.value,
                  onChanged: (Color? newValue) {
                    subjectController.subjectColor.value = newValue??Colors.amber;
                       // Colors.amber; // Update selectColor in controller
                  
                  },
                  items: [
                    Colors.amber,
                    Colors.red,
                    Colors.green,
                    Colors.blue,
                    Colors.yellow,
                    Colors.brown,
                    Colors.deepOrange,
                    Colors.deepPurple,
                    Colors.lime,
                    Colors.indigo,
                    Colors.grey
                  ].map<DropdownMenuItem<Color>>((Color value) {
                    return DropdownMenuItem<Color>(
                      value: value,
                      child: Container(
                        height: 30,
                        width: 30,
                        color: value,
                      ),
                    );
                  }).toList(),
                ),
              ),
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
                        subjectController.addSubjectIntoClass(classID: classId);
                      },
                      buttonstate: subjectController.buttonstate.value,
                      text: 'Create Subject')),
                ),
              ),
              SizedBox(
                height: ResponsiveWebSite.isDesktop(context) ? 470 : 400,
                child: StreamBuilder(
                    stream: server
                        .collection('SchoolListCollection')
                        .doc(UserCredentialsController.schoolId)
                        .collection(UserCredentialsController.batchId!)
                        .doc(UserCredentialsController.batchId!)
                        .collection('classes')
                        .doc(classId)
                        .collection('subjects')
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
                                final data = SubjectModel.fromMap(
                                    snap.data!.docs[index].data());
                                return Padding(
                                  padding: const EdgeInsets.only(left: 10, top: 08),
                                  child: data.subjectNameedit == true
                                      ? SubjectNameEditWidget(
                                          docid: data.docid,
                                        )
                                      : Container(
                                          color: data.subjectColor,
                                          height: 35,
                                          width: double.infinity,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
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
                                                      GestureDetector(
                                                        onTap: () => subjectController
                                                            .enableorDisableUpdate(
                                                                data.docid, true),
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
                                                     subjectController.deleteSubject(data.docid,context);
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
                              separatorBuilder: (context, index) => const SizedBox(
                                    height: 1,
                                  ),
                              itemCount: snap.data!.docs.length);
                        }
                      } else {
                        return circularProgressIndicator;
                      }
                    }),
              ),
            ],
          ),
        ),
      ));
}
