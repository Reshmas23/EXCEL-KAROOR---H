import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/exam_notification/exam_notification.dart';
import 'package:vidyaveechi_website/model/exam_notification/exam_notification.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/constant/constant.validate.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/exam_notification/create_exam.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/exam_notification/exam_functions_n_list/data_list_exam.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/exam_notification/widget/widget.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/students/student_details/widgets/category_tableHeader.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';
import 'package:vidyaveechi_website/view/widgets/button_container/button_container.dart';
import 'package:vidyaveechi_website/view/widgets/routeSelectedTextContainer/routeSelectedTextContainer.dart';

class AllExamNotificationListView extends StatelessWidget {
  AllExamNotificationListView({super.key});
  final getExamNotificationCtr = Get.put(ExamNotificationController());
  final GlobalKey<FormState> fkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        color: screenContainerbackgroundColor,
        height: 650,
        width: 1000,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               const Padding(
                padding: EdgeInsets.only(left: 25, top: 25),
                child: SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: TextFontWidget(
                    text: 'All Exams List',
                    fontsize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20, left: 15, right: 15),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 05, right: 05),
                      child: RouteSelectedTextContainer(title: 'All Exams'),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        createExamNotificationFunction(context);
                      },
                      child: ButtonContainerWidget(
                          curving: 30,
                          colorindex: 0,
                          height: 40,
                          width: 180,
                          child: const Center(
                            child: TextFontWidgetRouter(
                              text: 'Create / E D I T',
                              fontsize: 14,
                              fontWeight: FontWeight.bold,
                              color: cWhite,
                            ),
                          )),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: SizedBox(
                  // color: cWhite,
                  width: 1200,
                  child: Row(
                    children: [
                      Expanded(flex: 1, child: CatrgoryTableHeaderWidget(headerTitle: 'No')),
                      SizedBox(
                        width: 01,
                      ),
                      Expanded(flex: 4, child: CatrgoryTableHeaderWidget(headerTitle: 'Exam Name')),
                      SizedBox(
                        width: 01,
                      ),
                      Expanded(
                          flex: 2, child: CatrgoryTableHeaderWidget(headerTitle: 'Total Days')),
                      SizedBox(
                        width: 01,
                      ),
                      Expanded(flex: 3, child: CatrgoryTableHeaderWidget(headerTitle: 'Starting')),
                      SizedBox(
                        width: 01,
                      ),
                      Expanded(flex: 1, child: CatrgoryTableHeaderWidget(headerTitle: 'Ending')),
                      SizedBox(
                        width: 01,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  width: 1200,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: StreamBuilder(
                      stream: server
                          .collection('SchoolListCollection')
                          .doc(UserCredentialsController.schoolId)
                          .collection(UserCredentialsController.batchId!)
                          .doc(UserCredentialsController.batchId!)
                          .collection('ExamNotification')
                          .snapshots(),
                      builder: (context, snaps) {
                        if (snaps.hasData) {
                          if (snaps.data!.docs.isEmpty) {
                            return  const Center(
                              child: TextFontWidget(
                                  text: "No exam found, add new exams", fontsize: 12.5),
                            );
                          } else {
                            return ListView.separated(
                                itemBuilder: (context, index) {
                                  final data =
                                      ExamNotificationModel.fromMap(snaps.data!.docs[index].data());
                                  return
                                      // GestureDetector(
                                      //   onTap: () => classController
                                      //       .ontapClass.value = true,
                                      //   child:
                                      InkWell(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          getExamNotificationCtr.startDateCtr.text = '';
                                          getExamNotificationCtr.endDateCtr.text = '';
                                          getExamNotificationCtr.startTimeCtr.text = '';
                                          getExamNotificationCtr.endTimeCtr.text = '';
                                          return ExamTimeTableAddWidget(
                                              examId: data.docId,
                                              size: size,
                                              getExamNotificationCtr: getExamNotificationCtr);
                                        },
                                      );
                                    },
                                    child: ExamNotificationDataListWidget(
                                      data: data,
                                      index: index,
                                      //   ),
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return const SizedBox(
                                    height: 02,
                                  );
                                },
                                itemCount: snaps.data!.docs.length);
                          } //
                        } else {
                          return circularProgressIndicator;
                        }
                      },
                    ),
                  ), //
                ),
              ), /////////////////////////////////////
            ],
          ),
        ),
      ),
      //  ),
    );
  }
}
