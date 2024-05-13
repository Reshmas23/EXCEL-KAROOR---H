import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vidyaveechi_website/controller/attendence_controller/attendence_controller.dart';
import 'package:vidyaveechi_website/controller/class_controller/class_controller.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/drop_down/attendence/day_dropdown.dart';
import 'package:vidyaveechi_website/view/drop_down/attendence/month_dropdown.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/attendance_status/students_attendance/student_attendance_tble.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/attendence/attendence_adding_view.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';
import 'package:vidyaveechi_website/view/widgets/blue_Container_widget/blue_Container_widget.dart';
import 'package:vidyaveechi_website/view/widgets/loading_widget/loading_widget.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';

class AttendenceHistory extends StatelessWidget {
  AttendenceHistory({
    super.key,
  });

  final AttendenceController attendenceController = Get.put(AttendenceController());
  final ClassController classController = Get.put(ClassController());

  @override
  Widget build(BuildContext context) {
    final data = classController.classModelData.value;
    Get.find<ClassController>().classDocID.value = data!.docid;
    final date = DateTime.now();
    DateTime parseDate = DateTime.parse(date.toString());
    final month = DateFormat('MMMM-yyyy');
    String monthwise = month.format(parseDate);
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    String formatted = formatter.format(parseDate);
    return SingleChildScrollView(
      child: SizedBox(
        height: 850,
        width: double.infinity,
        child: Column(
          children: [
            Obx(
              () => attendenceController.ontapaddAttendence.value == true
                  ? AttendanceAddingList()
                  : Container(
                      color: cWhite,
                      height: ResponsiveWebSite.isMobile(context) ? 890 : 820,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20, top: 20),
                                child: TextFontWidget(
                                  text: 'Students Attendance ',
                                  fontsize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Spacer(),
                              // Padding(
                              //   padding:
                              //       const EdgeInsets.only(top: 20, right: 25),
                              //   child: GestureDetector(
                              //     onTap: () {
                              //       attendenceController
                              //           .ontapaddAttendence.value = true;
                              //     },
                              //     child: ButtonContainerWidget(
                              //       curving: 30,
                              //       colorindex: 0,
                              //       height: 40,
                              //       width: 180,
                              //       child: const Center(
                              //         child: TextFontWidget(
                              //           text: 'Add Attendance ',
                              //           fontsize: 14,
                              //           fontWeight: FontWeight.bold,
                              //           color: cWhite,
                              //         ),
                              //       ),
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(top: ResponsiveWebSite.isMobile(context) ? 20 : 10),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                color: cWhite,
                                height: ResponsiveWebSite.isMobile(context) ? 750 : 680,
                                width: double.infinity,
                                child: StreamBuilder(
                                    stream: attendenceController.todayAttendence.value == true
                                        ? server
                                            .collection('SchoolListCollection')
                                            .doc(UserCredentialsController.schoolId)
                                            .collection(UserCredentialsController.batchId!)
                                            .doc(UserCredentialsController.batchId!)
                                            .collection('classes')
                                            .doc(Get.find<ClassController>().classDocID.value)
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
                                            .collection(UserCredentialsController.batchId!)
                                            .doc(UserCredentialsController.batchId!)
                                            .collection('classes')
                                            .doc(Get.find<ClassController>().classDocID.value)
                                            .collection('Attendence')
                                            .doc(
                                                attendenceController.fetchClassWiseMonthvalue.value)
                                            .collection(
                                                attendenceController.fetchClassWiseMonthvalue.value)
                                            .doc(attendenceController.fetchClassWiseDatevalue.value)
                                            .collection('Subjects')
                                            .orderBy('period')
                                            .snapshots(),
                                    builder: (context, snaps) {
                                      if (snaps.hasData) {
                                        return DefaultTabController(
                                          length: snaps.data!.docs.length,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 80,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    const Spacer(),
                                                    attendenceController.todayAttendence.value ==
                                                            true
                                                        ? Row(
                                                            children: [
                                                              BlueContainerWidget(
                                                                  title: "Today Status",
                                                                  fontSize: 16,
                                                                  color: themeColorBlue,
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
                                                                padding: const EdgeInsets.all(8.0),
                                                                child: Container(
                                                                  width: 250,
                                                                  height:
                                                                      ResponsiveWebSite.isMobile(
                                                                              context)
                                                                          ? 80
                                                                          : 100,
                                                                  color: cWhite,
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment.start,
                                                                    children: [
                                                                      TextFontWidget(
                                                                          text: 'Month *',
                                                                          fontsize: 12.5),
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
                                                                padding: const EdgeInsets.all(8.0),
                                                                child: Container(
                                                                  width: 200,
                                                                  height:
                                                                      ResponsiveWebSite.isMobile(
                                                                              context)
                                                                          ? 80
                                                                          : 100,
                                                                  color: cWhite,
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment.start,
                                                                    children: [
                                                                      TextFontWidget(
                                                                          text: 'Date *',
                                                                          fontsize: 12.5),
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
                                                                  color: themeColorBlue,
                                                                  width: 80),
                                                              Checkbox(
                                                                value: false,
                                                                onChanged: (value) {
                                                                  attendenceController
                                                                      .todayAttendence.value = true;
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
                                                        tabAlignment: TabAlignment.start,
                                                        isScrollable: true,
                                                        labelColor: Colors.blue,
                                                        labelStyle: const TextStyle(
                                                            fontWeight: FontWeight.w400,
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
                                                  width: double.infinity,
                                                  color: screenContainerbackgroundColor,
                                                  height: 02,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 0, left: 05, right: 05),
                                                child: Container(
                                                  height: 480,
                                                  color: cWhite,
                                                  // color: Colors.amber,
                                                  //// height: 300,
                                                  child: TabBarView(
                                                      children: List.generate(
                                                          snaps.data!.docs.length,
                                                          (index) => StudentAttendanceDataList(
                                                                subjectID: snaps.data!.docs[index]
                                                                    .data()['docid'],
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
                                                                data:
                                                                    snaps.data!.docs[index].data(),
                                                              ))),
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      } else if (snaps.data == null) {
                                        return Center(
                                          child: TextFontWidget(
                                              text: "No recordes found", fontsize: 16),
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

            // PeriodWiseStudentsAttendance(),
            // Container(
            //   height: 40,
            //   width: 1200,
            //   color: themeColorBlue.withOpacity(0.1),
            //   child: const Padding(
            //     padding: EdgeInsets.all(8.0),
            //     child: TextFontWidget(
            //       text: 'Attendence Section',
            //       fontsize: 16,
            //       fontWeight: FontWeight.bold,
            //       color: themeColorBlue,
            //     ),
            //   ),
            // ),
            // const Padding(
            //   padding: EdgeInsets.only(top: 10),
            //   child:
            //    Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       StudentCategoryTileContainer(
            //           title: 'No.of Present',
            //           subTitle: '1500 ',
            //           color: Color.fromARGB(255, 121, 240, 125)),
            //       StudentCategoryTileContainer(
            //           title: 'No.of Absent',
            //           subTitle: '1000',
            //           color: Color.fromARGB(255, 234, 102, 92)),
            //       StudentCategoryTileContainer(
            //           title: 'Working Days',
            //           subTitle: '2500 ',
            //           color: Color.fromARGB(255, 121, 123, 240))
            //     ],
            //   ),
            // ),
            // Expanded(
            //   child: Column(
            //     children: [
            //       Padding(
            //         padding:
            //             const EdgeInsets.only(left: 10, right: 10, top: 20),
            //         child: Container(
            //           color: cWhite,
            //           height: 40,
            //           child: const Row(
            //             children: [
            //               Expanded(
            //                   flex: 1,
            //                   child: CatrgoryTableHeaderColorWidget(
            //                       color: themeColorBlue,
            //                       textcolor: cWhite,
            //                       headerTitle: 'No')),
            //               SizedBox(
            //                 width: 02,
            //               ),
            //               Expanded(
            //                   flex: 1,
            //                   child: CatrgoryTableHeaderColorWidget(
            //                       color: themeColorBlue,
            //                       textcolor: cWhite,
            //                       headerTitle: 'Days')),
            //               SizedBox(
            //                 width: 02,
            //               ),
            //               Expanded(
            //                   flex: 5,
            //                   child: CatrgoryTableHeaderColorWidget(
            //                       color: themeColorBlue,
            //                       textcolor: cWhite,
            //                       headerTitle: 'Subjects')),
            //               SizedBox(
            //                 width: 02,
            //               ),
            //               Expanded(
            //                   flex: 1,
            //                   child: CatrgoryTableHeaderColorWidget(
            //                       color: themeColorBlue,
            //                       textcolor: cWhite,
            //                       headerTitle: 'Present')),
            //               SizedBox(
            //                 width: 02,
            //               ),
            //               Expanded(
            //                   flex: 1,
            //                   child: CatrgoryTableHeaderColorWidget(
            //                       color: themeColorBlue,
            //                       textcolor: cWhite,
            //                       headerTitle: 'Absent')),
            //               SizedBox(
            //                 width: 02,
            //               ),
            //               Expanded(
            //                   flex: 1,
            //                   child: CatrgoryTableHeaderColorWidget(
            //                       color: themeColorBlue,
            //                       textcolor: cWhite,
            //                       headerTitle: 'Total Students')),
            //               SizedBox(
            //                 width: 02,
            //               ),
            //               Expanded(
            //                   flex: 1,
            //                   child: CatrgoryTableHeaderColorWidget(
            //                       color: themeColorBlue,
            //                       textcolor: cWhite,
            //                       headerTitle: 'Presnet/Absent')),
            //               SizedBox(
            //                 width: 02,
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //       Expanded(
            //           child: SizedBox(
            //               child: ListView.separated(
            //                   itemBuilder: (context, index) {
            //                     return Padding(
            //                       padding: const EdgeInsets.only(
            //                           left: 10, right: 10),
            //                       child: ClassAttendenceDataListContainer(
            //                           index: index),
            //                     );
            //                   },
            //                   separatorBuilder: (context, index) {
            //                     return const SizedBox(
            //                       height: 02,
            //                     );
            //                   },
            //                   itemCount: 100)))
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
