import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vidyaveechi_website/controller/admin_section/teacher_controller/teacher_controller.dart';
import 'package:vidyaveechi_website/controller/class_controller/class_controller.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/drop_down/teacher_attendence/select_day.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/attendance_status/teacher_attendance/attendence_dataList.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';
import 'package:vidyaveechi_website/view/widgets/loading_widget/loading_widget.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';
import 'package:vidyaveechi_website/view/widgets/routeSelectedTextContainer/routeSelectedTextContainer.dart';
import 'package:vidyaveechi_website/view/widgets/routeSelectedTextContainer/route_NonSelectedContainer.dart';

import '../../../../../widgets/blue_Container_widget/blue_Container_widget.dart';

class TeacherAttendenceHistoryInfo extends StatelessWidget {
  final TeacherController teacherController = Get.put(TeacherController());
  TeacherAttendenceHistoryInfo({super.key, });
  @override
  Widget build(BuildContext context) {
    final date = DateTime.now();
    DateTime parseDate = DateTime.parse(date.toString());
    final month = DateFormat('MMMM-yyyy');
    String monthwise = month.format(parseDate);
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    String formatted = formatter.format(parseDate);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        color: screenContainerbackgroundColor,
        height: ResponsiveWebSite.isMobile(context) ? 890 : 820,
        width: 1200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             const Padding(
              padding: EdgeInsets.only(left: 20, top: 20),
              child: TextFontWidget(
                text: 'All History Teacher Attendance with Info 📶',
                fontsize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: ResponsiveWebSite.isMobile(context) ? 20 : 10),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: cWhite,
                  height: ResponsiveWebSite.isMobile(context) ? 750 : 680,
                  width: double.infinity,
                  child: StreamBuilder(
                      stream: server
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
                          .snapshots(),
                      builder: (context, snaps) {
                        if (snaps.hasData) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: SizedBox(
                                  height: 30,
                                  child: Obx(() => Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, right: 05),
                                            child: GestureDetector(
                                              onTap: () => teacherController
                                                  .teacherAttendeceOnTap
                                                  .value = false,
                                              child:
                                                  const RouteNonSelectedTextContainer(
                                                title: 'Home',
                                              ),
                                            ),
                                          ),
                                          const RouteSelectedTextContainer(
                                            title: 'Attendence List',
                                            width: 200,
                                          ),
                                          const Spacer(),
                                          teacherController
                                                      .teacherAttendeceMonthWiswOnTap
                                                      .value ==
                                                  false
                                              ? Row(
                                                  children: [
                                                    BlueContainerWidget(
                                                        title: "Month Wise ? ",
                                                        fontSize: 12,
                                                        color: themeColorBlue,
                                                        width: 100),
                                                    Checkbox(
                                                      value: false,
                                                      onChanged: (value) {
                                                        teacherController
                                                            .teacherAttendeceMonthWiswOnTap
                                                            .value = true;
                                                      },
                                                    )
                                                  ],
                                                )
                                              : Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: SizedBox(
                                                        height: 40,
                                                        width: 200,
                                                        child:
                                                            SelectTeacherAttendenceDayDropDown(),
                                                      ),
                                                    ),
                                                    BlueContainerWidget(
                                                        title: "Day Wise ? ",
                                                        fontSize: 12,
                                                        color: themeColorBlue,
                                                        width: 100),
                                                    Checkbox(
                                                      value: false,
                                                      onChanged: (value) {
                                                        teacherController
                                                            .teacherAttendeceMonthWiswOnTap
                                                            .value = false;
                                                      },
                                                    )
                                                  ],
                                                ),
                                        ],
                                      )),
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
                          
                                  child:TeacherAttendanceDataList()
                                ),
                              )
                            ],
                          );
                        } else if (snaps.data == null) {
                          return  const Center(
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
    );
  }
}
