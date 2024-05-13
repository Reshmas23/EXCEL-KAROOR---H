import 'package:flutter/material.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/users/student/HomeWork_details/home_work_showing.dart';
import 'package:vidyaveechi_website/view/users/student/HomeWork_details/homework_status.dart';
// import 'package:vidyaveechi_website/view/users/student/calender/calender.dart';
// import 'package:vidyaveechi_website/view/users/student/calender/calender.dart';
import 'package:vidyaveechi_website/view/users/student/exam_progresspart/mystudy_progress.dart';
import 'package:vidyaveechi_website/view/users/student/graph/std_subject_result.dart';
import 'package:vidyaveechi_website/view/users/student/notice_board/notice_board.dart';
import 'package:vidyaveechi_website/view/users/student/student_details/student_details.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';

class StudentDashBoardScreen extends StatelessWidget {
  const StudentDashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: ResponsiveWebSite.isMobile(context) ? 2000 : 1500,
      color: const Color.fromARGB(255, 240, 241, 243),
      child: ResponsiveWebSite.isMobile(context)
          ? SingleChildScrollView(
              child: Column(
                children: [
                  studentDashBordWidgets[0], ////............................student details part
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: studentDashBordWidgets[3],
                  ), /////.............................My progressBar
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(height: 360, color: cWhite, child: studentDashBordWidgets[2]),
                  ), //////............................Subject Wise Progress

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(height: 450, color: cWhite, child: studentDashBordWidgets[1]),
                  ), /////............................Calendar

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(height: 400, color: cWhite, child: studentDashBordWidgets[4]),
                  ), /////............................HomeWork Showing
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(height: 400, color: cWhite, child: studentDashBordWidgets[5]),
                  ), /////............................HomwWork Status
                  // studentDashBordWidgets[6], ////,............................Notice
                ],
              ),
            )
          : Column(
              children: [
                SizedBox(
                  height: 480,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              child: SizedBox(height: 160, child: studentDashBordWidgets[0]),
                            ), //.............................. Student Details Part

                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Container(
                                      width: ResponsiveWebSite.isTablet(context) ? 260 : 300,
                                      height: 300,
                                      color: cWhite,
                                      child: studentDashBordWidgets[1]),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: ResponsiveWebSite.isTablet(context) ? 10 : 0),
                                  child: Container(
                                      color: cWhite,
                                      width: ResponsiveWebSite.isTablet(context) ? 330 : 420,
                                      height: 300,
                                      child: studentDashBordWidgets[2]),
                                ),
                              ],
                            )
                          ],
                        ),
                        Container(
                          height: 440,
                          width: ResponsiveWebSite.isTablet(context) ? 440 : 500,
                          color: cWhite,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8, bottom: 10),
                            child: studentDashBordWidgets[3], //....................Student calender
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  color: cWhite,
                  height: 500,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: studentDashBordWidgets[4],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: studentDashBordWidgets[5],
                        ),
                      )
                    ],
                  ),
                ),
                // SizedBox(
                //   height: 500,
                //   child: Row(
                //     children: [
                //       Expanded(
                //         flex: 2,
                //         child: Padding(
                //           padding: const EdgeInsets.all(8.0),
                //           child: studentDashBordWidgets[6],
                //         ),
                //       ),
                //     ],
                //   ),
                // )
              ],
            ),
    );
  }
}

List<Widget> studentDashBordWidgets = [
   StudentsDetailsPart(),
  const MyStudyProgressStdContainerWidget(),
  const SubjectWiseProgressBarStd(),
  const StdNoticeBoardContainer(),
  const StdHomeWorkShowingContainer(),
  const StdHomeWorkStatusContainer(),
  // const StdCalenderViewContainer()
];
