import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/constant/constant.validate.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/widgets/data_list_widgets/data_container.dart';

class AttendenceDataListContainer extends StatelessWidget {
  final int index;
 final QueryDocumentSnapshot? attendanceData;
  const AttendenceDataListContainer({
    required this.index,
    super.key,
    this.attendanceData,
  });

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
                headerTitle: dateConvert(DateTime.fromMillisecondsSinceEpoch(
                    attendanceData!['date']))),
          ), //................................................. Months
          const SizedBox(
            width: 02,
          ),
          Expanded(
            flex: 5,
            child: DataContainerWidget(
                rowMainAccess: MainAxisAlignment.center,
                color: cWhite,
                index: index,
                headerTitle: attendanceData!['subjectName']),
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
          //             child: const Center(
          //               child: TextFontWidget(
          //                 text: " English",
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
          const SizedBox(
            width: 02,
          ),
          Expanded(
            flex: 1,
            child: DataContainerWidget(
                rowMainAccess: MainAxisAlignment.center,
                color: cWhite,
                index: index,
                headerTitle: attendanceData!['periodNo'].toString()),
          ), // ................................... Fees Required
          const SizedBox(
            width: 02,
          ),
          // Expanded(
          //   flex: 1,
          //   child: DataContainerWidget(
          //       rowMainAccess: MainAxisAlignment.center,
          //       color: cWhite,
          //       index: index,
          //       headerTitle: "1"),
          // ), //....................................... Fess Collectes
          // const SizedBox(
          //   width: 02,
          // ),
          // Expanded(
          //   flex: 1,
          //   child: DataContainerWidget(
          //       rowMainAccess: MainAxisAlignment.center,
          //       color: cWhite,
          //       index: index,
          //       headerTitle: "5"),
          // ), //....................................... Fess Pending
          // const SizedBox(
          //   width: 02,
          // ),

          Expanded(
            flex: 1,
            child: attendanceData!['present'] == true
                ? Container(
                    height: double.infinity,
                    color: cgreen,
                    child: Center(
                      child:  TextFontWidget(
                        text: " Present",
                        fontsize: 12,
                        color: cWhite,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  )
                : Container(
                    height: double.infinity,
                    color: cred,
                    child: Center(
                      child:  TextFontWidget(
                        color: cWhite,
                        text: "Absent",
                        fontsize: 12,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     SizedBox(
            //       width: 15,
            //       child: Image.asset(
            //         'webassets/png/active.png',
            //       ),
            //     ),
            //     const TextFontWidget(
            //       text: " Present",
            //       fontsize: 12,
            //       overflow: TextOverflow.ellipsis,
            //     ),
            //   ],
            // ),
          ), //............................. Status [Full paid or Pending]
        ],
      ),
    );
  }
}
