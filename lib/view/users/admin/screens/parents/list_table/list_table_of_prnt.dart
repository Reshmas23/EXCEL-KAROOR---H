import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/admin_section/parent_controller/parent_controller.dart';
import 'package:vidyaveechi_website/model/parent_model/parent_model.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';
import 'package:vidyaveechi_website/view/widgets/data_list_widgets/data_container.dart';

class AllParentsDataList extends StatelessWidget {
  final int index;
  final ParentModel data;
  AllParentsDataList({
    required this.index,
    required this.data,
    super.key,
  });
  final ParentController parentController = Get.put(ParentController());
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
          // Expanded(
          //   flex: 2,
          //   child: DataContainerWidget(
          //       rowMainAccess: MainAxisAlignment.center,
          //       color: cWhite,
          //       index: index,
          //       headerTitle: "99578"),
          // ), //................................................. Parent ID
          // const SizedBox(
          //   width: 01,
          // ),
          Expanded(
            flex: 4,
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                  child: Center(
                    child: Image.asset(
                      'webassets/flact_png/icons8-parent-100.png',
                    ),
                  ),
                ),
                Expanded(
                  child: TextFontWidget(
                    text: "${data.parentName}",
                    fontsize: 12,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ), //........................................... Parent Name
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
                      'webassets/stickers/icons8-student-100 (1).png',
                    ),
                  ),
                ),
                Expanded(
                  child: TextFontWidget(
                    text: "  ${data.parentEmail}",
                    fontsize: 12,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ), // ................................... Parent Email
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
          ), //....................................... parent Phone Number
          const SizedBox(
            width: 01,
          ),
          Expanded(
            flex: 2,
            child: StreamBuilder(
                stream: server
                    .collection('SchoolListCollection')
                    .doc(UserCredentialsController.schoolId)
                    .collection('AllStudents')
                    .doc(data.studentID)
                    .snapshots(),
                builder: (context, stsnaps) {
                  if (stsnaps.hasData) {
                    return StreamBuilder(
                        stream: server
                            .collection('SchoolListCollection')
                            .doc(UserCredentialsController.schoolId)
                            .collection('classes')
                            .doc(stsnaps.data?.data()?['classId'])
                            .snapshots(),
                        builder: (context, snapshot) {
                          return DataContainerWidget(
                            rowMainAccess: MainAxisAlignment.center,
                            color: cWhite,
                            // width: 150,
                            index: index,
                            headerTitle:
                                ' ${snapshot.data?.data()?['className']??'Not Found'}',
                            // Get.find<StudentController>().stNameController.text.trim()
                            //  parentController.studentName.string
                          );
                        });
                  } else if (stsnaps.hasError) {
                    return const Text('Class');
                  } else {
                    return const Text('');
                  }
                }),
          ), //............................. Student Class
          //  Expanded(
          //   flex: 2,
          //   child: FutureBuilder(
          //     future: FirebaseFirestore.instance
          //                 .collection("SchoolListCollection")
          //                 .doc(UserCredentialsController.schoolId)
          //                 .collection("AllStudents")
          //                 .doc(UserCredentialsController .parentModel?.studentID ?? '')
          //                 .get(),
          //     builder: (context, snap) {
          //       if (snap.hasData) {
          //       return DataContainerWidget(
          //           rowMainAccess: MainAxisAlignment.center,
          //           color: cWhite,
          //           // width: 150,
          //           index: index,
          //           headerTitle: 'Student : ${snap.data?.data()?['studentName']}',
          //           // Get.find<StudentController>().stNameController.text.trim()
          //         //  parentController.studentName.string
          //           );
          //           } else {
          //                 return const Text('');
          //               }
          //     }
          //   ),
          // ),

          const SizedBox(
            width: 01,
          ),
          // Expanded(
          //   flex: 3,
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
          //         text: "  Active",
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
