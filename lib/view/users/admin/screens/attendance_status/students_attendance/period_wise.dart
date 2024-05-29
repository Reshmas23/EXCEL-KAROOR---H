import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vidyaveechi_website/controller/attendence_controller/attendence_controller.dart';
import 'package:vidyaveechi_website/controller/class_controller/class_controller.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/drop_down/attendence/day_dropdown.dart';
import 'package:vidyaveechi_website/view/drop_down/attendence/month_dropdown.dart';
import 'package:vidyaveechi_website/view/drop_down/select_class.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/attendance_status/students_attendance/student_attendance_tble.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/attendence/attendence_adding_view.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';
import 'package:vidyaveechi_website/view/widgets/loading_widget/loading_widget.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';

import '../../../../../widgets/blue_Container_widget/blue_Container_widget.dart';

class PeriodWiseStudentsAttendance extends StatelessWidget {
  final AttendenceController attendenceController =
      Get.put(AttendenceController());
  final ClassController classController = Get.put(ClassController());
  PeriodWiseStudentsAttendance({super.key});
  @override
  Widget build(BuildContext context) {
    final date = DateTime.now();
    DateTime parseDate = DateTime.parse(date.toString());
    final month = DateFormat('MMMM-yyyy');
    String monthwise = month.format(parseDate);
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    String formatted = formatter.format(parseDate);

    return Obx(
      () => attendenceController.ontapaddAttendence.value == true
          ? AttendanceAddingList()
          : SingleChildScrollView(
              scrollDirection: ResponsiveWebSite.isMobile(context)
                  ? Axis.horizontal
                  : Axis.vertical,
              child: Container(
                color: screenContainerbackgroundColor,
                height: ResponsiveWebSite.isMobile(context) ? 890 : 820,
                width: ResponsiveWebSite.isDesktop(context)
                    ? double.infinity
                    : 1200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 20, top: 20),
                          child: TextFontWidget(
                            text: 'All Students Attendance ',
                            fontsize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        // Padding(
                        //   padding: const EdgeInsets.only(top: 20, right: 25),
                        //   child: GestureDetector(
                        //     onTap: () {
                        //       attendenceController.ontapaddAttendence.value = true;
                        //     },
                        //     child: ButtonContainerWidget(
                        //       curving: 30,
                        //       colorindex: 0,
                        //       height: 40,
                        //       width: 180,
                        //       child: const Center(
                        //         child: TextFontWidgetRouter(
                        //           text: 'Add Attendance ',
                        //           fontsize: 14,
                        //           fontWeight: FontWeight.bold,
                        //           color: cWhite,
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: SizedBox(
                              height: 65,
                              width: 250,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const TextFontWidget(
                                      text: "Select Class *", fontsize: 12),
                                  SizedBox(
                                      height: 40, child: SelectClassDropDown()),
                                ],
                              )),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: ResponsiveWebSite.isMobile(context) ? 20 : 10),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          color: cWhite,
                          height:
                              ResponsiveWebSite.isMobile(context) ? 750 : 680,
                          width: double.infinity,
                          child: StreamBuilder(
                              stream: attendenceController
                                          .todayAttendence.value ==
                                      true
                                  ? server
                                      .collection('SchoolListCollection')
                                      .doc(UserCredentialsController.schoolId)
                                      .collection(
                                          UserCredentialsController.batchId!)
                                      .doc(UserCredentialsController.batchId!)
                                      .collection('classes')
                                      .doc(Get.find<ClassController>()
                                          .classDocID
                                          .value)
                                      .collection('Attendence')
                                      .doc(monthwise)
                                      .collection(monthwise)
                                      .doc(formatted)
                                      .collection('Subjects')
                                      .orderBy('period')
                                      .snapshots()
                                  : server
                                      .collection('SchoolListCollection')
                                      .doc(UserCredentialsController.schoolId)
                                      .collection(
                                          UserCredentialsController.batchId!)
                                      .doc(UserCredentialsController.batchId!)
                                      .collection('classes')
                                      .doc(Get.find<ClassController>()
                                          .classDocID
                                          .value)
                                      .collection('Attendence')
                                      .doc(attendenceController
                                          .fetchClassWiseMonthvalue.value)
                                      .collection(attendenceController
                                          .fetchClassWiseMonthvalue.value)
                                      .doc(attendenceController
                                          .fetchClassWiseDatevalue.value)
                                      .collection('Subjects')
                                      .orderBy('period')
                                      .snapshots(),
                              builder: (context, snaps) {
                                if (snaps.hasData) {
                                  return DefaultTabController(
                                    length: snaps.data!.docs.length,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 80,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Spacer(),
                                              attendenceController
                                                          .todayAttendence
                                                          .value ==
                                                      true
                                                  ? Row(
                                                      children: [
                                                        BlueContainerWidget(
                                                            title:
                                                                "Today Status",
                                                            fontSize: 16,
                                                            color:
                                                                themeColorBlue,
                                                            width: 180),
                                                        const SizedBox(
                                                          width: 20,
                                                        ),
                                                        Checkbox(
                                                          value: true,
                                                          onChanged: (value) {
                                                            attendenceController
                                                                .todayAttendence
                                                                .value = false;
                                                          },
                                                        )
                                                      ],
                                                    )
                                                  : Row(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Container(
                                                            width: 250,
                                                            height: ResponsiveWebSite
                                                                    .isMobile(
                                                                        context)
                                                                ? 80
                                                                : 100,
                                                            color: cWhite,
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                const TextFontWidget(
                                                                    text:
                                                                        'Month *',
                                                                    fontsize:
                                                                        12.5),
                                                                const SizedBox(
                                                                  height: 05,
                                                                ),
                                                                SizedBox(
                                                                  height: 40,
                                                                  child:
                                                                      SelectClassAttendenceMonthDropDown(),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Container(
                                                            width: 200,
                                                            height: ResponsiveWebSite
                                                                    .isMobile(
                                                                        context)
                                                                ? 80
                                                                : 100,
                                                            color: cWhite,
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                const TextFontWidget(
                                                                    text:
                                                                        'Date *',
                                                                    fontsize:
                                                                        12.5),
                                                                const SizedBox(
                                                                  height: 05,
                                                                ),
                                                                SizedBox(
                                                                  height: 40,
                                                                  child:
                                                                      SelectClassAttendenceDayDropDown(),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 20,
                                                        ),
                                                        BlueContainerWidget(
                                                            title: "Today ? ",
                                                            fontSize: 12,
                                                            color:
                                                                themeColorBlue,
                                                            width: 80),
                                                        Checkbox(
                                                          value: false,
                                                          onChanged: (value) {
                                                            attendenceController
                                                                .todayAttendence
                                                                .value = true;
                                                          },
                                                        )
                                                      ],
                                                    ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 0, left: 20, right: 20),
                                          child: Column(
                                            children: [
                                              Container(
                                                color: cWhite,
                                                height: 40,
                                                child: TabBar(
                                                  indicatorColor: cWhite,
                                                  tabAlignment:
                                                      TabAlignment.start,
                                                  isScrollable: true,
                                                  labelColor: Colors.blue,
                                                  labelStyle: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 10),
                                                  tabs: List.generate(
                                                    snaps.data!.docs.length,
                                                    (index) => Tab(
                                                      text:
                                                          '${snaps.data!.docs[index].data()['period']} Period',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        // ),
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                top: 0, left: 20, right: 20),
                                            child: Container(
                                              height: 480,
                                              color: cWhite,
                                              child: (attendenceController
                                                              .todayAttendence
                                                              .value &&
                                                          classController
                                                                  .className
                                                                  .value ==
                                                              '') ||
                                                      (!attendenceController
                                                              .todayAttendence
                                                              .value &&
                                                          (attendenceController
                                                                      .fetchClassWiseMonthvalue
                                                                      .value ==
                                                                  'dd' ||
                                                              attendenceController
                                                                      .fetchClassWiseDatevalue
                                                                      .value ==
                                                                  'dd'))
                                                  ? Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                classController
                                                                            .className
                                                                            .value ==
                                                                        ''
                                                                    ? "Please select the class"
                                                                    : "Please select month and date",
                                                                style: const TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  : snaps.data!.docs.isEmpty
                                                      ? const Column(
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                    "Please take attendence"),
                                                              ],
                                                            ),
                                                          ],
                                                        )
                                                      : TabBarView(
                                                          children:
                                                              List.generate(
                                                            snaps.data!.docs
                                                                .length,
                                                            (index) =>
                                                                StudentAttendanceDataList(
                                                              subjectID: snaps
                                                                      .data!
                                                                      .docs[index]
                                                                      .data()[
                                                                  'docid'],
                                                              formatted: attendenceController
                                                                          .todayAttendence
                                                                          .value ==
                                                                      true
                                                                  ? formatted
                                                                  : attendenceController
                                                                      .fetchClassWiseDatevalue
                                                                      .value,
                                                              monthwise: attendenceController
                                                                          .todayAttendence
                                                                          .value ==
                                                                      true
                                                                  ? monthwise
                                                                  : attendenceController
                                                                      .fetchClassWiseMonthvalue
                                                                      .value,
                                                              data: snaps.data!
                                                                  .docs[index]
                                                                  .data(),
                                                            ),
                                                          ),
                                                        ),
                                            ))
                                      ],
                                    ),
                                  );
                                } else if (snaps.data == null) {
                                  return const Center(
                                    child: TextFontWidget(
                                        text: "No recordes found",
                                        fontsize: 16),
                                  );
                                } else {
                                  return const LoadingWidget();
                                }
                              }),
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
