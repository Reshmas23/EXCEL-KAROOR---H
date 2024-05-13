import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/attendence_controller/attendence_controller.dart';
import 'package:vidyaveechi_website/controller/calender_controller/calender_controller.dart';
import 'package:vidyaveechi_website/model/student_Attendece_model/student_attendence_model.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/constant/constant.validate.dart';
import 'package:vidyaveechi_website/view/drop_down/class_wise_subject.dart';
import 'package:vidyaveechi_website/view/drop_down/select_class.dart';
import 'package:vidyaveechi_website/view/drop_down/select_period.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/attendence/widget.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/students/student_details/widgets/category_tableHeader.dart';
import 'package:vidyaveechi_website/view/widgets/routeSelectedTextContainer/routeSelectedTextContainer.dart';
import 'package:vidyaveechi_website/view/widgets/routeSelectedTextContainer/route_NonSelectedContainer.dart';
import 'package:vidyaveechi_website/view/widgets/textformFiledContainer/textformFiledContainer.dart';
//////
class AttendanceAddingList extends StatelessWidget {
  final AttendenceController attendenceController = Get.put(AttendenceController());
  final CalenderController calenderController = Get.put(CalenderController());
  AttendanceAddingList({super.key});

 final GlobalKey<FormState> fkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    attendenceController.isAttendanceNotAvail.value = false;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        color: screenContainerbackgroundColor,
        height: 850,
        width: 1150,
        child: Form(
          key: fkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 10),
                child: Row(
                  children: [
                     SizedBox(
                      height: 60,
                      width: 250,
                      child: TextFontWidget(
                        text: 'All Students List',
                        fontsize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: SizedBox(
                          height: 65,
                          width: 250,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // const TextFontWidget(
                              //     text: "Select Date *", fontsize: 12),
                              GestureDetector(
                                onTap: () {
                                  calenderController.setDate(
                                      context: context, lastDay: DateTime.now());
                                },
                                child: AbsorbPointer(
                                  absorbing: true,
                                  child: TextFormFiledContainerWidget(
                                    width: 200,
                                    // height: 40,
                                    // color: screenContainerbackgroundColor,
                                    hintText: "  Select Date",
                                    title: 'Select Date🗓️ ',
                                    validator: checkFieldEmpty,
                                    // readOnly: true,
                                    controller: calenderController.dateCtr,
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(right: 20),
                    //   child: SizedBox(
                    //       height: 65,
                    //       width: 250,
                    //       child: Column(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           const TextFontWidget(
                    //               text: "Select Month *", fontsize: 12),
                    //           SizedBox(height: 40, child: SelectClassDropDown()),
                    //         ],
                    //       )),
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: SizedBox(
                        height: 65,
                        width: 250,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             TextFontWidget(text: "Select Class *", fontsize: 12),
                            SizedBox(height: 40, child: SelectClassDropDown()),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: SizedBox(
                          height: 65,
                          width: 250,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               TextFontWidget(text: "Select Period *", fontsize: 12),
                              SizedBox(height: 40, child: SelectPeriodDropDown()),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(bottom: 20),
              //   child: Row(
              //     children: [
              //       // Padding(
              //       //   padding: EdgeInsets.only(left: 20, right: 05),
              //       //   child: RouteSelectedTextContainer(title: 'Add Attendance'),
              //       // ),
              //       const Spacer(),
              //       // Padding(
              //       //   padding: const EdgeInsets.only(right: 20),
              //       //   child: SizedBox(
              //       //       height: 65,
              //       //       width: 250,
              //       //       child: Column(
              //       //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       //         crossAxisAlignment: CrossAxisAlignment.start,
              //       //         children: [
              //       //           const TextFontWidget(
              //       //               text: "Select Subject *", fontsize: 12),
              //       //           SizedBox(
              //       //               height: 40,
              //       //               child: SelectClassWiseSubjectDropDown()),
              //       //         ],
              //       //       )),
              //       // ),
              //       Padding(
              //         padding: const EdgeInsets.only(right: 20),
              //         child: SizedBox(
              //             height: 65,
              //             width: 250,
              //             child: Column(
              //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 const TextFontWidget(text: "Select Period *", fontsize: 12),
              //                 SizedBox(height: 40, child: SelectPeriodDropDown()),
              //               ],
              //             )),
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 08,
                        right: 05,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          attendenceController.ontapaddAttendence.value = false;
                        },
                        child: const RouteNonSelectedTextContainer(title: 'Home'),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    const RouteSelectedTextContainer(width: 140, title: 'Timetable Deatils'),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: InkWell(
                          onTap: () {
                            if (fkey.currentState?.validate() ?? false) {
                              attendenceController.checkAttendance();
                            }
                          },
                          child: Container(
                            color: themeColorBlue,
                            child:  Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                              child: Row(
                                children: [
                                  TextFontWidgetRouter(
                                      text: "Check Attendance", fontsize: 14, color: cWhite),
                                  sw10,
                                  Icon(
                                    Icons.refresh,
                                    color: cWhite,
                                  )
                                ],
                              ),
                            ),
                          )
                          // ButtonContainerWidget(
                          //   curving: 30,
                          //   colorindex: 0,
                          //   height: 40,
                          //   width: 180,
                          //   child: const Center(
                          //     child: TextFontWidget(
                          //       text: 'Check Attendance ',
                          //       fontsize: 14,
                          //       fontWeight: FontWeight.bold,
                          //       color: cWhite,
                          //     ),
                          //   ),
                          // ),
                          ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: cWhite,
                  height: 600,
                  width: 1150,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Obx(
                              () => TextFontWidget(
                                text: attendenceController.className.value == ""
                                    ? ""
                                    : 'Attendance Details of',
                                fontsize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            sw10,
                            Obx(
                              () => TextFontWidget(
                                text: attendenceController.className.value == ""
                                    ? ""
                                    : attendenceController.className.value,
                                fontsize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            sw50,
                            Obx(
                              () => TextFontWidget(
                                text: attendenceController.period.value == ""
                                    ? ""
                                    : 'Period ${attendenceController.period.value}',
                                fontsize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            // ignore: invalid_use_of_protected_member
                            Obx(() => attendenceController.studentAttenanceList.value.isEmpty
                                ? const SizedBox()
                                : InkWell(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return EditAttendanceAddingDialog();
                                        },
                                      );
                                    },
                                    child: Container(
                                      decoration: const BoxDecoration(color: themeColorBlue),
                                      child:  Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                                        child: Row(
                                          children: [
                                            // Icon(
                                            //   Icons.edit,
                                            //   color: cWhite,
                                            // ),
                                            // sw10,
                                            TextFontWidget(
                                              text: "Edit",
                                              fontsize: 16,
                                              color: cWhite,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ))
                          ],
                        ),
                      ),
                      Container(
                        color: cWhite,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Container(
                            color: cWhite,
                            height: 40,
                            child: const Row(
                              children: [
                                Expanded(
                                    flex: 1, child: CatrgoryTableHeaderWidget(headerTitle: 'No')),
                                SizedBox(
                                  width: 01,
                                ),
                                Expanded(
                                    flex: 2, child: CatrgoryTableHeaderWidget(headerTitle: 'ID')),
                                SizedBox(
                                  width: 01,
                                ),
                                Expanded(
                                    flex: 4, child: CatrgoryTableHeaderWidget(headerTitle: 'Name')),
                                SizedBox(
                                  width: 02,
                                ),
                                Expanded(
                                  flex: 3,
                                  child: CatrgoryTableHeaderWidget(headerTitle: 'Status'),
                                ),
                                SizedBox(
                                  width: 02,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 1, right: 1),
                          child: Container(
                              width: 1150,
                              decoration: BoxDecoration(
                                color: cWhite,
                                border: Border.all(color: cWhite),
                              ),
                              child: Obx(
                                () {
                                  if (attendenceController.studentAttenanceList.isEmpty) {
                                    return attendenceController.isAttendanceNotAvail.value
                                        ? Center(
                                            child: Column(
                                              children: [
                                                sh50,
                                                const Text('Not Data Available'),
                                                sh10,
                                                InkWell(
                                                  onTap: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return AttendanceAddingDialog();
                                                      },
                                                    );
                                                  },
                                                  child: const Padding(
                                                    padding: EdgeInsets.only(left: 20, right: 20),
                                                    child: RouteSelectedTextContainer(
                                                        title: 'Add Attendance'),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        : const Column(
                                            children: [
                                              sh50,
                                              Center(child: Text('Check Attendance')),
                                            ],
                                          );
                                  } else {
                                    return SizedBox(
                                      child: ListView.separated(
                                        itemBuilder: (context, index) {
                                          final studentData = attendenceController
                                              // ignore: invalid_use_of_protected_member
                                              .studentAttenanceList.value[index];
                                          // final studentData = StudentModel.fromMap(
                                          //     snapshot.data!.docs[index].data());
                                          return Padding(
                                            padding: const EdgeInsets.only(left: 10, right: 10),
                                            child: AttendanceDataTile(
                                              index: index,
                                              studentData: studentData,
                                            ),
                                          );
                                        },
                                        separatorBuilder: (context, index) {
                                          return const SizedBox(
                                            height: 02,
                                          );
                                        },
                                        itemCount:
                                            // ignore: invalid_use_of_protected_member
                                            attendenceController.studentAttenanceList.value.length,
                                      ),
                                    );
                                  }
                                },
                              )
                              //   },

                              // ),
                              ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AttendanceAddingDialog extends StatelessWidget {
  AttendanceAddingDialog({super.key});

  final GlobalKey<FormState> fkey = GlobalKey<FormState>();

  final AttendenceController attendenceController = Get.put(AttendenceController());

  @override
  Widget build(BuildContext context) {
    attendenceController.getClassStudentDetails();
    final size = MediaQuery.of(context).size;
    return AlertDialog(
      contentPadding: EdgeInsetsGeometry.lerp(EdgeInsets.zero, EdgeInsets.zero, 0),
      content: Container(
        decoration: const BoxDecoration(color: cWhite),
        width: size.width * 0.3,
        height: size.height * 0.7,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: fkey,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 60,
                  color: screenContainerbackgroundColor,
                  child:  Center(
                    child: TextFontWidget(text: 'Add Attendance', fontsize: 25),
                  ),
                ),
                sh10,
                SizedBox(
                  height: 65,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       TextFontWidget(text: "Select Subject *", fontsize: 12),
                      SizedBox(height: 40, child: SelectClassWiseSubjectDropDown()),
                    ],
                  ),
                ),
                sh10,
                const Row(
                  children: [
                    Expanded(flex: 2, child: CatrgoryTableHeaderWidget(headerTitle: 'Name')),
                    Expanded(flex: 1, child: CatrgoryTableHeaderWidget(headerTitle: 'Status'))
                  ],
                ),
                sh10,
                Obx(
                  () => Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          final studentsData =
                              // ignore: invalid_use_of_protected_member
                              attendenceController.allStudentAttenanceList.value[index];
                          return AttendanceListTile(studentData: studentsData);
                        },
                        separatorBuilder: (context, index) {
                          return sh10;
                        },
                        // ignore: invalid_use_of_protected_member
                        itemCount: attendenceController.allStudentAttenanceList.value.length),
                  ),
                ),
                Row(
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const RouteSelectedTextContainer(title: 'Cancel')),
                    const Spacer(),
                    InkWell(
                        onTap: () {
                          if (fkey.currentState?.validate() ?? false) {
                            attendenceController.uploadAttendanceList();

                            Navigator.pop(context);
                          }
                        },
                        child: const RouteSelectedTextContainer(title: 'Submit'))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AttendanceListTile extends StatefulWidget {
  const AttendanceListTile({super.key, required this.studentData});

  final StudentAttendanceModel studentData;

  @override
  State<AttendanceListTile> createState() => _AttendanceListTileState();
}

class _AttendanceListTileState extends State<AttendanceListTile> {
  final attendanceCtr = Get.put(AttendenceController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: TextFontWidget(text: widget.studentData.studentName, fontsize: 16),
          ),
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () {
                setState(() {
                  attendanceCtr.setAttendance(widget.studentData.uid, widget.studentData.present);
                });
              },
              child: RouteSelectedTextContainer(
                color: widget.studentData.present == true ? cgreen : cred,
                title: widget.studentData.present == true ? 'Present' : 'Absent',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
