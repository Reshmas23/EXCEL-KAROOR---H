import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/admin_section/teacher_controller/teacher_controller.dart';
import 'package:vidyaveechi_website/model/student_model/student_model.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/teacher/list_of_teacher/edit_teacherDetails.dart';
import 'package:vidyaveechi_website/view/widgets/data_list_widgets/data_container.dart';

class AllClassStudentDataList extends StatelessWidget {
  final int index;
  final StudentModel data;
  const AllClassStudentDataList({
    required this.index,
    required this.data,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          height: 45,
          decoration: BoxDecoration(
            color: index % 2 == 0
                ? const Color.fromARGB(255, 246, 246, 246)
                : Colors.blue[50],
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: DataContainerWidget(
                    rowMainAccess: MainAxisAlignment.center,
                    color: cWhite,
                    // width: 150,
                    index: index,
                    headerTitle: '${index + 1}'), //....................No
              ),
              const SizedBox(
                width: 01,
              ),
              Expanded(
                flex: 2,
                child: data.admissionNumber == ''
                    ? const TeacherDetailEditWidget(
                        docid: '',
                      )
                    : Get.find<TeacherController>().teacherEditDetail.value ==
                            true
                        ? Row(
                            children: [
                              DataContainerWidget(
                                  rowMainAccess: MainAxisAlignment.center,
                                  color: cWhite,
                                  index: index,
                                  headerTitle: data.admissionNumber),
                              Padding(
                                padding: const EdgeInsets.only(left: 05),
                                child: IconButton(
                                    onPressed: () async {
                                      await Get.find<TeacherController>()
                                          .editTeacherDetails(
                                              teacherDocID: data.docid,
                                              key:'employeeID',
                                              value: '');
                                    },
                                    icon: const Icon(
                                      Icons.edit_outlined,
                                      size: 14,
                                      color: cgreen,
                                    )),
                              )
                            ],
                          )
                        : DataContainerWidget(
                            rowMainAccess: MainAxisAlignment.center,
                            color: cWhite,
                            index: index,
                            headerTitle: data.admissionNumber),
              ), //................................................. teacher ID
              const SizedBox(
                width: 01,
              ),
              Expanded(
                flex: 2,
                child: DataContainerWidget(
                    rowMainAccess: MainAxisAlignment.center,
                    color: cWhite,
                    index: index,
                    headerTitle: data.admissionNumber),
              ), //................................................. teacher ID
              const SizedBox(
                width: 01,
              ),
              Expanded(
                flex: 4,
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                      child: Center(
                        child: Image.asset(
                          'webassets/stickers/icons8-student-100 (1).png',
                        ),
                      ),
                    ),
                    Expanded(
                      child: Get.find<TeacherController>()
                                  .teacherEditDetail
                                  .value ==
                              true
                          ? Row(
                              children: [
                                TextFontWidget(
                                  text: "  ${data.studentName}",
                                  fontsize: 12,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 05),
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.edit_outlined,
                                        size: 14,
                                        color: cgreen,
                                      )),
                                )
                              ],
                            )
                          : TextFontWidget(
                              text: "  ${data.studentName}",
                              fontsize: 12,
                              overflow: TextOverflow.ellipsis,
                            ),
                    ),
                  ],
                ),
              ), //........................................... teacher Name
              const SizedBox(
                width: 01,
              ),
              Expanded(
                flex: 4,
                child: Row(
                  children: [
                    SizedBox(
                      width: 15,
                      child: Center(
                        child: Image.asset(
                          'webassets/png/gmail.png',
                        ),
                      ),
                    ),
                    Expanded(
                        child: TextFontWidget(
                      text: "  ${data.studentemail}",
                      fontsize: 12,
                      overflow: TextOverflow.ellipsis,
                    )),
                  ],
                ),
              ), // ................................... teacher Email
              const SizedBox(
                width: 01,
              ),
              Expanded(
                flex: 3,
                child: Row(
                  children: [
                    SizedBox(
                      width: 15,
                      child: Center(
                        child: Image.asset(
                          'webassets/png/telephone.png',
                        ),
                      ),
                    ),
                    Expanded(
                      child: Get.find<TeacherController>()
                                  .teacherEditDetail
                                  .value ==
                              true
                          ? Row(
                              children: [
                                TextFontWidget(
                                  text: "  ${data.parentPhoneNumber}",
                                  fontsize: 12,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 05),
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.edit_outlined,
                                        size: 14,
                                        color: cgreen,
                                      )),
                                )
                              ],
                            )
                          : TextFontWidget(
                              text: "  ${data.parentPhoneNumber}",
                              fontsize: 12,
                              overflow: TextOverflow.ellipsis,
                            ),
                    ),
                  ],
                ),
              ), //....................................... teacher Phone Number
              const SizedBox(
                width: 01,
              ),
              // Expanded(
              //   flex: 2,
              //   child: DataContainerWidget(
              //       rowMainAccess: MainAxisAlignment.center,
              //       color: cWhite,
              //       // width: 150,
              //       index: index,
              //       headerTitle: 'Class '),
              // ), //............................. Student Class

              // const SizedBox(
              //   width: 01,
              // ),
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 15,
                      child: Image.asset(
                        'webassets/png/active.png',
                      ),
                    ),
                    const TextFontWidget(
                      text: "   ",
                      fontsize: 12,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ), //............................. Status [Active or DeActivate]
            ],
          ),
        ));
  }
}
