// // import 'package:dash_board/view/colors/colors.dart';
// // import 'package:dash_board/view/fonts/text_widget.dart';
// // import 'package:dash_board/view/widgets/responsive/responsive.dart';
// import 'package:data_table_2/data_table_2.dart';
// import 'package:flutter/material.dart';
// // import 'package:vidyaveechi_website/responsive.dart';
// import 'package:vidyaveechi_website/view/colors/colors.dart';
// import 'package:vidyaveechi_website/view/fonts/google_poppins_widget.dart';
// import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
// import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';

// // import '../../../../../../../../fonts/google_poppins.dart';
// import '../text feild widget/textfeildwidget.dart';

// /// Example without a datasource
// class ParentDataTable extends StatelessWidget {
//   const ParentDataTable({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: cWhite,
//       child: Column(
//         children: [
//           Row(
//             children: [
//               Expanded(
//                   child: Container(
//                       width: double.infinity,
//                       color: cWhite,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(top: 10, left: 10),
//                             child: TextFontWidget(
//                               text: "All Exam Results",
//                               fontsize: 18,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           const Padding(
//                             padding: EdgeInsets.only(right: 10),
//                             child: Icon(Icons.more_horiz),
//                           ),
                        
//                         ],
//                       )))
//             ],
//           ),
//      ResponsiveWebSite.isMobile(context)? SingleChildScrollView(
//        child: Column(mainAxisAlignment: MainAxisAlignment.start,
//        crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//          Padding(
//                                     padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
//                                     child: SizedBox(
//                                        width: double.infinity,
                                      
//                                       child: TextFormFeildWidget(text: "Search Roll")),
//                                   ),
//                                     Padding(
//                                     padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
//                                     child: SizedBox(
//                                        width: double.infinity,
                                      
//                                       child: TextFormFeildWidget(text: "Search Roll")),
//                                   ),
//                                     Padding(
//                                     padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
//                                     child: SizedBox(
//                                        width: double.infinity,
                                      
//                                       child: TextFormFeildWidget(text: "Search Roll")),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
//                                     child: Container(
//                                       height: 40,
                                      
//                                       decoration: const BoxDecoration(
//                                           borderRadius: BorderRadius.all(
//                                             Radius.circular(5),
//                                           ),
//                                           color: Colors.amber),
//                                       child: Center(
//                                           child: GooglePoppinsWidgets(
//                                               text: "Search", fontsize: 16)),
//                                     ),
//                                   ),
       
//        ],),
//      ):Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               Expanded(
                                
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
//                                   child: SizedBox(
//                                      height: 40,
                                    
//                                     child: TextFormFeildWidget(text: "Search Roll")),
//                                 ),
//                               ),
//                              Expanded(
//                                child: Padding(
//                                  padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
//                                  child: SizedBox(
//                                      height: 40,
                                    
//                                     child: TextFormFeildWidget(text: "Search Roll")),
//                                ),
//                              ),
//                               Expanded(
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(top: 10,left:10,right: 10 ),
//                                   child: SizedBox(
//                                      height: 40,
                                    
//                                     child: TextFormFeildWidget(text: "Search Roll")),
//                                 ),
//                               ),
//                               Expanded(
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
//                                   child: Container(
//                                     height: 40,
                                    
//                                     decoration: const BoxDecoration(
//                                         borderRadius: BorderRadius.all(
//                                           Radius.circular(5),
//                                         ),
//                                         color: Colors.amber),
//                                     child: Center(
//                                         child: GooglePoppinsWidgets(
//                                             text: "Search", fontsize: 16)),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//           Expanded(
//             child: DataTable2(
//                 columnSpacing: 12,
//                 horizontalMargin: 12,
//                 minWidth: 600,
//                 columns: const [
//                   DataColumn2(
//                     label: Text('ID'),
//                     size: ColumnSize.L,
//                   ),
//                   DataColumn(
//                     label: Text('Exam Name'),
//                   ),
//                   DataColumn(
//                     label: Text('Subject'),
//                   ),
//                   DataColumn(
//                     label: Text('Class'),
//                   ),
//                   DataColumn(
//                     label: Text('Roll No'),
//                     numeric: true,
//                   ),
//                   DataColumn(
//                     label: Text('Grade'),
//                     numeric: true,
//                   ),
//                   DataColumn(
//                     label: Icon(Icons.more_horiz),
//                     numeric: true,
//                   ),
//                 ],
//                 rows: List<DataRow>.generate(
//                     10,
//                     (index) => const DataRow(cells: [
//                           DataCell(Text('A')),
//                           DataCell(Text('B')),
//                           DataCell(Text('C')),
//                           DataCell(Text('D')),
//                           DataCell(Text('A')),
//                           DataCell(Text('B')),
//                           DataCell(Icon(Icons.more_horiz)),
//                         ]))),
//           ),
//         ],
//       ),
//     );
//   }
// }

 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/admin_section/student_controller/student_controller.dart';
