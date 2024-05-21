import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/admin_section/teacher_controller/teacher_controller.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/attendance_status/teacher_attendance/teacher_attendence_info.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/attendance_status/teacher_attendance/teachers_attendance_tble.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/students/student_details/widgets/category_tableHeader.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';
import 'package:vidyaveechi_website/view/widgets/loading_widget/loading_widget.dart';
import 'package:vidyaveechi_website/view/widgets/routeSelectedTextContainer/routeSelectedTextContainer.dart';

class AllTeachersAttendance extends StatelessWidget {
  final TeacherController teacherController = Get.put(TeacherController());
  AllTeachersAttendance({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => teacherController.teacherAttendeceOnTap.value == true
        ? TeacherAttendenceHistoryInfo()
        : SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              color: screenContainerbackgroundColor,
              height: 1000,
              width: 1200,
              child: Padding(
                padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     const SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextFontWidget(
                            text: 'All Teacher Attendence History List  📃',
                            fontsize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ),
                    const RouteSelectedTextContainer(
                      title: 'All Teachers',
                      width: 200,
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
                                  child: CatrgoryTableHeaderWidget(
                                      headerTitle: 'No')),
                              SizedBox(
                                width: 02,
                              ),
                              Expanded(
                                  flex: 2,
                                  child: CatrgoryTableHeaderWidget(
                                      headerTitle: 'ID')),
                              SizedBox(
                                width: 02,
                              ),
                              Expanded(
                                  flex: 4,
                                  child: CatrgoryTableHeaderWidget(
                                      headerTitle: 'Name')),
                              SizedBox(
                                width: 02,
                              ),
                              Expanded(
                                  flex: 2,
                                  child: CatrgoryTableHeaderWidget(
                                      headerTitle: 'No.of ClassAttended')),
                              SizedBox(
                                width: 02,
                              ),
                              Expanded(
                                  flex: 2,
                                  child: CatrgoryTableHeaderWidget(
                                      headerTitle: 'No.of Day Present')),
                              SizedBox(
                                width: 02,
                              ),
                              Expanded(
                                  flex: 4,
                                  child: CatrgoryTableHeaderWidget(
                                      headerTitle: 'E mail')),
                              SizedBox(
                                width: 02,
                              ),
                              Expanded(
                                  flex: 3,
                                  child: CatrgoryTableHeaderWidget(
                                      headerTitle: 'Ph.NO')),
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
                            // width: 1100,
                            child: StreamBuilder(
                              stream: server
                                  .collection('SchoolListCollection')
                                  .doc(UserCredentialsController.schoolId)
                                  .collection(
                                      UserCredentialsController.batchId!)
                                  .doc(UserCredentialsController.batchId!)
                                  .collection('TeacherAttendence')
                                  .orderBy('teacherName')
                                  .snapshots(),
                              builder: (context, snaPS) {
                                if (snaPS.hasData) {
                                  return ListView.separated(
                                      itemBuilder: (context, index) {
                                        final data =
                                            snaPS.data!.docs[index].data();
                                        return GestureDetector(
                                          onTap: () {
                                            teacherController
                                                .teacherAttendeceOnTap
                                                .value = true;
                                            teacherController
                                                .attendenceTeacherDocID
                                                .value = data['docid'];
                                          },
                                          child: AllTeacherAttendeceDataList(
                                            data: data,
                                            index: index,
                                          ),
                                        );
                                      },
                                      separatorBuilder: (context, index) {
                                        return const SizedBox(
                                          height: 02,
                                        );
                                      },
                                      itemCount: snaPS.data!.docs.length);
                                } else if (snaPS.data == null) {
                                  return const LoadingWidget();
                                } else {
                                  return const LoadingWidget();
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ));
  }
}
