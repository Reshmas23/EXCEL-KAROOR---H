import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/dash_board/sections/class_status/class_data_list.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/students/student_details/widgets/category_tableHeader.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';

class TotalClassViewContainer extends StatelessWidget {
  const TotalClassViewContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ResponsiveWebSite.isMobile(context) ? 320 : 420,
      width: ResponsiveWebSite.isMobile(context) ? double.infinity : 450,
      decoration: BoxDecoration(
          color: cWhite, border: Border.all(color: cBlack.withOpacity(0.1))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25, left: 20),
            child: TextFontWidget(
              text: "All Classes",
              fontsize: ResponsiveWebSite.isMobile(context) ? 12 : 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: AllClassListViewContainer(),
            ),
          )
        ],
      ),
    );
  }
}

class AllClassListViewContainer extends StatelessWidget {
  const AllClassListViewContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final date = DateTime.now();
    DateTime parseDate = DateTime.parse(date.toString());
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    String formatted = formatter.format(parseDate);
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                flex: 3,
                child: CatrgoryTableHeaderWidget(headerTitle: 'Class'.tr)),
            const SizedBox(
              width: 02,
            ),
            Expanded(
                flex: 5,
                child: CatrgoryTableHeaderWidget(headerTitle: 'Class Tr'.tr)),
            const SizedBox(
              width: 02,
            ),
            Expanded(
                flex: 5,
                child: CatrgoryTableHeaderWidget(headerTitle: 'Current Tr'.tr)),
            const SizedBox(
              width: 02,
            ),
            Expanded(
                flex: 2,
                child: CatrgoryTableHeaderWidget(headerTitle: 'Present'.tr)),
            const SizedBox(
              width: 02,
            ),
            Expanded(
                flex: 2,
                child: CatrgoryTableHeaderWidget(headerTitle: 'Absent'.tr)),
            const SizedBox(
              width: 02,
            ),
            Expanded(
                flex: 2,
                child: CatrgoryTableHeaderWidget(headerTitle: 'Status'.tr)),
            const SizedBox(
              width: 02,
            ),
            // Expanded(
            //     flex: 2,
            //     child: CatrgoryTableHeaderWidget(headerTitle: 'Status'.tr)),
            // const SizedBox(
            //   width: 02,
            // ),
          ],
        ),
        Expanded(
          child: StreamBuilder(
            stream: server
                .collection('SchoolListCollection')
                .doc(UserCredentialsController.schoolId)
                .collection('classes')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(
                    child: Text('An error occurred: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return const Center(child: Text('No classes found'));
              } else {
                return ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 1,
                  ),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final classData = snapshot.data!.docs[index];
                    return StreamBuilder(
                      stream: server
                          .collection('SchoolListCollection')
                          .doc(UserCredentialsController.schoolId)
                          .collection(UserCredentialsController.batchId!)
                          .doc(UserCredentialsController.batchId)
                          .collection('TodayActiveClasses')
                          .doc(formatted)
                          .collection('Classes')
                          .doc(classData['docid'])
                          .snapshots(),
                      builder: (context, currentSnapshot) {
                        if (currentSnapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (currentSnapshot.hasError) {
                          return Center(
                              child: Text(
                                  'An error occurred: ${currentSnapshot.error}'));
                        } else if (!currentSnapshot.hasData ||
                            !currentSnapshot.data!.exists) {
                          return ClassDataList(
                            index: index,
                            classData: classData,
                            currentTr: '-',
                            absentStudents: "-",
                            presentStudents: "-",
                            status: false,
                          );
                        } else {
                          final data = currentSnapshot.data!.data() ?? {};
                          return StreamBuilder(
                            stream: server
                                .collection('SchoolListCollection')
                                .doc(UserCredentialsController.schoolId)
                                .collection('Teachers')
                                .doc(data['teacherDocid'])
                                .snapshots(),
                            builder: (context, trSnap) {
                              if (trSnap.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else if (trSnap.hasError) {
                                return Center(
                                    child: Text(
                                        'An error occurred:  ${trSnap.error}'));
                              } else if (!trSnap.hasData ||
                                  !trSnap.data!.exists) {
                                return ClassDataList(
                                  index: index,
                                  classData: classData,
                                  currentTr: '-',
                                  absentStudents: "-",
                                  presentStudents: "-",
                                  status: false,
                                );
                              }
                              return ClassDataList(
                                index: index,
                                classData: classData,
                                currentTr: trSnap.data!['teacherName'],
                                absentStudents:
                                    data['absentStudents']?.toString() ?? "--",
                                presentStudents:
                                    data['presentStudents']?.toString() ?? "--",
                                status: true,
                              );
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
    );
  }
}
