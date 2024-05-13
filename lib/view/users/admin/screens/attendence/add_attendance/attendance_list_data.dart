import 'package:flutter/material.dart';
import 'package:vidyaveechi_website/model/student_Attendece_model/student_attendence_model.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/widgets/data_list_widgets/data_container.dart';

class AllAttendanceDataList extends StatelessWidget {
  final int index;
  final StudentAttendanceModel studentData;
  const AllAttendanceDataList({
    required this.index,
    super.key,
    required this.studentData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: index % 2 == 0
            ? const Color.fromARGB(255, 246, 246, 246)
            : Colors.blue[50],
      ),
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
            width: 01,
          ),
          Expanded(
            flex: 2,
            child: DataContainerWidget(
                rowMainAccess: MainAxisAlignment.center,
                color: cWhite,
                index: index,
                headerTitle: "0015"),
          ), //................................................. teacher ID
          const SizedBox(
            width: 01,
          ),
          Expanded(
            flex: 4,
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                  child: Center(
                    child: Image.asset(
                      'webassets/stickers/icons8-student-100 (1).png',
                    ),
                  ),
                ),
                Expanded(
                  child: TextFontWidget(
                    text: "  ${studentData.studentName}",
                    fontsize: 12,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ), //........................................... teacher Name
          const SizedBox(
            width: 01,
          ),
          // Expanded(
          //   flex: 3,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Checkbox(
          //         checkColor: cWhite,
          //         activeColor: cgreen,
          //         value: true,
          //         onChanged: (value) {},
          //       ),
          //       SizedBox(
          //         width: 15,
          //         child: Center(
          //           child: Image.asset(
          //             'webassets/png/tick.png',
          //           ),
          //         ),
          //       ),
          //       TextFontWidget(
          //         text: "  Present",
          //         fontsize: 12,
          //         overflow: TextOverflow.ellipsis,
          //       ),
          //     ],
          //   ),
          // ), // ................................... teacher Email
          // const SizedBox(
          //   width: 01,
          // ),
          // Expanded(
          //   flex: 3,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Checkbox(
          //         checkColor: cWhite,
          //         activeColor: cred,
          //         value: true,
          //         onChanged: (value) {},
          //       ),
          //       SizedBox(
          //         width: 15,
          //         child: Center(
          //           child: Image.asset(
          //             'webassets/png/shape.png',
          //           ),
          //         ),
          //       ),
          //       TextFontWidget(
          //         text: " Absent",
          //         fontsize: 12,
          //         overflow: TextOverflow.ellipsis,
          //       ),
          //     ],
          //   ),
          // ), //....................................... teacher Phone Number
          // const SizedBox(
          //   width: 01,
          // ),
          // Expanded(
          //   flex: 2,
          //   child: DataContainerWidget(
          //       rowMainAccess: MainAxisAlignment.center,
          //       color: cWhite,
          //       // width: 150,
          //       index: index,
          //       headerTitle: 'Class '),
          // ), //............................. Student Class

          // const SizedBox(
          //   width: 01,
          // ),
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 15,
                  child: Image.asset(
                    'webassets/png/active.png',
                  ),
                ),
                studentData.present
                    ?  TextFontWidget(
                        text: "  Present ",
                        fontsize: 12,
                        overflow: TextOverflow.ellipsis,
                      )
                    :  TextFontWidget(
                        text: "  Absent ",
                        fontsize: 12,
                        overflow: TextOverflow.ellipsis,
                      )
              ],
            ),
          ), //............................. Status [Active or DeActivate]
        ],
      ),
    );
  }
}
