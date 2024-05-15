import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/admin_section/student_controller/student_controller.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/widgets/blue_Container_widget/blue_Container_widget.dart';

class ExcelClassWiseStudentCreation extends StatelessWidget {
  final StudentController studentController = Get.put(StudentController());

  ExcelClassWiseStudentCreation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: cWhite,
      height: 1000,
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: 100,
            child: Row(
              children: [
                BlueContainerWidget(
                    title: "Upload Excel", fontSize: 12, color: themeColorBlue),
              ],
            ),
          ),
          // Expanded(
          //     child: ListView.separated(
          //         itemBuilder: (context, index) {
          //           return
          //         },
          //         separatorBuilder: (context, index) {},
          //         itemCount: 10))
        ],
      ),
    );
  }
}

// class ClassDataListWidget extends StatelessWidget {
//   final AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> classStatus;
//   final ClassModel data;
//   final int index;
//   const ClassDataListWidget({
//     required this.index,
//     super.key,
//     required this.data,
//     required this.classStatus,
//   });

//   @override
//   Widget build(BuildContext context) {
//     DateTime currentDate = DateTime.now();

//     final String classStData =
//         classStatus.data!.docs[index].data().containsKey('lastActiveClassDay')
//             ? classStatus.data?.docs[index]['lastActiveClassDay']
//             : '00-00-0000';
//     //date string in dd-mm-yyyy format
// // Split the date string into day, month, and year
//     List<String> dateParts = classStData.split('-');
//     int day = int.parse(dateParts[0]);
//     int month = int.parse(dateParts[1]);
//     int year = int.parse(dateParts[2]);

// // Create a DateTime object using the parsed components
//     DateTime dateResult = DateTime(year, month, day);

// // Calculate the difference in milliseconds between the current date and the given date
//     int differenceInMilliseconds =
//         currentDate.difference(dateResult).inMilliseconds;

// // Convert milliseconds to days
//     int daysAgo = (differenceInMilliseconds / (1000 * 60 * 60 * 24)).round();
//     log("date$daysAgo");
//     return SizedBox(
//       height: 45,
//       child: Row(
//         children: [
//           Expanded(
//             flex: 1,
//             child: DataContainerWidget(
//                 rowMainAccess: MainAxisAlignment.center,
//                 color: cWhite,
//                 // width: 150,
//                 index: index,
//                 headerTitle: '${index + 1}'), //....................No
//           ),
//           const SizedBox(
//             width: 01,
//           ),
//           Expanded(
//             flex: 4,
//             child: DataContainerWidget(
//                 rowMainAccess: MainAxisAlignment.start,
//                 color: cWhite,
//                 index: index,
//                 headerTitle: "     ${data.className}"),
//           ),
//           const SizedBox(
//             width: 01,
//           ),
//           Expanded(
//             flex: 2,
//             child: DataContainerWidget(
//                 rowMainAccess: MainAxisAlignment.start,
//                 color: cWhite,
//                 index: index,
//                 headerTitle: daysAgo == 739389
//                     ? 'No records found'
//                     : daysAgo == 1
//                         ? 'Today'
//                         : daysAgo == 2
//                             ? 'Yesterday'
//                             : classStData),
//           ),
//           const SizedBox(
//             width: 01,
//           ),
//           Expanded(
//             flex: 2,
//             child: DataContainerWidget(
//                 rowMainAccess: MainAxisAlignment.center,
//                 color: cWhite,
//                 index: index,
//                 headerTitle: "${data.workingDaysCount}"),
//           ),
//           const SizedBox(
//             width: 01,
//           ),
//           Expanded(
//             flex: 2,
//             child: StreamBuilder(
//                 stream: server
//                     .collection('SchoolListCollection')
//                     .doc(UserCredentialsController.schoolId)
//                     .collection(UserCredentialsController.batchId!)
//                     .doc(UserCredentialsController.batchId!)
//                     .collection("classes")
//                     .doc(data.docid)
//                     .collection('Students')
//                     .snapshots(),
//                 builder: (context, studentSnaps) {
//                   if (studentSnaps.data == null) {
//                     return DataContainerWidget(
//                         rowMainAccess: MainAxisAlignment.center,
//                         color: cWhite,
//                         // width: 150,
//                         index: index,
//                         headerTitle: 'No Students is there');
//                   } else if (studentSnaps.hasData) {
//                     return DataContainerWidget(
//                         rowMainAccess: MainAxisAlignment.center,
//                         color: cWhite,
//                         // width: 150,
//                         index: index,
//                         headerTitle: '${studentSnaps.data!.docs.length}');
//                   } else {
//                     return DataContainerWidget(
//                         rowMainAccess: MainAxisAlignment.center,
//                         color: cWhite,
//                         // width: 150,
//                         index: index,
//                         headerTitle: '...');
//                   }
//                 }),
//           ), // ...................................Total Number of Students
//           const SizedBox(
//             width: 01,
//           ),
//         ],
//       ),
//     );
//   }
// }
