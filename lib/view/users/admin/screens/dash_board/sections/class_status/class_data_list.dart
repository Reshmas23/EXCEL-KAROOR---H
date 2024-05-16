import 'package:flutter/material.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/widgets/data_list_widgets/data_container.dart';

class ClassDataList extends StatelessWidget {
  const ClassDataList({
    super.key,
    required this.index,
    required this.classData,
    required this.presentStudents,
    required this.absentStudents,
    required this.currentTr,
    required this.status,
  });
  final int index;
  final dynamic classData;
  final String currentTr;
  final String presentStudents;
  final String absentStudents;
  final bool status;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      color: index % 2 == 0
          ? const Color.fromARGB(255, 246, 246, 246)
          : Colors.blue[50],
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Center(
              child: DataContainerWidget(
                  rowMainAccess: MainAxisAlignment.center,
                  color: cWhite,
                  index: index,
                  headerTitle: classData['className']),
            ),
          ),
          const SizedBox(
            width: 02,
          ),
          Expanded(
            flex: 5,
            child: Center(
              child: DataContainerWidget(
                rowMainAccess: MainAxisAlignment.center,
                color: cWhite,
                index: index,
                headerTitle: classData['classTeacherName'] == null
                    ? '  ${classData['classTeacherName']}'
                    : 'not found',
              ),
            ),
          ),
          const SizedBox(
            width: 02,
          ),
          Expanded(
            flex: 5,
            child: Center(
              child: DataContainerWidget(
                rowMainAccess: MainAxisAlignment.center,
                color: cWhite,
                index: index,
                headerTitle: currentTr,
              ),
            ),
          ),
          const SizedBox(
            width: 02,
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: DataContainerWidget(
                rowMainAccess: MainAxisAlignment.center,
                color: cWhite,
                index: index,
                headerTitle: presentStudents,
              ),
            ),
          ),
          const SizedBox(
            width: 02,
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: DataContainerWidget(
                rowMainAccess: MainAxisAlignment.center,
                color: cWhite,
                index: index,
                headerTitle: absentStudents,
              ),
            ),
          ),
          const SizedBox(
            width: 02,
          ),
          Expanded(
            flex: 2,
            child: SizedBox(
              width: 10,
              height: 20,
              child: Image.asset(
                status == true
                    ? 'webassets/png/active.png'
                    : 'webassets/png/shape.png',
              ),
            ),
          ),
          const SizedBox(
            width: 02,
          ),
          // Expanded(
          //   flex: 2,
          //   child: Center(
          //     child: DataContainerWidget(
          //       rowMainAccess: MainAxisAlignment.center,
          //       color: cWhite,
          //       index: index,
          //       headerTitle: absentStudents,
          //     ),
          //   ),
          // ),
          // const SizedBox(
          //   width: 02,
          // ),
        ],
      ),
    );
  }
}
