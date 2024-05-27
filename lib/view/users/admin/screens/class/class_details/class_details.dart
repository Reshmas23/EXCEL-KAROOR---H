import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/class_controller/class_controller.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/class/add_student/add_studentfunction.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/class/class_details/attendence_history_status/attendence_history_status.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/class/class_details/class_wise_std_list/cls_wise_list.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/class/class_details/exam_history_status/exam_history_status.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/class/class_details/widgets/leave_applicationList/leaveApplicationList.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/class/subject/create_subject.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/students/student_details/widgets/detail_tileContainer.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';
import 'package:vidyaveechi_website/view/widgets/blue_Container_widget/blue_Container_widget.dart';
import 'package:vidyaveechi_website/view/widgets/routeSelectedTextContainer/routeSelectedTextContainer.dart';
import 'package:vidyaveechi_website/view/widgets/routeSelectedTextContainer/route_NonSelectedContainer.dart';

class ClassDetailsContainer extends StatelessWidget {
  final ClassController classController = Get.put(ClassController());
  ClassDetailsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final data = classController.classModelData.value;
    classController.getClassBoyCount();
    return DefaultTabController(
      length: 3,
      child: Obx(() {
        return classController.ontapLeaveApplication.value == true
            ? LeaveApplicationList()
            : SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  color: screenContainerbackgroundColor,
                  height: 1000,
                  width: 1200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 25, top: 25),
                        child: TextFontWidget(
                          text: 'Class Details',
                          fontsize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
                        child: Container(
                          color: cWhite,
                          height: 260,
                          child: Column(
                            children: [
                              Container(
                                height: 60,
                                width: double.infinity,
                                color: Colors.white10,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 0),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 08,
                                                right: 05,
                                              ),
                                              child: GestureDetector(
                                                onTap: () {
                                                  classController.ontapClass.value = false;
                                                },
                                                child: const RouteNonSelectedTextContainer(
                                                    title: 'Home'),
                                              ),
                                            ),
                                            const RouteSelectedTextContainer(
                                                width: 140, title: 'Class Deatils'),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                color: themeColorBlue,
                                height: 02,
                              ),
                              Expanded(
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(top: 05, left: 10),
                                      child: CircleAvatar(
                                        radius: 80,
                                        backgroundColor: Colors.grey,
                                        child: CircleAvatar(
                                          radius: 78,
                                          backgroundImage:
                                              AssetImage('webassets/png/roll-call.png'),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 20),
                                            child: Container(
                                              width: double.infinity,
                                              height: 100,
                                              color: themeColorBlue.withOpacity(0.1),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(left: 10, top: 10),
                                                    child: TextFontWidget(
                                                      text: data!.className,
                                                      fontsize: 20,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(top: 20, left: 10),
                                                    child: SizedBox(
                                                      width: 500,
                                                      child: StreamBuilder(
                                                          stream: server
                                                              .collection('SchoolListCollection')
                                                              .doc(UserCredentialsController
                                                                  .schoolId)
                                                              .collection(UserCredentialsController
                                                                  .batchId!)
                                                              .doc(UserCredentialsController
                                                                  .batchId!)
                                                              .collection('classes')
                                                              .doc(classController
                                                                  .classModelData.value!.docid)
                                                              .collection('Students')
                                                              .snapshots(),
                                                          builder: (context, snapshot) {
                                                            if (snapshot.connectionState ==
                                                                ConnectionState.waiting) {
                                                              return const SizedBox();
                                                            } else if (snapshot
                                                                .data!.docs.isEmpty) {
                                                              return const SizedBox();
                                                            } else if (!snapshot.hasData) {
                                                              return const SizedBox();
                                                            } else {
                                                              return Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment.start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment.start,
                                                                children: [
                                                                  StudentDetailTileContainer(
                                                                    flex: 1,
                                                                    title: 'Total Students',
                                                                    subtitle:
                                                                        '${snapshot.data!.docs.length}',
                                                                  ),
                                                                  StudentDetailTileContainer(
                                                                    flex: 1,
                                                                    title: 'Male',
                                                                    subtitle: classController
                                                                        .boysCount
                                                                        .toString(),
                                                                  ),
                                                                  //         // const StudentDetailTileContainer(
                                                                  //         //   flex: 1,
                                                                  //         //   title: 'Batch Year',
                                                                  //         //   subtitle: 'March 2023',
                                                                  //         // ),
                                                                  StudentDetailTileContainer(
                                                                    flex: 1,
                                                                    title: 'Female',
                                                                    subtitle: classController
                                                                        .girlsCount
                                                                        .toString(),
                                                                  ),
                                                                  //         StudentDetailTileContainer(
                                                                  //           flex: 1,
                                                                  //           title: 'Join Date',
                                                                  //           subtitle:
                                                                  //               stringTimeToDateConvert(
                                                                  //                   data.createDate),
                                                                  //         ),
                                                                ],
                                                              );
                                                            }
                                                          }),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            // flex: 1,
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 20),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Row(
                                                    children: [
                                                      const Icon(Icons.person),
                                                       TextFontWidget(
                                                        text: " ${data.classTeacherName??''}",
                                                        fontsize: 12,
                                                        color: themeColorBlue,
                                                      ),
                                                      const Spacer(),
                                                      BlueContainerWidget(
                                                          color: themeColorBlue,
                                                          fontSize: 12,
                                                          title: 'Assign Class Teacher',
                                                          width: 125,
                                                          fontWeight: FontWeight.w500,
                                                        ),
                                                        const SizedBox(
                                                        width: 10,
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          classController
                                                              .ontapLeaveApplication.value = true;
                                                          // print(
                                                          //     'onleave tap=======>${classController.ontapLeaveApplication.value}');
                                                        },
                                                        child: BlueContainerWidget(
                                                          color: themeColorBlue,
                                                          fontSize: 12,
                                                          title: 'Leave applications',
                                                          width: 120,
                                                          fontWeight: FontWeight.w500,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      GestureDetector(
                                                        onTap: () =>
                                                            addStudentToClass(context, data.docid),
                                                        child: BlueContainerWidget(
                                                          color: themeColorBlue,
                                                          fontSize: 12,
                                                          title: '🔗 Add Student',
                                                          width: 120,
                                                          fontWeight: FontWeight.w500,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      GestureDetector(
                                                        onTap: () => createSubjectFunction(
                                                            context, data.docid),
                                                        child: BlueContainerWidget(
                                                          color: themeColorBlue,
                                                          fontSize: 12,
                                                          title: '⚙️ Add Subjects',
                                                          width: 120,
                                                          fontWeight: FontWeight.w500,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                   Row(
                                                    children: [
                                                      const Icon(Icons.attach_money),
                                                      TextFontWidget(
                                                        text: data.classfee.toString(),
                                                        fontsize: 12,
                                                        color: themeColorBlue,
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                        child: Column(
                          children: [
                            Container(
                              color: cWhite,
                              height: 40,
                              child: const TabBar(
                                indicatorColor: cWhite,
                                tabAlignment: TabAlignment.start,
                                isScrollable: true,
                                labelColor: themeColorBlue,
                                labelStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                                tabs: [
                                  Tab(
                                    text: 'STUDENTS',
                                  ),
                                  Tab(
                                    text: 'ATTENDANCE',
                                  ),
                                  Tab(
                                    text: 'EXAM ',
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
                        child: Container(
                          width: double.infinity,
                          color: themeColorBlue,
                          height: 02,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
                        child: Container(
                          height: 600,
                          color: cWhite,
                          // color: Colors.amber,

                          // height: 300,
                          child: TabBarView(children: [
                             ClassWiseStudentList(),
                            // const FeesHistory(), //........................ Student FEES
                            AttendenceHistory(), //.......................... Student Attendence
                            ExamHistory() //............................ Student Exam History
                          ]),
                        ),
                      )
                    ],
                  ),
                ),
              );
      }),
    );
  }
}
