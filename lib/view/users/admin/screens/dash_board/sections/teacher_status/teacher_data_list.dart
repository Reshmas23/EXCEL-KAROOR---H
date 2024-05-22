import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/all_teachers_controller/all_teachers_controller.dart';
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
    required this.teacherId, // Add teacherId
  });

  final int index;
  final dynamic data;
  final bool status;
  final String currentclass;
  final String classname;
  final String teacherId; // Add teacherId

  @override
  Widget build(BuildContext context) {
    final allteacherscontroller = Get.put(Allteacherscontroller());
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
                  index: index,
                  headerTitle: data['teacherName']),
            ),
          ),
          const SizedBox(
            width: 2,
          ),
          Expanded(
            flex: 5,
            child: Center(
                child: DataContainerWidget(
                    rowMainAccess: MainAxisAlignment.center,
                    color: cWhite,
                    index: index,
                    headerTitle: classname)),
          ),
          const SizedBox(
            width: 2,
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
            width: 2,
          ),
          Expanded(
            flex: 7,
            child: Center(
              child: StreamBuilder(
                stream: allteacherscontroller.getTeacherSubjectsStream(teacherDocId: teacherId), // Pass teacherId
                builder: (context, classsnapshot) {
                  if (classsnapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (classsnapshot.hasError) {
                    return Center(child: Text('Error: ${classsnapshot.error}'));
                  } else if (!classsnapshot.hasData || classsnapshot.data!.docs.isEmpty) {
                    return DataContainerWidget(
                      rowMainAccess: MainAxisAlignment.center,
                      color: cWhite,
                      index: index,
                      headerTitle: "--",
                    );
                  } else {
                    var subjectName = classsnapshot.data!.docs.first['subjectName'];
                    return DataContainerWidget(
                      rowMainAccess: MainAxisAlignment.center,
                      color: cWhite,
                      index: index,
                      headerTitle: subjectName,
                    );
                  }
                },
              ),
            ),
          ),
          const SizedBox(
            width: 2,
          ),
          Expanded(
            flex: 6,
            child: Container(
              color: index % 2 == 0 ? const Color.fromARGB(255, 246, 246, 246) : Colors.blue[50],
              child: Center(
                child: StreamBuilder(
                  stream: allteacherscontroller.getTeacherSubjectsStream(teacherDocId: teacherId), // Pass teacherId
                  builder: (context, classsnapshot) {
                    if (classsnapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (classsnapshot.hasError) {
                      return Center(child: Text('Error: ${classsnapshot.error}'));
                    } else if (!classsnapshot.hasData || classsnapshot.data!.docs.isEmpty) {
                      return DataContainerWidget(
                        rowMainAccess: MainAxisAlignment.center,
                        color: cWhite,
                        index: index,
                        headerTitle: '--',
                      );
                    } else {
                      var subjectFeefortr = classsnapshot.data!.docs.first['subjectFeefortr'].toString();
                      return DataContainerWidget(
                        rowMainAccess: MainAxisAlignment.center,
                        color: cWhite,
                        index: index,
                        headerTitle: subjectFeefortr,
                      );
                    }
                  },
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 2,
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
            width: 2,
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
            width: 2,
          ),
        ],
      ),
    );
  }
}