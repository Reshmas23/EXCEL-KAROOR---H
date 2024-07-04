import 'package:flutter/material.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/students/student_details/widgets/category_tableHeader.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';
import 'package:vidyaveechi_website/view/widgets/data_list_widgets/data_container.dart';

// class SubmissionTable extends StatefulWidget {
//   /// Creates the home page.
//   const SubmissionTable({Key? key}) : super(key: key);

//   @override
//   SubmissionTableState createState() => SubmissionTableState();
// }

// class SubmissionTableState extends State<SubmissionTable> {
//   List<Studentsubmission> studentssubmission = <Studentsubmission>[];
//   late StudentsubmissionDataSource studentsubmissionDataSource;
  

//   @override
//   void initState() {
//     super.initState();
//    studentssubmission = getStudentsubmissionData();
//    studentsubmissionDataSource = StudentsubmissionDataSource(studentsubmissionData: studentssubmission);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return
//      SfDataGrid(
//         source: studentsubmissionDataSource,
//         columnWidthMode: ColumnWidthMode.fill,
//         columns: <GridColumn>[ 
//           GridColumn(
//               columnName: 'no',
//               label: Container(
//                 color: Colors.green[200],
//                   padding: const EdgeInsets.all(16.0),
//                   alignment: Alignment.center,
//                   child: const Text(
//                     'NO.',
//                   ))),
//           GridColumn(
//               columnName: 'homeworks',
//               label: Container(
//                 color: Colors.green[200],
//                   padding: const EdgeInsets.all(8.0),
//                   alignment: Alignment.center,
//                   child: const Text('HOMEWORKS'))),
//           GridColumn(
//               columnName: 'subject',
//               label: Container(
//                 color: Colors.green[200],
//                   padding: const EdgeInsets.all(8.0),
//                   alignment: Alignment.center,
//                   child: const Text(
//                     'SUBJECTS',
//                     // overflow: TextOverflow.ellipsis,
//                   ))),
//           GridColumn(
//               columnName: 'status',
//               label: Container(
//                 color: Colors.green[200],
//                   padding: const EdgeInsets.all(8.0),
//                   alignment: Alignment.center,
//                   child: const Text('STATUS'))),
//         ],
      
//     );
//   }

//   List<Studentsubmission> getStudentsubmissionData() {
//     return [
//       Studentsubmission(01, 'Writing', 'Malayalam', 'Checked'),
//      Studentsubmission(02, 'Reading', 'English', 'Pending'),
//       Studentsubmission(03, 'Assignment', 'Social', 'Checked'),
//       Studentsubmission(04, 'Learning', 'Maths', 'Checked'),
//       Studentsubmission(05, 'Complete Notes', 'Science', 'Pending'),
//       Studentsubmission(06, 'Rewriting', 'GK', 'Pending'),
//      Studentsubmission(07, 'Study', 'Chemistry', 'Checked'),
//       Studentsubmission(08, 'Peom Writing', 'Hindi', 'Pending'),
//       // Employee(10009, 'Gable', 'Developer', 15000),
//       // Employee(10010, 'Grimes', 'Developer', 15000)
//     ];
//   }
// }

// /// Custom business object class which contains properties to hold the detailed
// /// information about the employee which will be rendered in datagrid.
// class Studentsubmission {
//   /// Creates the employee class with required details.
//   Studentsubmission(this.no, this.homeworks, this.subjects, this.status);

//   /// Id of an employee.
//   final int no;

//   /// Name of an employee.
//   final String homeworks;

//   /// Designation of an employee.
//   final String subjects;

//   /// Salary of an employee.
//   final String status;
// }

// /// An object to set the employee collection data source to the datagrid. This
// /// is used to map the employee data to the datagrid widget.
// class StudentsubmissionDataSource extends DataGridSource {
//    int rowIndex = 0;
//   /// Creates the employee data source class with required details.
//   StudentsubmissionDataSource({required List<Studentsubmission> studentsubmissionData}) {
    
//     _studentsubmissionData = studentsubmissionData
//         .map<DataGridRow>((e) => DataGridRow(cells: [
//               DataGridCell<int>(columnName: 'id', value: e.no),
//               DataGridCell<String>(columnName: 'name', value: e.homeworks,),
//               DataGridCell<String>(
//                   columnName: 'designation', value: e.subjects),
//               DataGridCell<String>(columnName: 'status', value: e.status),
//             ]))
//         .toList();
//   }

//   List<DataGridRow> _studentsubmissionData = [];

//   @override
//   List<DataGridRow> get rows => _studentsubmissionData;

//   @override
//   DataGridRowAdapter buildRow(DataGridRow row) {
//      final isEvenRow = rowIndex.isEven;
//        rowIndex++;
//     return DataGridRowAdapter(
//       color: isEvenRow ?Colors.white : Colors.green[100] ,
//         cells: row.getCells().map<Widget>((e) {
//       return Container(
//         alignment: Alignment.center,
//         padding: const EdgeInsets.all(8.0),
//         child: Text(e.value.toString()),
//       );
//     }).toList());
//   }
// }



