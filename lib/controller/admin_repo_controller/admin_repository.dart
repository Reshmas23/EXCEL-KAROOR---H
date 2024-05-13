import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';

class AdminRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Map<String, int>> getSchoolAllStudentsCount() async {
    try {
      Map<String, int> allStudentsData = {};
      int male = 0;
      int female = 0;
      final classCollection = await _firestore
          .collection('SchoolListCollection')
          .doc(UserCredentialsController.schoolId)
          .collection(UserCredentialsController.batchId!)
          .doc(UserCredentialsController.batchId!)
          .collection('classes')
          .get();

      for (var classElement in classCollection.docs) {
        final studentCollection = await _firestore
            .collection('SchoolListCollection')
            .doc(UserCredentialsController.schoolId)
            .collection(UserCredentialsController.batchId!)
            .doc(UserCredentialsController.batchId!)
            .collection('classes')
            .doc(classElement.data()['docid'])
            .collection('Students')
            .get();
        for (var element in studentCollection.docs) {
          if (element.data()["gender"] == "Female") {
            female = female + 1;
          }
          if (element.data()["gender"] == "Male") {
            male = male + 1;
          }
        }
      }

      int total = male + female;
      allStudentsData = {"male": male, "female": female, "total": total};

      return allStudentsData;
    } catch (e) {
      log(e.toString(),
          name: 'AttendanceRepository - getSchoolAllStudentsCount');
      return {};
    }
  }

  Future<int> getSchoolAllParentsCount() async {
    try {
      int count = 0;
      final allClass = await _firestore
          .collection('SchoolListCollection')
          .doc(UserCredentialsController.schoolId)
          .collection(UserCredentialsController.batchId!)
          .doc(UserCredentialsController.batchId!)
          .collection('classes')
          .get();
      for (var element in allClass.docs) {
        final students = await _firestore
            .collection('SchoolListCollection')
            .doc(UserCredentialsController.schoolId)
            .collection(UserCredentialsController.batchId!)
            .doc(UserCredentialsController.batchId!)
            .collection('classes')
            .doc(element.data()["docid"])
            .collection('Parents')
            .get();
        count = count + students.docs.length;
      }
      return count;
    } catch (e) {
      log(e.toString(),
          name: 'AttendanceRepository - getSchoolAllStudentsCount');
      return 0;
    }
  }

  Future<int> getSchoolAllTeachersCount() async {
    try {
      final studentsCount = await _firestore
          .collection('SchoolListCollection')
          .doc(UserCredentialsController.schoolId)
          .collection('Teachers')
          .get();
      return studentsCount.docs.length;
    } catch (e) {
      log(e.toString(),
          name: 'AttendanceRepository - getSchoolAllStudentsCount');
      return 0;
    }
  }

  Future<int> getSchoolAllStaffsCount() async {
    try {
      final studentsCount = await _firestore
          .collection('SchoolListCollection')
          .doc(UserCredentialsController.schoolId)
          .collection('NonTeachingStaffs')
          .get();
      return studentsCount.docs.length;
    } catch (e) {
      log(e.toString(),
          name: 'AttendanceRepository - getSchoolAllStudentsCount');
      return 0;
    }
  }

//this calculation fetch students attendance data with second period same day
  Future<Map<String, int>> attendancePercentage() async {
    int present = 0;
    int absent = 0;

    String monthCollectionName = monthTimeStampConvertor();
    String dateCollectionName = dateTimeStampConvertor();

    try {
      final schoolDoc = _firestore
          .collection('SchoolListCollection')
          .doc(UserCredentialsController.schoolId);
      final classesDoc = schoolDoc.collection(UserCredentialsController.batchId!);

      final allClass = await classesDoc
          .doc(UserCredentialsController.batchId!)
          .collection('classes')
          .get();

      for (var classDoc in allClass.docs) {
        final attendanceDoc = classesDoc
            .doc(UserCredentialsController.batchId!)
            .collection('classes')
            .doc(classDoc.data()['docid'])
            .collection('Attendence')
            .doc(monthCollectionName)
            .collection(monthCollectionName)
            .doc(dateCollectionName)
            .collection('Subjects');

        final allSubjects = await attendanceDoc.get();

        if (allSubjects.docs.isNotEmpty) {
          final presentList = await attendanceDoc
              .doc(allSubjects.docs[0].data()[
                  'docid']) //there is lot subjects so taken first period subject attendance as main attendance
              .collection('AttendenceList')
              .get();
          for (var presentElement in presentList.docs) {
            if (presentElement.data()['present']) {
              present++;
            } else {
              absent++;
            }
          }
        }
      }
      final Map<String, int> attendanceMap = <String, int>{
        "present": present,
        "absent": absent,
        "total": present + absent
      };
      return attendanceMap;
    } catch (e) {
      log(e.toString(), name: 'AttendanceRepository - attendancePercentage');
      return {};
    }
  }

// eg :September-2023
  String monthTimeStampConvertor() {
    int timestamp = DateTime.now().millisecondsSinceEpoch;

    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);

    String formattedMonth = DateFormat('MMMM').format(dateTime);
    String formattedYear = DateFormat('yyyy').format(dateTime);

    return '$formattedMonth-$formattedYear';
  }

  //05-09-2023
  String dateTimeStampConvertor() {
    int timestamp = DateTime.now().millisecondsSinceEpoch;

    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);

    String formattedDate = DateFormat('dd-MM-yyyy').format(dateTime);

    return formattedDate;
  }
}