import 'package:vidyaveechi_website/controller/exam_result_controller/exam_result_controller.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/constant/constant.validate.dart';
import 'package:vidyaveechi_website/view/drop_down/select_student_exam.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/students/student_details/widgets/category_tableHeader.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/students/student_details/widgets/category_tile_container.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';
import 'package:vidyaveechi_website/view/widgets/data_list_widgets/data_container.dart';

class StudentExamHistoryToParent extends StatelessWidget {
  StudentExamHistoryToParent({
    super.key,
  });

  final StudentController studentController = Get.put(StudentController());
  final examController = Get.put(ExamResultController());

  @override
  Widget build(BuildContext context) {
 //   final data = studentController.studentModelData.value;
    final classID = UserCredentialsController.classId!;
    final studentID =  UserCredentialsController.parentModel!.studentID!;
    examController.examId.value = " empty ";

    return Column(
      children: [
        Container(
          height: 80,
          width: 1200,
          color: Colors.blue.withOpacity(0.1),
          alignment: Alignment.center,
          child:  const Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFontWidget(
              text: 'Exam Results',
              fontsize: 16,
              fontWeight: FontWeight.bold,
              color: cBlue,
            ),
          ),
        ),
        SelectStudentExamDropDown(
            classId: classID, studentId: studentID),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Obx(
                () => StudentCategoryTileContainer(
                    title: 'No.of Exam Passed',
                    subTitle: '${examController.numberExamPassed}',
                    color: const Color.fromARGB(255, 121, 240, 125)),
              ),
              Obx(
                () => StudentCategoryTileContainer(
                    title: 'No.of Exam Failed',
                    subTitle: '${examController.numberExamFailed}',
                    color: const Color.fromARGB(255, 234, 102, 92)),
              ),
              Obx(() => StudentCategoryTileContainer(
                  title: 'No.of Exam Conducted',
                  subTitle: '${examController.numberExamConducted}',
                  color: const Color.fromARGB(255, 121, 123, 240)))
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
            child: SizedBox(
                width: 1200,
                height: 500,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 0, right: 0, top: 20),
                    child: Container(
                      color: cWhite,
                      height: 40,
                      child: const Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: CatrgoryTableHeaderWidget(headerTitle: 'No')),
                          SizedBox(
                            width: 02,
                          ),
                          Expanded(
                              flex: 1,
                              child: CatrgoryTableHeaderWidget(
                                  headerTitle: 'Date/Day')),
                          SizedBox(
                            width: 02,
                          ),
                          Expanded(
                              flex: 5,
                              child: CatrgoryTableHeaderWidget(
                                  headerTitle: 'Exam Subjects')),
                          SizedBox(
                            width: 02,
                          ),
                          Expanded(
                              flex: 1,
                              child: CatrgoryTableHeaderWidget(
                                  headerTitle: 'Obtained Mark')),
                          SizedBox(
                            width: 02,
                          ),
                          Expanded(
                              flex: 1,
                              child: CatrgoryTableHeaderWidget(
                                  headerTitle: 'Obtained Grade')),
                          SizedBox(
                            width: 02,
                          ),
                          Expanded(
                              flex: 1,
                              child: CatrgoryTableHeaderWidget(
                                  headerTitle: 'Pass Mark')),
                          SizedBox(
                            width: 02,
                          ),
                          Expanded(
                              flex: 1,
                              child: CatrgoryTableHeaderWidget(
                                  headerTitle: 'Pass/Fail')),
                          SizedBox(
                            width: 02,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      child: Obx(
                        () => examController.examId.value == ' empty '
                            ?  const Center(
                                child: TextFontWidget(
                                    text: "Please select exam", fontsize: 16),
                              )
                            : StreamBuilder(
                                stream: server
                                    .collection('SchoolListCollection')
                                    .doc(UserCredentialsController.schoolId)
                                    .collection(UserCredentialsController.batchId!)
                                    .doc(UserCredentialsController.batchId!)
                                    .collection('classes')
                                    .doc(classID)
                                    .collection('Students')
                                    .doc(studentID)
                                    .collection('Exam Results')
                                    .doc(examController.examId.value)
                                    .collection('Marks')
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  } else if (snapshot.data!.docs.isEmpty) {
                                    return const Center(
                                      child: TextFontWidget(
                                          text: "No data", fontsize: 16),
                                    );
                                  } else if (!snapshot.hasData) {
                                    return const Center(
                                      child: TextFontWidget(
                                          text: "No data", fontsize: 16),
                                    );
                                  } else {
                                    return ListView.separated(
                                        itemBuilder: (context, index) {
                                          final examSubData =
                                              snapshot.data!.docs[index].data();
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                left: 0, right: 0),
                                            child: ExameDataListContainer(
                                              index: index,
                                              examSubData: examSubData,
                                            ),
                                          );
                                        },
                                        separatorBuilder: (context, index) {
                                          return const SizedBox(
                                            height: 02,
                                          );
                                        },
                                        itemCount: snapshot.data!.docs.length);
                                  }
                                },
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}






class ExameDataListContainer extends StatelessWidget {
  final int index;
  const ExameDataListContainer({
    required this.index,
    super.key,
    required this.examSubData,
  });

