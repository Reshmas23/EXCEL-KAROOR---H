import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/admin_section/student_controller/student_controller.dart';
import 'package:vidyaveechi_website/controller/exam_result_controller/exam_result_controller.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/drop_down/select_student_exam.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/students/student_details/widgets/category_tableHeader.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/students/student_details/widgets/category_tile_container.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/students/student_details/widgets/exam_dataList.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';

class PerStudentExamHistory extends StatelessWidget {
  PerStudentExamHistory({
    super.key,
  });

  final StudentController studentController = Get.put(StudentController());
  final examController = Get.put(ExamResultController());

  @override
  Widget build(BuildContext context) {
    final data = studentController.studentModelData.value;
    examController.examId.value = " empty ";

    return Column(
      children: [
        Container(
          height: 40,
          width: 1200,
          color: Colors.blue.withOpacity(0.1),
          child:  const Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFontWidget(
              text: 'Exams section',
              fontsize: 16,
              fontWeight: FontWeight.bold,
              color: cBlue,
            ),
          ),
        ),
        SelectStudentExamDropDown(
            classId: data!.classId, studentId: data.docid),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Obx(
                () => StudentCategoryTileContainer(
                    title: 'No.of Exam Passed',
                    subTitle: '${examController.numberExamPassed}',
                    color: const Color.fromARGB(255, 121, 240, 125)),
              ),
              Obx(
                () => StudentCategoryTileContainer(
                    title: 'No.of Exam Failed',
                    subTitle: '${examController.numberExamFailed}',
                    color: const Color.fromARGB(255, 234, 102, 92)),
              ),
              Obx(() => StudentCategoryTileContainer(
                  title: 'No.of Exam Conducted',
                  subTitle: '${examController.numberExamConducted}',
                  color: const Color.fromARGB(255, 121, 123, 240)))
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
                child: Container(
                  color: cWhite,
                  height: 40,
                  child: const Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: CatrgoryTableHeaderWidget(headerTitle: 'No')),
                      SizedBox(
                        width: 02,
                      ),
                      Expanded(
                          flex: 1,
                          child: CatrgoryTableHeaderWidget(
                              headerTitle: 'Date/Day')),
                      SizedBox(
                        width: 02,
                      ),
                      Expanded(
                          flex: 5,
                          child: CatrgoryTableHeaderWidget(
                              headerTitle: 'Exam Subjects')),
                      SizedBox(
                        width: 02,
                      ),
                      Expanded(
                          flex: 1,
                          child: CatrgoryTableHeaderWidget(
                              headerTitle: 'Obtained Mark')),
                      SizedBox(
                        width: 02,
                      ),
                      Expanded(
                          flex: 1,
                          child: CatrgoryTableHeaderWidget(
                              headerTitle: 'Obtained Grade')),
                      SizedBox(
                        width: 02,
                      ),
                      Expanded(
                          flex: 1,
                          child: CatrgoryTableHeaderWidget(
                              headerTitle: 'Pass Exam')),
                      SizedBox(
                        width: 02,
                      ),
                      Expanded(
                          flex: 1,
                          child: CatrgoryTableHeaderWidget(
                              headerTitle: 'Pass/Fail')),
                      SizedBox(
                        width: 02,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  child: Obx(
                    () => examController.examId.value == ' empty '
                        ?  const Center(
                            child: TextFontWidget(
                                text: "Please select exam", fontsize: 16),
                          )
                        : StreamBuilder(
                            stream: server
                                .collection('SchoolListCollection')
                                .doc(UserCredentialsController.schoolId)
                                .collection(UserCredentialsController.batchId!)
                                .doc(UserCredentialsController.batchId!)
                                .collection('classes')
                                .doc(data.classId)
                                .collection('Students')
                                .doc(data.docid)
                                .collection('Exam Results')
                                .doc(examController.examId.value)
                                .collection('Marks')
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else if (snapshot.data!.docs.isEmpty) {
                                return const Center(
                                  child: TextFontWidget(
                                      text: "No data", fontsize: 16),
                                );
                              } else if (!snapshot.hasData) {
                                return const Center(
                                  child: TextFontWidget(
                                      text: "No data", fontsize: 16),
                                );
                              } else {
                                return ListView.separated(
                                    itemBuilder: (context, index) {
                                      final examSubjectData =
                                          snapshot.data!.docs[index].data();
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: ExameDataListContainer(
                                          index: index,
                                          examSubjectData: examSubjectData,
                                        ),
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return const SizedBox(
                                        height: 02,
                                      );
                                    },
                                    itemCount: snapshot.data!.docs.length);
                              }
                            },
                          ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