class SubmissionTable extends StatelessWidget {
  const SubmissionTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 0, right: 0, top: 0),
          child: Container(
            color: Colors.white,
            height: 50,
            child: const Row(
              children: [
                Expanded(
                  flex: 1,
                  child: CatrgoryTableHeaderColorWidget(
                    color: Colors.green,
                    height: 50,
                    textcolor: Colors.white,
                    headerTitle: 'NO.',
                  ),
                ),
                SizedBox(width: 2),
                Expanded(
                  flex: 2,
                  child: CatrgoryTableHeaderColorWidget(
                    color: Colors.green,
                    height: 50,
                    textcolor: Colors.white,
                    headerTitle: 'HOMEWORKS',
                  ),
                ),
                SizedBox(width: 2),
                Expanded(
                  flex: 2,
                  child: CatrgoryTableHeaderColorWidget(
                    color: Colors.green,
                    height: 50,
                    textcolor: Colors.white,
                    headerTitle: 'SUBMITTED DATE',
                  ),
                ),
                SizedBox(width: 2),
                Expanded(
                  flex: 2,
                  child: CatrgoryTableHeaderColorWidget(
                    color: Colors.green,
                    height: 50,
                    textcolor: Colors.white,
                    headerTitle: 'STATUS',
                  ),
                ),
                SizedBox(width: 2),
              ],
            ),
          ),
        ),
        Expanded(
          child: StreamBuilder(
            stream: server
                .collection('SchoolListCollection')
                .doc(UserCredentialsController.schoolId!)
                .collection(UserCredentialsController.batchId!)
                .doc(UserCredentialsController.batchId!)
                .collection('classes')
                .doc(UserCredentialsController.classId!)
                .collection("HomeWorks")
                .snapshots(),
            builder: (context, homeworkSnapshot) {
              if (homeworkSnapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (!homeworkSnapshot.hasData || homeworkSnapshot.data == null) {
                return const Center(child: Text("No Homeworks"));
              }

              final homeworkDocs = homeworkSnapshot.data!.docs;

              return ListView.builder(
                itemCount: homeworkDocs.length,
                itemBuilder: (context, index) {
                  // ignore: unused_local_variable
                  final homeworkData = homeworkDocs[index].data();
                  return StreamBuilder(
                    stream: server
                        .collection('SchoolListCollection')
                        .doc(UserCredentialsController.schoolId!)
                        .collection(UserCredentialsController.batchId!)
                        .doc(UserCredentialsController.batchId!)
                        .collection('classes')
                        .doc(UserCredentialsController.classId!)
                        .collection("HomeWorks")
                        .doc(homeworkDocs[index].id)
                        .collection("Submit")
                        .snapshots(),
                    builder: (context, submissionSnapshot) {
                      if (submissionSnapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (!submissionSnapshot.hasData || submissionSnapshot.data == null || submissionSnapshot.data!.docs.isEmpty) {
                        return const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Center(child: TextFontWidget(text: "Not Submitted", fontsize: 12)),
                        );
                      }

                      final submissionDocs = submissionSnapshot.data!.docs;
                      final submissionData = submissionDocs[0].data(); 

                      return HWSubmissionDataList(
                        homeworkSubmission: submissionData,
                        index: index,
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class HWSubmissionDataList extends StatelessWidget {
  final int index;
  const HWSubmissionDataList({
    required this.index,
    super.key, this.homeworkSubmission,
  });
  // ignore: prefer_typing_uninitialized_variables
  final homeworkSubmission;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: DataContainerWidget(
                height: 50,
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
            flex: 2,
            child: DataContainerWidget(
                height: 50,
                rowMainAccess: MainAxisAlignment.center,
                color: cWhite,
                index: index,
                headerTitle: homeworkSubmission['homeWorkName']
                ),
          ),
          const SizedBox(
            width: 02,
          ),
           Expanded(
            flex: 2,
            child: 
                 DataContainerWidget(
                    height: 50,
                    rowMainAccess: MainAxisAlignment.center,
                    color: cWhite,
                    index: index,
                    headerTitle: homeworkSubmission['submittedDate'],
                    ),
          ), // ................................... Fees Required
          const SizedBox(
            width: 02,
          ),
          Expanded(
            flex: 2,
            child: DataContainerWidget(
                    height: 50,
                    rowMainAccess: MainAxisAlignment.center,
                    color: cWhite,
                    index: index,
                    headerTitle: homeworkSubmission['Status']==true?'Completed':'Pending'),
                   
          ), //....................................... Fess Collectes
          const SizedBox(
            width: 02,
          ),
          //............................. Status [Full paid or Pending]
        ],
      ),
    );
  }
}
