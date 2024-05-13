import 'package:flutter/material.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';
import 'package:vidyaveechi_website/view/widgets/data_list_widgets/data_container.dart';

class AllTeacherAttendeceDataList extends StatelessWidget {
  final Map<String, dynamic> data;
  final int index;
  const AllTeacherAttendeceDataList({
    required this.data,
    required this.index,
    super.key,
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
            width: 02,
          ),
          Expanded(
            flex: 2,
            child: DataContainerWidget(
                rowMainAccess: MainAxisAlignment.center,
                color: cWhite,
                index: index,
                headerTitle: data['employeeID']),
          ), //................................................. Student ID
          const SizedBox(
            width: 02,
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
                    text: data['teacherName'],
                    fontsize: 12,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ), //........................................... Teacher Name
          const SizedBox(
            width: 02,
          ),
          Expanded(
            flex: 2,
            child: DataContainerWidget(
                rowMainAccess: MainAxisAlignment.center,
                color: cWhite,
                // width: 150,
                index: index,
                headerTitle: data['CountClassAttended']
                    .toString()), //....................Teacher attendence count
          ),
          const SizedBox(
            width: 02,
          ),
          Expanded(
            flex: 2,
            child: StreamBuilder(
                stream: server
                    .collection('SchoolListCollection')
                    .doc(UserCredentialsController.schoolId)
                    .collection(UserCredentialsController.batchId!)
                    .doc(UserCredentialsController.batchId!)
                    .collection('TeacherAttendence')
                    .doc(data['docid'])
                    .collection('DayWiseAttendence')
                    .snapshots(),
                builder: (context, teacherSnap) {
                  if (teacherSnap.hasData) {
                    return DataContainerWidget(
                        rowMainAccess: MainAxisAlignment.center,
                        color: cWhite,
                        // width: 150,
                        index: index,
                        headerTitle: teacherSnap.data!.docs.length.toString());
                  } else {
                    return const Text('....');
                  }
                }), //....................Teacher attendence count
          ),
          const SizedBox(
            width: 02,
          ),
          Expanded(
            flex: 4,
            child: Row(
              children: [
                SizedBox(
                  width: 15,
                  child: Center(
                    child: Image.asset(
                      'webassets/png/gmail.png',
                    ),
                  ),
                ),
                Expanded(
                  child: TextFontWidget(
                    text: " ${data['teacherEmail']}",
                    fontsize: 12,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ), // ................................... Student Email
          const SizedBox(
            width: 02,
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                SizedBox(
                  width: 15,
                  child: Center(
                    child: Image.asset(
                      'webassets/png/telephone.png',
                    ),
                  ),
                ),
                const SizedBox(
                  width: 05,
                ),
                Expanded(
                  child: DataContainerWidget(
                      rowMainAccess: MainAxisAlignment.start,
                      color: cWhite,
                      index: index,
                      headerTitle: "${data['teacherPhNo']}"),
                ),
              
              ],
            ),
          ), //....................................... Student Phone Number
          const SizedBox(
            width: 02,
          ),
        ],
      ),
    );
  }
}
