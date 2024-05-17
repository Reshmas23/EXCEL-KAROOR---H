import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vidyaveechi_website/controller/class_controller/class_controller.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/result/widget/data_container_marks.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/students/student_details/widgets/category_tableHeader.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';

class ClassWiseStudentList extends StatelessWidget {
  // final String subjectID;
  ClassWiseStudentList(
      {
      //   required this.subjectID,
      super.key});
  final ClassController classController = Get.put(ClassController());
  @override
  Widget build(BuildContext context) {
    final date = DateTime.now();
    DateTime parseDate = DateTime.parse(date.toString());
    final month = DateFormat('MMMM-yyyy');
    String monthwise = month.format(parseDate);
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    String formatted = formatter.format(parseDate);
    return SingleChildScrollView(
      child: Container(
        color: screenContainerbackgroundColor,
        height: ResponsiveWebSite.isMobile(context) ? 840 : 610,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: ResponsiveWebSite.isMobile(context) ? 20 : 0),
              child: Container(
                color: cWhite,
                height: ResponsiveWebSite.isMobile(context) ? 750 : 580,
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(
                      height: 580,
                      width: ResponsiveWebSite.isMobile(context)
                          ? double.infinity
                          : 1300,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: CatrgoryTableHeaderWidget(
                                        headerTitle: 'No')),
                                SizedBox(
                                  width: 1,
                                ),
                                Expanded(
                                    flex: 2,
                                    child: CatrgoryTableHeaderWidget(
                                        headerTitle: "Admission No.")),
                                SizedBox(
                                  width: 1,
                                ),
                                Expanded(
                                    flex: 6,
                                    child: CatrgoryTableHeaderWidget(
                                        headerTitle: "Student Name")),
                                SizedBox(
                                  width: 1,
                                ),
                                Expanded(
                                    flex: 2,
                                    child: CatrgoryTableHeaderWidget(
                                        headerTitle: "Status from App")),
                                          SizedBox(
                                  width: 1,
                                ),
                                Expanded(
                                    flex: 2,
                                    child: CatrgoryTableHeaderWidget(
                                        headerTitle: "Status from Machine")),
                              ],
                            ),
                            SizedBox(
                              height: 500,
                              child: StreamBuilder(
                                  stream: server
                                      .collection('SchoolListCollection')
                                      .doc(UserCredentialsController.schoolId)
                                      .collection(
                                          UserCredentialsController.batchId!)
                                      .doc(UserCredentialsController.batchId!)
                                      .collection('classes')
                                      .doc(classController
                                          .classModelData.value!.docid)
                                      .collection("Students")
                                      .snapshots(),
                                  builder: (context, clsStdsnaps) {
                                    //   print(classController.classModelData.value!.docid);
                                    if (clsStdsnaps.hasData) {
                                      return ListView.separated(
                                        itemBuilder: (context, index) {
                                          final data = clsStdsnaps
                                              .data!.docs[index]
                                              .data();
                                          return Container(
                                            height: 45,
                                            decoration: BoxDecoration(
                                              color: index % 2 == 0
                                                  ? const Color.fromARGB(
                                                      255, 246, 246, 246)
                                                  : Colors.blue[50],
                                            ),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child:
                                                      DataContainerMarksWidget(
                                                          rowMainAccess:
                                                              MainAxisAlignment
                                                                  .center,
                                                          // color: cWhite,
                                                          index: index,
                                                          headerTitle:
                                                              "${index + 1}"),
                                                ),
                                                const SizedBox(
                                                  width: 1,
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child:
                                                      DataContainerMarksWidget(
                                                          rowMainAccess:
                                                              MainAxisAlignment
                                                                  .start,
                                                          //   color: cWhite,
                                                          index: index,
                                                          headerTitle: data[
                                                                  'admissionNumber'] ??
                                                              ''),
                                                ),
                                                const SizedBox(
                                                  width: 1,
                                                ),
                                                Expanded(
                                                  flex: 6,
                                                  child:
                                                      DataContainerMarksWidget(
                                                          rowMainAccess:
                                                              MainAxisAlignment
                                                                  .start,
                                                          // color: cWhite,
                                                          index: index,
                                                          headerTitle: data[
                                                                  'studentName'] ??
                                                              ''),
                                                ),
                                                const SizedBox(
                                                  width: 1,
                                                ),
                                                Expanded(
                                                          flex: 2,
                                                          child:
                                                              DataContainerMarksWidget(
                                                                  rowMainAccess:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  // color: cWhite,
                                                                  index: index,
                                                                  headerTitle:
                                                                      "No data "),
                                                        )
                                                // Obx(() => classController
                                                //               .firstSubjectId
                                                //               .value ==
                                                //           ''?
                                                //           Expanded(
                                                //           flex: 2,
                                                //           child:
                                                //               DataContainerMarksWidget(
                                                //                   rowMainAccess:
                                                //                       MainAxisAlignment
                                                //                           .start,
                                                //                   // color: cWhite,
                                                //                   index: index,
                                                //                   headerTitle:
                                                //                       "No data "),
                                                //         ):
                                                // StreamBuilder(
                                                //     stream: server
                                                //         .collection(
                                                //             'SchoolListCollection')
                                                //         .doc(
                                                //             UserCredentialsController
                                                //                 .schoolId)
                                                //         .collection(
                                                //             UserCredentialsController
                                                //                 .batchId!)
                                                //         .doc(
                                                //             UserCredentialsController
                                                //                 .batchId!)
                                                //         .collection('classes')
                                                //         .doc(classController
                                                //             .classModelData
                                                //             .value!
                                                //             .docid)
                                                //         .collection(       
                                                //             'Attendence')
                                                //         .doc(monthwise)
                                                //         .collection(monthwise)
                                                //         .doc(formatted)
                                                //         .collection('Subjects')
                                                //         .doc(classController
                                                //             .firstSubjectId
                                                //             .value)
                                                //         .collection(
                                                //             'AttendenceList')
                                                //         .doc(data['docid'])
                                                //         .snapshots(),
                                                //     builder:
                                                //         (context, snapshot) {
                                                //       log('...........edwi');
                                                //       log('subject ID ${classController.firstSubjectId.value}');
                                                //       log('student ID ${data['docid']}');
                                                //       if (snapshot.hasData) {
                                                //         return Expanded(
                                                //           flex: 2,
                                                //           child: DataContainerMarksWidget(
                                                //               color: snapshot.data![
                                                //                           'present'] ==
                                                //                       true
                                                //                   ? Colors.green
                                                //                   : Colors.red,
                                                //               rowMainAccess:
                                                //                   MainAxisAlignment
                                                //                       .start,
                                                //               index: index,
                                                //               headerTitle: snapshot
                                                //                               .data![
                                                //                           'present'] ==
                                                //                       true
                                                //                   ? ' Present'
                                                //                   : ' Absent'),

                                                //           //  DataContainerMarksWidget(
                                                //           //     rowMainAccess:
                                                //           //         MainAxisAlignment.start,
                                                //           //     // color: cWhite,
                                                //           //     index: index,
                                                //           //     headerTitle: " Present"),
                                                //         );
                                                      
                                                //       } else {
                                                //         return Expanded(
                                                //           flex: 2,
                                                //           child:
                                                //               DataContainerMarksWidget(
                                                //                   rowMainAccess:
                                                //                       MainAxisAlignment
                                                //                           .start,
                                                //                   // color: cWhite,
                                                //                   index: index,
                                                //                   headerTitle:
                                                //                       "No data "),
                                                //         );
                                                //       }
                                                //     })),
                                                     const SizedBox(
                                                  width: 1,
                                                ),  
                                                      Expanded(
                                                          flex: 2,
                                                          child:
                                                              DataContainerMarksWidget(
                                                                  rowMainAccess:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  // color: cWhite,
                                                                  index: index,
                                                                  headerTitle:
                                                                      "No data "),
                                                        )
                                              ],
                                            ),
                                          );
                                        },
                                        itemCount:
                                            clsStdsnaps.data!.docs.length,
                                        separatorBuilder: (context, index) =>
                                            const SizedBox(
                                          height: 1,
                                        ),
                                      );
                                    } else {
                                      return const Text('No data found');
                                    }
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
