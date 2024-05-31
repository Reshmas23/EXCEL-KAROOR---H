import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vidyaveechi_website/controller/admin_section/teacher_controller/teacher_controller.dart';
import 'package:vidyaveechi_website/controller/class_controller/class_controller.dart';
import 'package:vidyaveechi_website/controller/leaveapplication_controller/leaveapplication_controller.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/drop_down/leaveapplication/leaveapplication.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/class/class_details/widgets/leave_applicationList/leaveList.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/students/student_details/widgets/category_tableHeader.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';
import 'package:vidyaveechi_website/view/widgets/blue_Container_widget/blue_Container_widget.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';
import 'package:vidyaveechi_website/view/widgets/routeSelectedTextContainer/routeSelectedTextContainer.dart';
import 'package:vidyaveechi_website/view/widgets/routeSelectedTextContainer/route_NonSelectedContainer.dart';

class LeaveApplicationList extends StatelessWidget {
  final TeacherController teacherController = Get.put(TeacherController());
  final ClassController classController = Get.put(ClassController());
  final LeaveApplicationController leaveApplicationController =
      Get.put(LeaveApplicationController());
  // final ClassController leeveController = Get.put(ClassController());
  // final AttendenceController attendenceController = Get.put(AttendenceController());
  LeaveApplicationList({super.key});

  @override
  Widget build(BuildContext context) {
    final date = DateTime.now();
    DateTime parseDate = DateTime.parse(date.toString());
    // final month = DateFormat('MMMM-yyyy');
    // String monthwise = month.format(parseDate);
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    String formatted = formatter.format(parseDate);
    return SingleChildScrollView(
      scrollDirection:
          ResponsiveWebSite.isMobile(context) ? Axis.horizontal : Axis.vertical,
      child: Container(
        color: screenContainerbackgroundColor,
        height: 1000,
        width: ResponsiveWebSite.isDesktop(context) ? double.infinity : 1200,
        child: Padding(
          padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Leave Application Of Students',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 10,
                width: double.infinity,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      classController.ontapLeaveApplication.value = false;
                    },
                    child: const RouteNonSelectedTextContainer(
                      title: 'Class Details',
                      width: 200,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const RouteSelectedTextContainer(
                    title: 'Leave Application',
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 80,
                    child: Obx(() => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // const Spacer(),
                            leaveApplicationController.leaveApplication.value ==
                                    true
                                ? Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: SizedBox(
                                          height: 40,
                                          child: RouteSelectedTextContainer(
                                            title: "Today Status",
                                            fontSize: 12,
                                            color: themeColorBlue,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                      Checkbox(
                                        value: true,
                                        onChanged: (value) {
                                          leaveApplicationController
                                              .leaveApplication.value = false;
                                        },
                                      ),
                                      const SizedBox(
                                          width:
                                              8), // Adding some additional spacing
                                    ],
                                  )
                                : Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SizedBox(
                                          width: 200,
                                          height: ResponsiveWebSite.isMobile(
                                                  context)
                                              ? 80
                                              : 90,
                                          // color: cWhite,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text('Date *',
                                                  style: TextStyle(
                                                    fontSize: 12.5,
                                                  )),
                                              const SizedBox(
                                                height: 05,
                                              ),
                                              SizedBox(
                                                height: 40,
                                                child:
                                                    SelectLeaveApplicationDate(),
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
                                      ),
                                      Checkbox(
                                        value: false,
                                        onChanged: (value) {
                                          leaveApplicationController
                                              .leaveApplication.value = true;
                                        },
                                      )
                                    ],
                                  ),
                          ],
                        )),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                color: cWhite,
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Container(
                    color: cWhite,
                    height: 40,
                    child: const Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child:
                                CatrgoryTableHeaderWidget(headerTitle: 'No')),
                        SizedBox(
                          width: 02,
                        ),
                        Expanded(
                            flex: 2,
                            child:
                                CatrgoryTableHeaderWidget(headerTitle: 'ID')),
                        SizedBox(
                          width: 02,
                        ),
                        Expanded(
                            flex: 4,
                            child:
                                CatrgoryTableHeaderWidget(headerTitle: 'Name')),
                        SizedBox(
                          width: 02,
                        ),
                        Expanded(
                            flex: 2,
                            child: CatrgoryTableHeaderWidget(
                                headerTitle: 'Total Leaves')),
                        SizedBox(
                          width: 02,
                        ),
                        Expanded(
                            flex: 2,
                            child: CatrgoryTableHeaderWidget(
                                headerTitle: 'Leave Date')),
                        SizedBox(
                          width: 02,
                        ),
                        // Expanded(
                        //     flex: 4, child: CatrgoryTableHeaderWidget(headerTitle: 'E mail')),
                        SizedBox(
                          width: 02,
                        ),
                        Expanded(
                            flex: 3,
                            child: CatrgoryTableHeaderWidget(
                                headerTitle: 'Phone Number')),
                        SizedBox(
                          width: 02,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  // width: 1200,
                  decoration: BoxDecoration(
                    color: cWhite,
                    border: Border.all(color: cWhite),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5, left: 5),
                    child: SizedBox(
                      child: Builder(builder: (context) {
                        return Obx(() => StreamBuilder(
                              stream: leaveApplicationController
                                          .leaveApplication.value ==
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
                                      .collection('LeaveApplication')
                                      .doc(formatted)
                                      .collection('StudentsList')
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
                                      .collection('LeaveApplication')
                                      .doc(leaveApplicationController
                                          .fetchClassWiseDatevalue.value)
                                      .collection('StudentsList')
                                      .snapshots(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  // Data is available, proceed with ListView
                                  return ListView.separated(
                                    itemBuilder: (context, index) {
                                      final data =
                                          snapshot.data!.docs[index].data();
                                      final DateTime dfromdate = DateTime.parse(
                                          data['dleaveFromDate']);
                                      final DateTime dtodate =
                                          DateTime.parse(data['dleaveToDate']);
                                      final int compare =
                                          dtodate.difference(dfromdate).inDays;
                                      return LeaveApplicationData(
                                        compare: compare,
                                        index: index,
                                        data: data,
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return const SizedBox(
                                        height: 02,
                                      );
                                    },
                                    itemCount: snapshot.data!.docs.length,
                                  );
                                } else if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                    child:
                                        CircularProgressIndicator(), // Show loading indicator
                                  );
                                } else if (snapshot.hasError) {
                                  return Center(
                                    child: Text(
                                        'Error: ${snapshot.error}'), // Show error message
                                  );
                                } else if (!snapshot.hasData ||
                                    snapshot.data == null) {
                                  return const Center(
                                    child: Text(
                                        'No data available'), // Show message when no data
                                  );
                                } else {
                                  return const Center(
                                    child: Text(
                                        'No data available'), // Show message when no data
                                  );
                                }
                              },
                            ));
                      }),
                    ),
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
