import 'package:get/get.dart';
import 'package:vidyaveechi_website/model/teacher_model/teacher_model.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';

import '../../view/utils/shared_pref/user_auth/user_credentials.dart';

class TeachersController extends GetxController {
  List<TeacherModel> allTeacherList = [];
  String teacherName = '';
  String teacherId = '';

  Future<List<TeacherModel>> fetchTeacher() async {
    final firebase = await server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection('Teachers')
        .get();

    allTeacherList =
        firebase.docs.map((e) => TeacherModel.fromMap(e.data())).toList();

    // for (var i = 0; i < firebase.docs.length; i++) {
    //   final list =
    //       firebase.docs.map((e) => TeacherModel.fromMap(e.data())).toList();
    //   allclassList.add(list[i]);
    // }
    return allTeacherList;
}
}