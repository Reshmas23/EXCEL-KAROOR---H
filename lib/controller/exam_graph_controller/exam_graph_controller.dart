import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../view/utils/shared_pref/user_auth/user_credentials.dart';

class ExamStatusController extends GetxController {
  var totalStudents = 0.obs;
  var chartData = <ChartData>[].obs;

  @override
  void onInit() {
    super.onInit();
    getTotalStudentsCount();
    fetchChartData();
  }

   Future<int> getStudentsWrittenExamCount(String examName) async {
    try {
      int total = 0;
      final classCollection = await FirebaseFirestore.instance
          .collection('SchoolListCollection')
          .doc(UserCredentialsController.schoolId)
          .collection(UserCredentialsController.batchId!)
          .doc(UserCredentialsController.batchId!)
          .collection('classes')
          .get();

      for (var classElement in classCollection.docs) {
        final markListCollection = await FirebaseFirestore.instance
            .collection('SchoolListCollection')
            .doc(UserCredentialsController.schoolId)
            .collection(UserCredentialsController.batchId!)
            .doc(UserCredentialsController.batchId!)
            .collection('classes')
            .doc(classElement.data()['docid'])
            .collection('Exam Results')
            .doc(examName)
            .collection('Subjects')
            .get();

        for (var subjectElement in markListCollection.docs) {
          final studentMarkListCollection = await FirebaseFirestore.instance
              .collection('SchoolListCollection')
              .doc(UserCredentialsController.schoolId)
              .collection(UserCredentialsController.batchId!)
              .doc(UserCredentialsController.batchId!)
              .collection('classes')
              .doc(classElement.data()['docid'])
              .collection('Exam Results')
              .doc(examName)
              .collection('Subjects')
              .doc(subjectElement.id)
              .collection('MarkList')
              .get()  ;   
           
     
        for (var studentMark in studentMarkListCollection.docs) {
          final markData = studentMark.data();
          final obtainedMark = markData['obtainedMark'] ?? '0';
          final passMark = markData['passMark'] ?? '0';

          // Convert to numbers
          final obtainedMarkNum = double.tryParse(obtainedMark.toString()) ?? 0;
          final passMarkNum = double.tryParse(passMark.toString()) ?? 0;

          // Debug statements
          print('obtainedMark: $obtainedMarkNum, passMark: $passMarkNum');
          print('obtainedMark type: ${obtainedMarkNum.runtimeType}, passMark type: ${passMarkNum.runtimeType}');

          if (obtainedMarkNum > passMarkNum) {
            total++;
          }
        }
      }
    }
    return total;
  } catch (e) {
    print('Error fetching students written exam count: $e');
    return 0;
  }
}



  Future<void> fetchChartData() async {
    try {
      final examSnapshot = await FirebaseFirestore.instance
          .collection('SchoolListCollection')
          .doc(UserCredentialsController.schoolId)
          .collection(UserCredentialsController.batchId!)
          .doc(UserCredentialsController.batchId!)
          .collection('ExamNotification')
          .get();

      print('Exam notifications fetched: ${examSnapshot.size} exams');

      final List<ChartData> data = await _getChartData(examSnapshot, totalStudents.value);
      chartData.value = data;
    } catch (e) {
      print('Error fetching chart data: $e');
    }
  }

  Future<List<ChartData>> _getChartData(QuerySnapshot examSnapshot, int totalStudents) async {
    List<ChartData> chartData = [];
    for (var doc in examSnapshot.docs) {
      final data = doc.data() as Map<String, dynamic>;
      final examName = data['examName'] ?? '';

      print('Fetching data for exam: $examName');

      final studentsWrittenExamCount = await getStudentsWrittenExamCount(examName);

      chartData.add(ChartData(
        examName,
        studentsWrittenExamCount.toDouble(),
        totalStudents.toDouble(),
      ));
    }
    return chartData;
  }


  Future<int> getTotalStudentsCount() async {
    try {
      int total = 0;
      final classCollection = await FirebaseFirestore.instance
          .collection('SchoolListCollection')
          .doc(UserCredentialsController.schoolId)
          .collection(UserCredentialsController.batchId!)
          .doc(UserCredentialsController.batchId!)
          .collection('classes')
          .get();

      for (var classElement in classCollection.docs) {
        final studentCollection = await FirebaseFirestore.instance
            .collection('SchoolListCollection')
            .doc(UserCredentialsController.schoolId)
            .collection(UserCredentialsController.batchId!)
            .doc(UserCredentialsController.batchId!)
            .collection('classes')
            .doc(classElement.data()['docid'])
            .collection('Students')
            .get();
        total += studentCollection.size;
      }

      return total;
    } catch (e) {
      print('Error fetching total students count: $e');
      return 0;
    }
  }
}

class ChartData {
  ChartData(this.x, this.y, this.y1);
  final String x;
  final double y;
  final double y1;
}