  final examSubData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: DataContainerWidget(
                rowMainAccess: MainAxisAlignment.center,
                color: cWhite,
                // width: 150,
                index: index,
                headerTitle: '${index + 1}'), //....................No
          ),
          const SizedBox(
            width: 02,
          ),
          Expanded(
            flex: 1,
            child: DataContainerWidget(
                rowMainAccess: MainAxisAlignment.center,
                color: cWhite,
                index: index,
                headerTitle:
                    dateConvert(DateTime.parse(examSubData['uploadDate']))),
          ), //................................................. Months
          const SizedBox(
            width: 02,
          ),
          // Expanded(
          //   flex: 5,
          //   child: Container(
          //     color: index % 2 == 0
          //         ? const Color.fromARGB(255, 246, 246, 246)
          //         : Colors.blue[50],
          //     child: ListView.separated(
          //         scrollDirection: Axis.horizontal,
          //         itemBuilder: (context, index) {
          //           return Container(
          //             decoration: BoxDecoration(
          //                 border: Border.all(color: cBlack.withOpacity(0.2))),
          //             width: 50,
          //             child: Center(
          //               child: TextFontWidget(
          //                 text: examSubData['subjectName'],
          //                 fontsize: 10,
          //                 overflow: TextOverflow.ellipsis,
          //               ),
          //             ),
          //           );
          //         },
          //         separatorBuilder: (context, index) {
          //           return const SizedBox(
          //             width: 03,
          //           );
          //         },
          //         itemCount: 08),
          //   ),
          // ), //........................................... Subjects
          Expanded(
            flex: 5,
            child: DataContainerWidget(
                rowMainAccess: MainAxisAlignment.center,
                color: cWhite,
                index: index,
                headerTitle: examSubData['subjectName']),
          ),
          const SizedBox(
            width: 02,
          ),
          Expanded(
            flex: 1,
            child: DataContainerWidget(
                rowMainAccess: MainAxisAlignment.center,
                color: cWhite,
                index: index,
                headerTitle: examSubData['obtainedMark']),
          ), // ................................... Fees Required
          const SizedBox(
            width: 02,
          ),
          Expanded(
            flex: 1,
            child: DataContainerWidget(
                rowMainAccess: MainAxisAlignment.center,
                color: cWhite,
                index: index,
                headerTitle: examSubData['obtainedGrade']),
          ), //....................................... Fess Collectes
          const SizedBox(
            width: 02,
          ),
          Expanded(
            flex: 1,
            child: DataContainerWidget(
                rowMainAccess: MainAxisAlignment.center,
                color: cWhite,
                index: index,
                headerTitle: examSubData['passMark']),
          ), //....................................... Fess Pending
          const SizedBox(
            width: 02,
          ),

          Expanded(
            flex: 1,
            child: int.parse(examSubData['obtainedMark']) >=
                    int.parse(examSubData['passMark'])
                ? Container(
                    height: double.infinity,
                    color: cgreen,
                    child: const Center(
                      child:  TextFontWidget(
                        text: " Pass",
                        fontsize: 12,
                        color: cWhite,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  )
                : Container(
                    height: double.infinity,
                    color: cred,
                    child: const Center(
                      child:  TextFontWidget(
                        color: cWhite,
                        text: " Fail",
                        fontsize: 12,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
          ), //............................. Status [Full paid or Pending]
        ],
      ),
    );
  }
}
