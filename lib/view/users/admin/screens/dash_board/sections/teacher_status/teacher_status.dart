import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vidyaveechi_website/controller/all_teachers_controller/all_teachers_controller.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/dash_board/sections/teacher_status/teacher_data_list.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/students/student_details/widgets/category_tableHeader.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';

class TotalTeacherViewContainer extends StatelessWidget {
  const TotalTeacherViewContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ResponsiveWebSite.isMobile(context) ? 320 : 420,
      width: ResponsiveWebSite.isMobile(context) ? double.infinity : 450,
      decoration: BoxDecoration(color: cWhite, border: Border.all(color: cBlack.withOpacity(0.1))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25, left: 20),
            child: TextFontWidget(
              text: "All Teachers",
              fontsize: ResponsiveWebSite.isMobile(context) ? 12 : 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: AllTeacherStatusListView(),
            ),
          )
        ],
      ),
    );
  }
}

class AllTeacherStatusListView extends StatelessWidget {
  const AllTeacherStatusListView({super.key});

  @override
  Widget build(BuildContext context) {
    final allteacherscontroller = Get.put(Allteacherscontroller());
    final date = DateTime.now();
    DateTime parseDate = DateTime.parse(date.toString());
    final month = DateFormat('MMMM-yyyy');
    // ignore: unused_local_variable
    String monthwise = month.format(parseDate);
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    String formatted = formatter.format(parseDate);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: 800,
        child: Column(
          children: [
            const Row(
              children: [
                Expanded(flex: 7, child: CatrgoryTableHeaderWidget(headerTitle: 'Tr Name')),
                SizedBox(
                  width: 02,
                ),
                Expanded(flex: 5, child: CatrgoryTableHeaderWidget(headerTitle: 'Incharge')),
                SizedBox(
                  width: 02,
                ),
                Expanded(flex: 7, child: CatrgoryTableHeaderWidget(headerTitle: 'Current class')),
                SizedBox(
                  width: 02,
                ),
                Expanded(flex: 7, child: CatrgoryTableHeaderWidget(headerTitle: 'Subject')),
                SizedBox(
                  width: 02,
                ),
                Expanded(flex: 6, child: CatrgoryTableHeaderWidget(headerTitle: 'Rate/hour')),
                SizedBox(
                  width: 02,
                ),
                Expanded(flex: 6, child: CatrgoryTableHeaderWidget(headerTitle: 'Total hour')),
                SizedBox(
                  width: 02,
                ),
                Expanded(flex: 4, child: CatrgoryTableHeaderWidget(headerTitle: 'Status')),
                SizedBox(
                  width: 02,
                ),
              ],
            ),
            Expanded(
              child: StreamBuilder(
                stream: server
                    .collection('SchoolListCollection')
                    .doc(UserCredentialsController.schoolId)
                    .collection('Teachers')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator()); // Loading state
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}')); // Error state
                  } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(child: Text('No Data Available')); // Empty state
                  } else {
                    return ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 1,
                      ),
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final data = snapshot.data!.docs[index];
                       
                        return StreamBuilder(
                          stream: server
                              .collection('SchoolListCollection')
                              .doc(UserCredentialsController.schoolId)
                              .collection(UserCredentialsController.batchId!)
                              .doc(UserCredentialsController.batchId)
                              .collection('TeacherAttendence')
                              .doc(data['docid'])
                              .collection('DayWiseAttendence')
                              .doc(formatted)
                              .collection('AttendedClasses')
                              .orderBy('datetime', descending: true)
                              .limit(1)
                              .snapshots(),
                          builder: (context, currentsnapshot) {
                            if (currentsnapshot.connectionState == ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator()); // Loading state
                            } else if (currentsnapshot.hasError) {
                              return Center(
                                  child: Text('Error: ${currentsnapshot.error}')); // Error state
                            } else if (!currentsnapshot.hasData ||
                                currentsnapshot.data!.docs.isEmpty) {
                              return TeacherDataList(
                                index: index,
                                status: false,
                                data: data,
                                currentclass: "--",
                                classname: "--",
                                teacherId: data['docid'],
                              );
                            } else {
                              allteacherscontroller.className.value =
                                  currentsnapshot.data!.docs.first['ClassName'];
                              return data['classID'] == null || data['classID'] == ""
                                  ? TeacherDataList(
                                      index: index,
                                      status: true,
                                      data: data,
                                      currentclass: currentsnapshot.data!.docs.first['ClassName'],
                                      classname: "--",
                                      teacherId: data['docid'],
                                    )
                                  : StreamBuilder(
                                      stream: server
                                          .collection('SchoolListCollection')
                                          .doc(UserCredentialsController.schoolId)
                                          .collection('classes')
                                          .where('classId', isEqualTo: data['classID'])
                                          .snapshots(),
                                      builder: (context, allteachersnapshot) {
                                        if (allteachersnapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return const Center(
                                              child: CircularProgressIndicator()); // Loading state
                                        } else if (allteachersnapshot.hasError) {
                                          return Center(
                                              child: Text(
                                                  'Error: ${allteachersnapshot.error}')); // Error state
                                        } else {
                                          final classname = allteachersnapshot.data!.docs.first;

                                          return TeacherDataList(
                                            index: index,
                                            status: true,
                                            data: data,
                                            currentclass:
                                                currentsnapshot.data!.docs.first['ClassName'],
                                            classname: classname['className'],
                                            teacherId:data['docid'] ,
                                          );
                                        }
                                      },
                                    );
                            }
                          },
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
