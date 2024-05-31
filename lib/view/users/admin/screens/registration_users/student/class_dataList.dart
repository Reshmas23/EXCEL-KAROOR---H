import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vidyaveechi_website/model/class_model/class_model.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';
import 'package:vidyaveechi_website/view/widgets/data_list_widgets/data_container.dart';

class AllClassDataList extends StatelessWidget {
  final AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> classStatus;
  final int index;
  final ClassModel data;
  const AllClassDataList({
    required this.classStatus,
    required this.index,
    required this.data,
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
            width: 01,
          ),

          Expanded(
            flex: 3,
            child: DataContainerWidget(
                rowMainAccess: MainAxisAlignment.center,
                color: cWhite,
                index: index,
                headerTitle: data.className),
          ), //.
          const SizedBox(
            width: 01,
          ),

          Expanded(
            flex: 2,
            child: DataContainerWidget(
                rowMainAccess: MainAxisAlignment.center,
                color: cWhite,
                index: index,
                headerTitle: data.classId),
          ), //
          const SizedBox(
            width: 01,
          ), //
          // Expanded(
          //   flex: 2,
          //   child: DataContainerWidget(
          //       rowMainAccess: MainAxisAlignment.center,
          //       color: cWhite,
          //       index: index,
          //       headerTitle: data.classId),
          // ), //
          // const SizedBox(
          //   width: 01,
          // ), //
          Expanded(
            flex: 3,
            child: DataContainerWidget(
                rowMainAccess: MainAxisAlignment.center,
                color: cWhite,
                index: index,
                headerTitle: data.classTeacherName ?? "Not found"),
          ), //
          const SizedBox(
            width: 01,
          ),
          Expanded(
            flex: 2,
            child:  StreamBuilder(
                stream: server
                    .collection('SchoolListCollection')
                    .doc(UserCredentialsController.schoolId)
                    .collection(UserCredentialsController.batchId!)
                    .doc(UserCredentialsController.batchId!)
                    .collection("classes")
                    .doc(data.docid)
                    .collection('Students')
                    .snapshots(),
                builder: (context, studentSnaps) {
                  if (studentSnaps.data == null) {
                    return DataContainerWidget(
                        rowMainAccess: MainAxisAlignment.center,
                        color: cWhite,
                        // width: 150,
                        index: index,
                        headerTitle: 'No Students is there');
                  } else if (studentSnaps.hasData) {
                    return DataContainerWidget(
                        rowMainAccess: MainAxisAlignment.center,
                        color: cWhite,
                        // width: 150,
                        index: index,
                        headerTitle: '${studentSnaps.data!.docs.length}');
                  } else {
                    return DataContainerWidget(
                        rowMainAccess: MainAxisAlignment.center,
                        color: cWhite,
                        // width: 150,
                        index: index,
                        headerTitle: '...');
                  }
                }),
          ), //
          const SizedBox(
            width: 01,
          ),
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
          // Expanded(
          //   flex: 2,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       SizedBox(
          //         width: 15,
          //         child: Image.asset(
          //           'webassets/png/active.png',
          //         ),
          //       ),
          //       const TextFontWidget(
          //         text: "   ",
          //         fontsize: 12,
          //         overflow: TextOverflow.ellipsis,
          //       ),
          //     ],
          //   ),
          // ), //............................. Status [Active or DeActivate]
        ],
      ),
    );
  }
}
