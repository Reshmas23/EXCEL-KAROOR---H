import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:vidyaveechi_website/controller/exam_graph_controller/exam_graph_controller.dart';

import '../../../../../../utils/shared_pref/user_auth/user_credentials.dart';

class ExamStatusGraph extends StatelessWidget {
  ExamStatusGraph({super.key});

  final ExamStatusController examstsController =
      Get.put(ExamStatusController());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
      future: examstsController.getTotalStudentsCount(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final totalStudents = snapshot.data ?? 0;

        return StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('SchoolListCollection')
              .doc(UserCredentialsController.schoolId)
              .collection(UserCredentialsController.batchId!)
              .doc(UserCredentialsController.batchId!)
              .collection('ExamNotification')
              .snapshots(),
          builder: (context, examSnapshot) {
            if (!examSnapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            return FutureBuilder<List<ChartData>>(
              future: _getChartData(examSnapshot.data!, totalStudents),
              builder: (context, chartDataSnapshot) {
                if (!chartDataSnapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                final chartData = chartDataSnapshot.data!;

                return SfCartesianChart(
                  primaryXAxis: const CategoryAxis(),
                  primaryYAxis: const NumericAxis(
                    decimalPlaces: 4,
                  ),
                  series: <CartesianSeries<dynamic, dynamic>>[
                    LineSeries<ChartData, dynamic>(
                      dataLabelSettings:
                          const DataLabelSettings(isVisible: true),
                      dataSource: chartData,
                      markerSettings: const MarkerSettings(isVisible: true),
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y,
                      color: const Color.fromARGB(255, 255, 170, 1),
                    ),
                    LineSeries<ChartData, dynamic>(
                      dataLabelSettings:
                          const DataLabelSettings(isVisible: true),
                      dataSource: chartData,
                      markerSettings: const MarkerSettings(isVisible: true),
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y1,
                      color: const Color.fromARGB(255, 48, 79, 254),
                    ),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }

  Future<List<ChartData>> _getChartData(
      QuerySnapshot examSnapshot, int totalStudents) async {
    List<ChartData> chartData = [];
    for (var doc in examSnapshot.docs) {
      final data = doc.data() as Map<String, dynamic>;
      final examName = data['examName'] ?? '';

      final studentsWrittenExamCount =
          await examstsController.getStudentsWrittenExamCount(examName);

      chartData.add(ChartData(
        examName,
        studentsWrittenExamCount.toDouble(),
        totalStudents.toDouble(),
      ));
    }
    return chartData;
  }
}

class ChartData {
  ChartData(this.x, this.y, this.y1);
  final String x;
  final double y;
  final double y1;
}
