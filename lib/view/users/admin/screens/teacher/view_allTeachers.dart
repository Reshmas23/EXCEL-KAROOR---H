import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/admin_section/teacher_controller/teacher_controller.dart';
import 'package:vidyaveechi_website/model/teacher_model/teacher_model.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/students/student_details/widgets/category_tableHeader.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/teacher/list_of_teacher/table_of_tr.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/teacher/teachers_details/teachers_details.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';
import 'package:vidyaveechi_website/view/widgets/loading_widget/loading_widget.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';
import 'package:vidyaveechi_website/view/widgets/routeSelectedTextContainer/routeSelectedTextContainer.dart';

class AllTeacherListContainer extends StatelessWidget {
  final TeacherController teacherController = Get.put(TeacherController());
  AllTeacherListContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => teacherController.ontapviewteacher.value == true
          ? TeachersDetailsContainer()
          // : teacherController.ontapTeacher.value == true
          //     ? CreateTeacher()
          : SingleChildScrollView(
              scrollDirection: ResponsiveWebSite.isMobile(context)
                  ? Axis.horizontal
                  : Axis.vertical,
              child: Container(
                color: screenContainerbackgroundColor,
                height: 700,
                width: ResponsiveWebSite.isDesktop(context)
                    ? double.infinity
                    : 1200,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TextFontWidget(
                        text: 'All Teachers List',
                        fontsize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Row(
                        children: [
                          RouteSelectedTextContainer(
                              width: 150, title: 'All Teachers'),
                          Spacer(),
                          // GestureDetector(
                          //   onTap: () {
                          //     teacherController.ontapTeacher.value = true;
                          //   },
                          //   child: GestureDetector(
                          //     onTap: () {
                          //    // createTeacherFunction(context,'');
                          //     },
                          //     child: ButtonContainerWidget(
                          //         curving: 30,
                          //         colorindex: 0,
                          //         height: 35,
                          //         width: 150,
                          //         child: const Center(
                          //           child: TextFontWidgetRouter(
                          //             text: 'Create New Teacher',
                          //             fontsize: 12,
                          //             fontWeight: FontWeight.bold,
                          //             color: cWhite,
                          //           ),
                          //         )),
                          //   ),
                          // )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        color: cWhite,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: Container(
                            color: cWhite,
                            height: 40,
                            child: const Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: CatrgoryTableHeaderWidget(
                                        headerTitle: 'No')),
                                SizedBox(
                                  width: 01,
                                ),
                                Expanded(
                                    flex: 2,
                                    child: CatrgoryTableHeaderWidget(
                                        headerTitle: 'ID')),
                                SizedBox(
                                  width: 01,
                                ),
                                Expanded(
                                    flex: 2,
                                    child: CatrgoryTableHeaderWidget(
                                        headerTitle: 'Card ID')),
                                SizedBox(
                                  width: 01,
                                ),
                                Expanded(
                                    flex: 4,
                                    child: CatrgoryTableHeaderWidget(
                                        headerTitle: 'Name')),
                                SizedBox(
                                  width: 02,
                                ),
                                Expanded(
                                    flex: 4,
                                    child: CatrgoryTableHeaderWidget(
                                        headerTitle: 'E mail')),
                                SizedBox(
                                  width: 02,
                                ),
                                Expanded(
                                    flex: 3,
                                    child: CatrgoryTableHeaderWidget(
                                        headerTitle: 'Ph.No')),
                                SizedBox(
                                  width: 02,
                                ),
                                Expanded(
                                    flex: 3,
                                    child: CatrgoryTableHeaderWidget(
                                        headerTitle: 'Status')),
                                SizedBox(
                                  width: 02,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          // width: 1200,
                          decoration: BoxDecoration(
                            color: cWhite,
                            border: Border.all(color: cWhite),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5, right: 5),
                            child: SizedBox(
                              // width: 1100,
                              child: StreamBuilder(
                                stream: server
                                    .collection('SchoolListCollection')
                                    .doc(UserCredentialsController.schoolId)
                                    .collection('Teachers')
                                    .snapshots(),
                                builder: (context, snaPS) {
                                  //  if (!snaPS.hasData || snaPS.data!.docs.isEmpty) {
                                  //     return const Center(
                                  //         child: Text(
                                  //       'No Teachers Added',
                                  //       style: TextStyle(
                                  //           fontSize: 15, fontWeight: FontWeight.w500),
                                  //     ));
                                  //   }
                                  if (snaPS.hasData) {
                                    return snaPS.data!.docs.isEmpty
                                        ? const Center(
                                            child: Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                                "Please create Teacher",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                          )
                                        : ListView.separated(
                                            itemBuilder: (context, index) {
                                              final data = TeacherModel.fromMap(
                                                  snaPS.data!.docs[index]
                                                      .data());
                                              return GestureDetector(
                                                onTap: () {
                                                  teacherController
                                                      .teacherModelData
                                                      .value = data;
                                                  teacherController
                                                      .ontapviewteacher
                                                      .value = true;
                                                },
                                                child: AllTeachersDataList(
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
                                            itemCount: snaPS.data!.docs.length);
                                  } else {
                                    return const LoadingWidget();
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
