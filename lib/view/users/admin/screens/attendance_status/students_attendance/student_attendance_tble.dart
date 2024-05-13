import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/class_controller/class_controller.dart';
import 'package:vidyaveechi_website/controller/student_attendence_controller/student_attendence_controller.dart';
import 'package:vidyaveechi_website/view/constant/constant.validate.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/result/widget/data_container_marks.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/students/student_details/widgets/category_tableHeader.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';
import 'package:vidyaveechi_website/view/widgets/loading_widget/loading_widget.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';

class StudentAttendanceDataList extends StatelessWidget {
  final dynamic data;
  final String monthwise;
  final String formatted;
  final String subjectID;
  StudentAttendanceDataList({
    required this.data,
    super.key,
    required this.monthwise,
    required this.formatted,
    required this.subjectID,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 5,
                        top: 0,
                      ),
                      child: Container(
                        height: 100,
                        width: 500,
                        decoration: const BoxDecoration(),
                        child: Padding(
                          padding: const EdgeInsets.only(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  TextFontWidget(
                                    text: '${Get.find<ClassController>().className.value} - ',
                                    fontsize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 20,
                                    ),
                                    child: TextFontWidget(
                                      text: data['subject'] ?? 'Not found',
                                      fontsize: 25,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                ),
                                child:
                                    //  Obx(
                                    //   () =>
                                    StreamBuilder(
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
                                            .doc(subjectID)
                                            .collection('AttendenceList')
                                            .snapshots(),
                                        builder: (context, snapshot) {
                                          getStudentAttendenceController.getStudentsAttendanceData(
                                              monthwise: monthwise,
                                              formatted: formatted,
                                              subjectID: subjectID);
                                          if (snapshot.connectionState == ConnectionState.waiting) {
                                            return const Center(child: SizedBox());
                                          } else if (snapshot.data!.docs.isEmpty) {
                                            return const Center(
                                              child: SizedBox(),
                                            );
                                          } else if (!snapshot.hasData) {
                                            return const Center(
                                              child: SizedBox(),
                                            );
                                          } else {
                                            return Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                const TextFontWidget(
                                                  text: 'Total Students',
                                                  fontsize: 12,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                TextFontWidget(
                                                  text: snapshot.data!.docs.length.toString(),
                                                  fontsize: 12,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                                const TextFontWidget(
                                                  text: 'Present Students',
                                                  fontsize: 12,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                TextFontWidget(
                                                  text: getStudentAttendenceController
                                                      .presentStudent
                                                      .toString(),
                                                  fontsize: 12,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                                const TextFontWidget(
                                                  text: 'Absent Students',
                                                  fontsize: 12,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                TextFontWidget(
                                                  text: getStudentAttendenceController.absentStudent
                                                      .toString(),
                                                  fontsize: 12,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ],
                                            );
                                          }
                                        }),
                              ),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Expanded(flex: 1, child: CatrgoryTableHeaderWidget(headerTitle: 'No')),
                    SizedBox(
                      width: 1,
                    ),
                    Expanded(
                        flex: 6, child: CatrgoryTableHeaderWidget(headerTitle: "Student Name")),
                    SizedBox(
                      width: 1,
                    ),
                    Expanded(flex: 2, child: CatrgoryTableHeaderWidget(headerTitle: "Class")),
                    SizedBox(
                      width: 1,
                    ),
                    Expanded(flex: 2, child: CatrgoryTableHeaderWidget(headerTitle: "Date")),
                    SizedBox(
                      width: 1,
                    ),
                    Expanded(flex: 2, child: CatrgoryTableHeaderWidget(headerTitle: "Time")),
                    SizedBox(
                      width: 1,
                    ),
                    Expanded(
                        flex: 2, child: CatrgoryTableHeaderWidget(headerTitle: "Status from app")),
                    SizedBox(
                      width: 1,
                    ),
                    Expanded(
                        flex: 2,
                        child: CatrgoryTableHeaderWidget(headerTitle: "Status from machine")),
                  ],
                ),
                SizedBox(
                  height: 500,
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
                          .doc(subjectID)
                          .collection('AttendenceList')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.separated(
                            itemBuilder: (context, index) {
                              final studentData = snapshot.data!.docs[index].data();
                              return Container(
                                color: studentData['present'] == true
                                    ? Colors.green.withOpacity(0.1)
                                    : Colors.red.withOpacity(0.1),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: DataContainerMarksWidget(
                                          color: studentData['present'] == true
                                              ? Colors.green.withOpacity(0.1)
                                              : Colors.red.withOpacity(0.1),
                                          wantColor: false,
                                          rowMainAccess: MainAxisAlignment.center,
                                          index: index,
                                          headerTitle: "${index + 1}"),
                                    ),
                                    const SizedBox(
                                      width: 1,
                                    ),
                                    Expanded(
                                      flex: 6,
                                      child: DataContainerMarksWidget(
                                          color: studentData['present'] == true
                                              ? Colors.green.withOpacity(0.1)
                                              : Colors.red.withOpacity(0.1),
                                          rowMainAccess: MainAxisAlignment.start,
                                          index: index,
                                          headerTitle: " ${studentData['studentName']}"),
                                    ),
                                    const SizedBox(
                                      width: 1,
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: DataContainerMarksWidget(
                                          color: studentData['present'] == true
                                              ? Colors.green.withOpacity(0.1)
                                              : Colors.red.withOpacity(0.1),
                                          rowMainAccess: MainAxisAlignment.start,
                                          index: index,
                                          headerTitle:
                                              " ${Get.find<ClassController>().className.value}"),
                                    ),
                                    const SizedBox(
                                      width: 1,
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: DataContainerMarksWidget(
                                          color: studentData['present'] == true
                                              ? Colors.green.withOpacity(0.1)
                                              : Colors.red.withOpacity(0.1),
                                          rowMainAccess: MainAxisAlignment.start,
                                          index: index,
                                          headerTitle: "   $formatted"),
                                    ),
                                    const SizedBox(
                                      width: 1,
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: DataContainerMarksWidget(
                                          color: studentData['present'] == true
                                              ? Colors.green.withOpacity(0.1)
                                              : Colors.red.withOpacity(0.1),
                                          rowMainAccess: MainAxisAlignment.start,
                                          index: index,
                                          headerTitle:
                                              " ${stringTimeConvert(DateTime.parse(studentData['Date']))}"),
                                    ),
                                    const SizedBox(
                                      width: 1,
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: DataContainerMarksWidget(
                                          color: studentData['present'] == true
                                              ? Colors.green.withOpacity(0.1)
                                              : Colors.red.withOpacity(0.1),
                                          rowMainAccess: MainAxisAlignment.start,
                                          index: index,
                                          headerTitle: studentData['present'] == true
                                              ? ' Present'
                                              : ' Absent'),
                                    ),
                                    const SizedBox(
                                      width: 1,
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: DataContainerMarksWidget(
                                          color: studentData['present'] == true
                                              ? Colors.green.withOpacity(0.1)
                                              : Colors.red.withOpacity(0.1),
                                          rowMainAccess: MainAxisAlignment.start,
                                          index: index,
                                          headerTitle: studentData['present'] == true
                                              ? ' Present'
                                              : ' Absent'),
                                    ),
                                  ],
                                ),
                              );
                            },
                            itemCount: snapshot.data!.docs.length,
                            separatorBuilder: (context, index) => const SizedBox(
                              height: 1,
                            ),
                          );
                        } else if (snapshot.data == null) {
                          return const Center(
                            child: TextFontWidget(text: "No result found", fontsize: 12),
                          );
                        } else {
                          return const LoadingWidget();
                        }
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
