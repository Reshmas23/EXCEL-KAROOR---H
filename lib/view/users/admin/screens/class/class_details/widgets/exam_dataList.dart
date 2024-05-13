import 'package:flutter/material.dart';
import 'package:vidyaveechi_website/model/student_mark_list_model/student_mark_list_model.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/constant/constant.validate.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/widgets/data_list_widgets/data_container.dart';

class ClassExameDataListContainer extends StatelessWidget {
  final int index;
  const ClassExameDataListContainer({
    required this.index,
    super.key,
    required this.data,
  });

  final StudentMarkListModel data;

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
                headerTitle: dateConvert(DateTime.parse(data.uploadDate))),
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
                headerTitle: data.studentName),
          ),
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
          //                 text: data.studentName,
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
          // const SizedBox(
          //   width: 02,
          // ),
          Expanded(
            flex: 1,
            child: DataContainerWidget(
                rowMainAccess: MainAxisAlignment.center,
                color: cWhite,
                index: index,
                headerTitle: data.obtainedMark),
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
                headerTitle: data.obtainedGrade),
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
                headerTitle: data.passMark),
          ), //....................................... Fess Pending
          const SizedBox(
            width: 02,
          ),

          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 15,
                  child: Image.asset(
                    'webassets/png/active.png',
                  ),
                ),
                TextFontWidget(
                  text: int.parse(data.obtainedMark) >= int.parse(data.passMark)
                      ? "Pass"
                      : "Fail",
                  fontsize: 12,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ), //............................. Status [Full paid or Pending]
        ],
      ),
    );
  }
}
