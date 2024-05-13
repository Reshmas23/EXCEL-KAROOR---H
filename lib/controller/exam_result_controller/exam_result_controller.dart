import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:vidyaveechi_website/controller/class_controller/class_controller.dart';
import 'package:vidyaveechi_website/controller/subject_controller/subject_controller.dart';
import 'package:vidyaveechi_website/model/student_mark_list_model/student_mark_list_model.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';

class ExamResultController extends GetxController {
  RxString noOfExam = ''.obs;

  List<String> examList = [];

  RxInt numberExamConducted = 0.obs;
  RxInt numberExamPassed = 0.obs;
  RxInt numberExamFailed = 0.obs;

  RxList<StudentMarkListModel> studentMarkList = RxList([]);

  RxString examId = '-'.obs;

  void getNumberOfExamConductedSingleStudent(
      {required String studentId,
      required String classId,
      required String examId}) async {
    final firebase = await server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection(UserCredentialsController.batchId!)
        .doc(UserCredentialsController.batchId!)
        .collection('classes')
        .doc(classId)
        .collection('Students')
        .doc(studentId)
        .collection('Exam Results')
        .doc(examId)
        .collection('Marks')
        .get();

    // int numberOfExam = firebase.docs.length;

    numberExamConducted.value = firebase.docs.length;
  }

  void getNumberOfExamPassedSingleStudent(
      {required String studentId,
      required String classId,
      required String examId}) async {
    int count = 0;
    final firebase = await server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection(UserCredentialsController.batchId!)
        .doc(UserCredentialsController.batchId!)
        .collection('classes')
        .doc(classId)
        .collection('Students')
        .doc(studentId)
        .collection('Exam Results')
        .doc(examId)
        .collection('Marks')
        .get();

    for (var element in firebase.docs) {
      if (int.parse(element['obtainedMark']) >=
          int.parse(element['passMark'])) {
        count++;
      }
    }
    numberExamPassed.value = count;
    numberExamFailed.value = firebase.docs.length - count;
  }

  Future<List<String>> fetchExamStudent(
      {required String studentId, required String classId}) async {
    final firebase = await server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection(UserCredentialsController.batchId!)
        .doc(UserCredentialsController.batchId!)
        .collection('classes')
        .doc(classId)
        .collection('Students')
        .doc(studentId)
        .collection('Exam Results')
        .get();

    for (var element in firebase.docs) {
      examList.add(element['docid']);
    }

    // for (var i = 0; i < firebase.docs.length; i++) {
    //   final list =
    //       firebase.docs.map((e) => ClassModel.fromMap(e.data())).toList();
    //   examList.add(list[i]);
    // }
    return examList;
  }

  Future<List<String>> fetchExamClass({required String classId}) async {
    final firebase = await server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection(UserCredentialsController.batchId!)
        .doc(UserCredentialsController.batchId!)
        .collection('classes')
        .doc(classId)
        .collection('Exam Results')
        .get();

    for (var element in firebase.docs) {
      examList.add(element['docid']);
    }
    return examList;
  }

  getNumberOfTotalStudentAttendExamInClass() async {
    final examData = await server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection(UserCredentialsController.batchId!)
        .doc(UserCredentialsController.batchId!)
        .collection('classes')
        .doc(Get.find<ClassController>().classModelData.value!.docid)
        .collection('Exam Results')
        .doc(Get.find<ExamResultController>().examId.value)
        .collection('Subjects')
        .doc(Get.find<SubjectController>().subjectID.value)
        .collection('MarkList')
        .get();
    numberExamConducted.value = examData.docs.length;
  }

  getNumberOfStudentPassedExamInClass() async {
    int count = 0;
    final examData = await server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection(UserCredentialsController.batchId!)
        .doc(UserCredentialsController.batchId!)
        .collection('classes')
        .doc(Get.find<ClassController>().classModelData.value!.docid)
        .collection('Exam Results')
        .doc(Get.find<ExamResultController>().examId.value)
        .collection('Subjects')
        .doc(Get.find<SubjectController>().subjectID.value)
        .collection('MarkList')
        .get();

    for (var element in examData.docs) {
      if (int.parse(element['obtainedMark']) >=
          int.parse(element['passMark'])) {
        count++;
      }
    }
    numberExamPassed.value = count;
    numberExamFailed.value = examData.docs.length - count;
  }

  getClassExamResultList() async {
    final data = await server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection(UserCredentialsController.batchId!)
        .doc(UserCredentialsController.batchId!)
        .collection('classes')
        .doc(Get.find<ClassController>().classModelData.value!.docid)
        .collection('Exam Results')
        .doc(Get.find<ExamResultController>().examId.value)
        .collection('Subjects')
        .doc(Get.find<SubjectController>().subjectID.value)
        .collection('MarkList')
        .get();

    studentMarkList.value = studentMarkList.value =
        data.docs.map((e) => StudentMarkListModel.fromMap(e.data())).toList();
  }
}
