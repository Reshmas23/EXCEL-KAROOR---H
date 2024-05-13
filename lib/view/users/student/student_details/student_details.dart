
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/google_fira_sans.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/users/student/student_details/attandance_graphview.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';

class StudentsDetailsPart extends StatelessWidget {
   const StudentsDetailsPart({super.key});
  @override
  Widget build(BuildContext context) {
    return ResponsiveWebSite.isMobile(context)
        ? Column(
            children: [
              Padding(
                 padding: const EdgeInsets.only(right: 08,left: 08),
                child: studentsDetailsPartList[0],
              ),
             Padding(
               padding: const EdgeInsets.only(right: 08,left: 08,top: 08),
               child: SizedBox(
                 height: 120,
                 child: studentsDetailsPartList[1]),
             ),
            ],
          )
        : Row(
            children: [
              SizedBox(
                width: ResponsiveWebSite.isTablet(context)? 420:550,
                height: 120,
                child: studentsDetailsPartList[0]),
              Padding(
                padding: const EdgeInsets.only(top: 0,left: 01),
                child: SizedBox(
                  height: 120,
                  width: 180,
                  child: studentsDetailsPartList[1]),
              ),
            ],
          );

  }
}

final String formatter = DateFormat('yMd').format(DateTime.now());
List<Widget> studentsDetailsPartList = [
  Padding(
    padding: const EdgeInsets.only(left: 0, top: 0),
    child: Container(
      height: 120,
      color: cWhite,
      child: Row(
        children: [
           Padding(
            padding: EdgeInsets.only(left: 12, top: 8, bottom: 8),
            child: CircleAvatar(
              maxRadius: 50,
              backgroundImage: NetworkImage( UserCredentialsController .studentModel!.profileImageUrl),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
             //   TextFontWidget(text: "Welcome,", fontsize:17,fontWeight: FontWeight.w700,),
                TextFontWidget(
                  text: UserCredentialsController .studentModel!.studentName,
                  fontsize: 15,
                  fontWeight: FontWeight.w600,
                ),
                TextFontWidget(text: formatter,
                //"Thursday, March 06 2023",
                 fontsize: 13),
                  FutureBuilder(
                                future: FirebaseFirestore.instance
                                    .collection('SchoolListCollection')
                                    .doc(UserCredentialsController.schoolId)
                                    .collection(
                                        UserCredentialsController.batchId!)
                                    .doc(UserCredentialsController.batchId)
                                    .collection('classes')
                                    .doc(UserCredentialsController.classId)
                                    .get(),
                                builder: (context, snaps) {
                                  if (snaps.hasData) {
                                    return GoogleFirasansWidgets(
                                      text:
                                          'Class : ${snaps.data!.data()!['className']}',
                                      fontsize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: cBlack,
                                    );
                                  } else {
                                    return const Text('');
                                  }
                                }),
              ],
            ),
          ),
        ],
      ),
    ),
  ),
  const StudentsAttendanceGraphView(),
];
