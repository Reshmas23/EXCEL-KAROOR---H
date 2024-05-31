import 'package:flutter/material.dart';
import 'package:vidyaveechi_website/model/student_model/student_model.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';
import 'package:vidyaveechi_website/view/widgets/data_list_widgets/data_container.dart';

class ClassWiseStudentDataList extends StatelessWidget {
  final StudentModel data;
  final int index;
  const ClassWiseStudentDataList({
    required this.data,
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: data.cardTaken == false
            ? const Color.fromARGB(255, 238, 131, 131)
            : Colors.blue[50],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: DataContainerWidget(
                rowMainAccess: MainAxisAlignment.center,
                color: data.cardTaken == false
                    ? const Color.fromARGB(255, 238, 131, 131)
                    : Colors.blue[50],
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
                color: data.cardTaken == false
                    ? const Color.fromARGB(255, 238, 131, 131)
                    : Colors.blue[50],
                index: index,
                headerTitle: data.cardID),
          ), //................................................. Student ID
          const SizedBox(
            width: 01,
          ),
          Expanded(
            flex: 2,
            child: DataContainerWidget(
                rowMainAccess: MainAxisAlignment.center,
                color: data.cardTaken == false
                    ? const Color.fromARGB(255, 238, 131, 131)
                    : Colors.blue[50],
                index: index,
                headerTitle: data.admissionNumber),
          ), //................................................. Student ID
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
                    text: '  ${data.studentName}',
                    fontsize: 12,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ), //........................................... Student Name
          const SizedBox(
            width: 01,
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
                    text: "  ${data.studentemail}",
                    fontsize: 12,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ), // ................................... Student Email
          const SizedBox(
            width: 01,
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
                Expanded(
                  child: TextFontWidget(
                    text: "  ${data.parentPhoneNumber}",
                    fontsize: 12,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ), //....................................... Student Phone Number
          const SizedBox(
            width: 01,
          ),
          Expanded(
            flex: 2,
            child: StreamBuilder(
                stream: server
                    .collection('SchoolListCollection')
                    .doc(UserCredentialsController.schoolId)
                    .collection('classes')
                    .doc(data.classId)
                    .snapshots(),
                builder: (context, snap) {
                  if (snap.hasData) {
                    return DataContainerWidget(
                        rowMainAccess: MainAxisAlignment.center,
                        color: data.cardTaken == false
                            ? const Color.fromARGB(255, 238, 131, 131)
                            : Colors.blue[50],
                        // width: 150,
                        index: index,
                        headerTitle: '${snap.data!['className']}');
                  } else {
                    return const SizedBox();
                  }
                }),
          ), //............................. Student Class

          const SizedBox(
            width: 01,
          ),
          //............................. Status [Active or DeActivate]
        ],
      ),
    );
  }
}
