import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/class_controller/class_controller.dart';
import 'package:vidyaveechi_website/controller/exam_result_controller/exam_result_controller.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/constant/constant.validate.dart';
import 'package:vidyaveechi_website/view/drop_down/exam_wise_subject.dart';
import 'package:vidyaveechi_website/view/drop_down/select_class_exam.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/class/class_details/widgets/exam_dataList.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/students/student_details/widgets/category_tableHeader.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/students/student_details/widgets/category_tile_container.dart';


class ExamHistory extends StatelessWidget {
  ExamHistory({
    super.key,
  });

  final examCtrl = Get.put(ExamResultController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40,
          width: 1200,
          color: themeColorBlue.withOpacity(0.1),
          child:  Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFontWidget(
              text: 'Exams section',
              fontsize: 16,
              fontWeight: FontWeight.bold,
              color: themeColorBlue,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
               Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextFontWidget(
                        text: "Select Exam  :  ",
                        fontsize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  )),
              Expanded(
                flex: 2,
                child: SelectClassExamDropDown(
                    classId: Get.find<ClassController>()
                        .classModelData
                        .value!
                        .docid),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
               Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextFontWidget(
                        text: "Select Subject  :  ",
                        fontsize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  )),
              Expanded(
                flex: 2,
                child: SelectExamWiseSubjectDropDown(),
              ),
            ],
          ),
        ),
        sh10,
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Obx(
                () => StudentCategoryTileContainer(
                    title: 'No.of Student Passed',
                    subTitle: examCtrl.numberExamPassed.value.toString(),
                    color: const Color.fromARGB(255, 121, 240, 125)),
              ),
              Obx(
                () => StudentCategoryTileContainer(
                    title: 'No.of Student Failed',
                    subTitle: examCtrl.numberExamFailed.value.toString(),
                    color: const Color.fromARGB(255, 234, 102, 92)),
              ),
              Obx(
                () => StudentCategoryTileContainer(
                    title: 'No.of Student Attended',
                    subTitle: examCtrl.numberExamConducted.value.toString(),
                    color: const Color.fromARGB(255, 121, 123, 240)),
              )
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
                          child: CatrgoryTableHeaderColorWidget(
                              color: themeColorBlue,
                              textcolor: cWhite,
                              headerTitle: 'No')),
                      SizedBox(
                        width: 02,
                      ),
                      Expanded(
                          flex: 1,
                          child: CatrgoryTableHeaderColorWidget(
                              color: themeColorBlue,
                              textcolor: cWhite,
                              headerTitle: 'Date/Day')),
                      SizedBox(
                        width: 02,
                      ),
                      Expanded(
                          flex: 5,
                          child: CatrgoryTableHeaderColorWidget(
                              color: themeColorBlue,
                              textcolor: cWhite,
                              headerTitle: 'Exam Subjects')),
                      SizedBox(
                        width: 02,
                      ),
                      Expanded(
                          flex: 1,
                          child: CatrgoryTableHeaderColorWidget(
                              color: themeColorBlue,
                              textcolor: cWhite,
                              headerTitle: 'Mark')),
                      SizedBox(
                        width: 02,
                      ),
                      Expanded(
                          flex: 1,
                          child: CatrgoryTableHeaderColorWidget(
                              color: themeColorBlue,
                              textcolor: cWhite,
                              headerTitle: 'Grade')),
                      SizedBox(
                        width: 02,
                      ),
                      Expanded(
                          flex: 1,
                          child: CatrgoryTableHeaderColorWidget(
                              color: themeColorBlue,
                              textcolor: cWhite,
                              headerTitle: 'Pass mark')),
                      SizedBox(
                        width: 02,
                      ),
                      Expanded(
                          flex: 1,
                          child: CatrgoryTableHeaderColorWidget(
                              color: themeColorBlue,
                              textcolor: cWhite,
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
                  () => ListView.separated(
                      itemBuilder: (context, index) {
                        final data = examCtrl.studentMarkList[index];
                        return Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: ClassExameDataListContainer(
                            index: index,
                            data: data,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 02,
                        );
                      },
                      itemCount: examCtrl.studentMarkList.length),
                )),
              ),
            ],
          ),
        )
      ],
    );
  }
}
