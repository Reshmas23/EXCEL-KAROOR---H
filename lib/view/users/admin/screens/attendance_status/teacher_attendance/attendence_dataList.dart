import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/admin_section/teacher_controller/teacher_controller.dart';
import 'package:vidyaveechi_website/controller/student_attendence_controller/student_attendence_controller.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/result/widget/data_container_marks.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/students/student_details/widgets/category_tableHeader.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';
import 'package:vidyaveechi_website/view/widgets/loading_widget/loading_widget.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';

class TeacherAttendanceDataList extends StatelessWidget {
  TeacherAttendanceDataList({
    super.key,
  });

  final getStudentAttendenceController = Get.put(StudentAttendenceController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: SizedBox(
        height: 550,
        width: ResponsiveWebSite.isMobile(context) ? double.infinity : 1300,
        // width: ResponsiveWebSite.isMobile(context)?500: ResponsiveWebSite.isTablet(context)?800: 1200,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                const Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: CatrgoryTableHeaderWidget(headerTitle: 'No')),
                    SizedBox(
                      width: 1,
                    ),
                    Expanded(
                        flex: 2,
                        child: CatrgoryTableHeaderWidget(
                            headerTitle: "Date of Presented")),
                    SizedBox(
                      width: 1,
                    ),
                    Expanded(
                        flex: 3,
                        child: CatrgoryTableHeaderWidget(
                            headerTitle: "No.of Classes Teacher Attended")),
                    SizedBox(
                      width: 1,
                    ),
                    Expanded(
                        flex: 3,
                        child: CatrgoryTableHeaderWidget(
                            headerTitle:
                                "No.of Students Present in the Classes")),
                    SizedBox(
                      width: 1,
                    ),
                    Expanded(
                        flex: 3,
                        child: CatrgoryTableHeaderWidget(
                            headerTitle:
                                "No.of Students Absent in the Classes")),
                    SizedBox(
                      width: 1,
                    ),
                    Expanded(
                        flex: 1,
                        child: CatrgoryTableHeaderWidget(
                            headerTitle: "Total Student")),
                  ],
                ),
                Obx(
                  () => SizedBox(
                    height: 500,
                    child: StreamBuilder(
                        stream: Get.find<TeacherController>()
                                    .teacherAttendeceMonthWiswOnTap
                                    .value ==
                                true
                            ? server
                                .collection('SchoolListCollection')
                                .doc(UserCredentialsController.schoolId)
                                .collection(UserCredentialsController.batchId!)
                                .doc(UserCredentialsController.batchId)
                                .collection('TeacherAttendence')
                                .doc(Get.find<TeacherController>()
                                    .attendenceTeacherDocID
                                    .value)
                                .collection('MonthWiseAttendence')
                                .doc(Get.find<TeacherController>()
                                    .selectedMonthView
                                    .value)
                                .collection(Get.find<TeacherController>()
                                    .selectedMonthView
                                    .value)
                                .snapshots()
                            : server
                                .collection('SchoolListCollection')
                                .doc(UserCredentialsController.schoolId)
                                .collection(UserCredentialsController.batchId!)
                                .doc(UserCredentialsController.batchId)
                                .collection('TeacherAttendence')
                                .doc(Get.find<TeacherController>()
                                    .attendenceTeacherDocID
                                    .value)
                                .collection('DayWiseAttendence')
                                .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.separated(
                              itemBuilder: (context, index) {
                                final teacherData =
                                    snapshot.data!.docs[index].data();
                                return Container(
                                  color: Colors.green.withOpacity(0.1),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: DataContainerMarksWidget(
                                            color:
                                                Colors.green.withOpacity(0.1),
                                            wantColor: false,
                                            rowMainAccess:
                                                MainAxisAlignment.center,
                                            index: index,
                                            headerTitle: "${index + 1}"),
                                      ),
                                      const SizedBox(
                                        width: 1,
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: DataContainerMarksWidget(
                                            color:
                                                Colors.green.withOpacity(0.1),
                                            rowMainAccess:
                                                MainAxisAlignment.center,
                                            index: index,
                                            headerTitle:
                                                " ${teacherData['docid']}"),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: StreamBuilder(
                                            stream: server
                                                .collection(
                                                    'SchoolListCollection')
                                                .doc(UserCredentialsController
                                                    .schoolId)
                                                .collection(
                                                    UserCredentialsController
                                                        .batchId!)
                                                .doc(UserCredentialsController
                                                    .batchId)
                                                .collection('TeacherAttendence')
                                                .doc(Get.find<
                                                        TeacherController>()
                                                    .attendenceTeacherDocID
                                                    .value)
                                                .collection('DayWiseAttendence')
                                                .doc(teacherData['docid'])
                                                .collection('AttendedClasses')
                                                .snapshots(),
                                            builder: (context, classSnap) {
                                              if (classSnap.hasData) {
                                                return DataContainerMarksWidget(
                                                    color: Colors.green
                                                        .withOpacity(0.1),
                                                    rowMainAccess:
                                                        MainAxisAlignment
                                                            .center,
                                                    index: index,
                                                    headerTitle:
                                                        " ${classSnap.data!.docs.length}");
                                              } else {
                                                return const Text('....');
                                              }
                                            }),
                                      ),
                                      const SizedBox(
                                        width: 1,
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: DataContainerMarksWidget(
                                            color:
                                                Colors.green.withOpacity(0.1),
                                            rowMainAccess:
                                                MainAxisAlignment.center,
                                            index: index,
                                            headerTitle:
                                                " ${teacherData['presentStudent']}"),
                                      ),
                                      const SizedBox(
                                        width: 1,
                                      ),
                                      Expanded(
                                          flex: 3,
                                          child: DataContainerMarksWidget(
                                            color:
                                                Colors.green.withOpacity(0.1),
                                            rowMainAccess:
                                                MainAxisAlignment.center,
                                            index: index,
                                            headerTitle:
                                                teacherData['absentStudent']
                                                    .toString(),
                                          )),
                                      const SizedBox(
                                        width: 1,
                                      ),
                                      Expanded(
                                          flex: 1,
                                          child: DataContainerMarksWidget(
                                              color:
                                                  Colors.green.withOpacity(0.1),
                                              rowMainAccess:
                                                  MainAxisAlignment.center,
                                              index: index,
                                              headerTitle: teacherData[
                                                      'totalStudentCount']
                                                  .toString())),
                                    ],
                                  ),
                                );
                              },
                              itemCount: snapshot.data!.docs.length,
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                height: 1,
                              ),
                            );
                          } else if (snapshot.data == null) {
                            return  Center(
                              child: TextFontWidget(
                                  text: "No result found", fontsize: 12),
                            );
                          } else {
                            return const LoadingWidget();
                          }
                        }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
