import 'package:flutter/material.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/widgets/data_list_widgets/data_container.dart';

class TeacherDataList extends StatelessWidget {
  const TeacherDataList({
    super.key,
    required this.index,
    required this.data,
    required this.status,
    required this.currentclass,
    required this.classname,
    required this.subjectFeefortr,
    required this.subjectName,
  });

  final int index;
  final dynamic data;
  final bool status;
  final String currentclass;
  final String classname;
  final String subjectFeefortr;
  final String subjectName;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      color: index % 2 == 0 ? const Color.fromARGB(255, 246, 246, 246) : Colors.blue[50],
      child: Row(
        children: [
          Expanded(
            flex: 7,
            child: Center(
              child: DataContainerWidget(
                  rowMainAccess: MainAxisAlignment.center,
                  color: cWhite,
                  // width: 150,
                  index: index,
                  headerTitle: data['teacherName']),
            ), //....................No
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
                    headerTitle: classname)),
          ), //................................................. Months
          const SizedBox(
            width: 02,
          ),
          Expanded(
            flex: 7,
            child: Center(
                child: DataContainerWidget(
                    rowMainAccess: MainAxisAlignment.center,
                    color: cWhite,
                    index: index,
                    headerTitle: currentclass)),
          ),
          const SizedBox(
            width: 02,
          ),
          Expanded(
            flex: 7,
            child: Center(
                child: DataContainerWidget(
              rowMainAccess: MainAxisAlignment.center,
              color: cWhite,
              index: index,
              headerTitle: subjectName,
            )
                //  SelectTeacherWiseSubjectDropDown(),
                ),
          ),
          const SizedBox(
            width: 02,
          ),
          Expanded(
            flex: 6,
            child: Container(
              color: index % 2 == 0 ? const Color.fromARGB(255, 246, 246, 246) : Colors.blue[50],
              child: Center(
                  child: DataContainerWidget(
                rowMainAccess: MainAxisAlignment.center,
                color: cWhite,
                index: index,
                headerTitle: subjectFeefortr,
              )),
            ),
          ),
          const SizedBox(
            width: 02,
          ),
          Expanded(
            flex: 6,
            child: Center(
              child: DataContainerWidget(
                rowMainAccess: MainAxisAlignment.center,
                color: cWhite,
                index: index,
                headerTitle: "--",
              ),
            ),
          ),
          const SizedBox(
            width: 02,
          ),
          Expanded(
            flex: 4,
            child: GestureDetector(
              onTap: () {
                // status.value == true ? status.value = false : status.value = true;
              },
              child: SizedBox(
                width: 10,
                height: 20,
                child: Image.asset(
                  status == true ? 'webassets/png/active.png' : 'webassets/png/shape.png',
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 02,
          ),
        ],
      ),
    );
  }
}
