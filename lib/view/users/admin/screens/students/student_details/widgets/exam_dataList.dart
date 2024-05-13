import 'package:flutter/material.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/constant/constant.validate.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/widgets/data_list_widgets/data_container.dart';

class ExameDataListContainer extends StatelessWidget {
  final int index;
  const ExameDataListContainer({
    required this.index,
    super.key,
    required this.examSubjectData,
  });

  final examSubjectData;

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
                    dateConvert(DateTime.parse(examSubjectData['uploadDate']))),
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
          //                 text: examSubjectData['subjectName'],
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
                headerTitle: examSubjectData['subjectName']),
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
                headerTitle: examSubjectData['obtainedMark']),
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
                headerTitle: examSubjectData['obtainedGrade']),
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
                headerTitle: examSubjectData['passMark']),
          ), //....................................... Fess Pending
          const SizedBox(
            width: 02,
          ),

          Expanded(
            flex: 1,
            child: int.parse(examSubjectData['obtainedMark']) >=
                    int.parse(examSubjectData['passMark'])
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
