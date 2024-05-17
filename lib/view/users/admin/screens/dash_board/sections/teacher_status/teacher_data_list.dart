import 'package:flutter/material.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';
import 'package:vidyaveechi_website/view/widgets/data_list_widgets/data_container.dart';

class TeacherDataList extends StatelessWidget {
  const TeacherDataList({
    super.key,
    required this.index,
    required this.data,
    required this.status,
    required this.currentclass,
    required this.subjectFeefortr,
  });

  final int index;
  final dynamic data;
  final bool status;
  final String currentclass;
  final String subjectFeefortr;
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
              child: data['classID'] == null || data['classID'] == ""
                  ? DataContainerWidget(
                      rowMainAccess: MainAxisAlignment.center,
                      color: cWhite,
                      index: index,
                      headerTitle: 'No class assigned',
                    )
                  : StreamBuilder(
                      stream: server
                          .collection('SchoolListCollection')
                          .doc(UserCredentialsController.schoolId)
                          .collection('classes') 
                          .where('classId', isEqualTo: data['classID']) 
                          .snapshots(), 
                      builder: (context, classsnapshot) {
                        if (classsnapshot.connectionState == ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator()); // Loading state
                        } else if (classsnapshot.hasError) {
                          return Center(
                              child: Text('Error: ${classsnapshot.error}')); // Error state
                        } else if (!classsnapshot.hasData || classsnapshot.data!.docs.isEmpty) {
                          return DataContainerWidget(
                              rowMainAccess: MainAxisAlignment.center,
                              color: cWhite,
                              index: index,
                              headerTitle: '--');
                        } else {
                          final classname = classsnapshot.data!.docs.first;
                          return DataContainerWidget(
                              rowMainAccess: MainAxisAlignment.center,
                              color: cWhite,
                              index: index,
                              headerTitle: classname['className']);
                        }
                      }),
            ),
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
