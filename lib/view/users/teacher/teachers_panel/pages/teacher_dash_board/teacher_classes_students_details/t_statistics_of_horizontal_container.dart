import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';

import 'teacher_classes_students_details.dart';

class TStatisticsOfHorizontalContainer extends StatelessWidget {
  const TStatisticsOfHorizontalContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('SchoolListCollection')
                .doc(UserCredentialsController.schoolId)
                .collection('classes')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                print(snapshot.data?.docs.length);
              } else {
                return TeacherClassesStudentsDetails(
                  categorytext: 'Total Classes',
                  ////  currentcount: "04",
                  totalcount: " ${snapshot.data?.docs.length}",
                  imagepath: "webassets/png/roll-call.png",
                );
              }
              return const Text('No data found');
            }),
        const SizedBox(
          width: 10,
        ),
        const TeacherClassesStudentsDetails(
          categorytext: 'Total Students',
          // currentcount: "40",
          totalcount: "60",
          imagepath: "webassets/png/graduating-student.png",
        ),
        const SizedBox(
          width: 10,
        ),
        // TeacherClassesStudentsDetails(
        //   categorytext: 'Total Lessons',
        //   currentcount: "30",
        //   totalcount: "50",
        //   imagepath: "webassets/png/exam_studenttest.png",
        // ),
        // SizedBox(
        //   width: 10,
        // ),
        // TeacherClassesStudentsDetails(
        //   categorytext: 'Total Hours',
        //   currentcount: "15",
        //   totalcount: "20",
        //   imagepath: "webassets/png/tick.png",
        // ),
      ],
    );
  }
}
