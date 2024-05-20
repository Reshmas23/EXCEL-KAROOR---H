import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/class_controller/class_controller.dart';
import 'package:vidyaveechi_website/model/class_model/class_model.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/registration_users/student/class_dataList.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/registration_users/student/class_wise_studentList.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/students/student_details/widgets/category_tableHeader.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';
import 'package:vidyaveechi_website/view/widgets/loading_widget/loading_widget.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';
import 'package:vidyaveechi_website/view/widgets/routeSelectedTextContainer/routeSelectedTextContainer.dart';

class AllClassListContainer extends StatelessWidget {
  final ClassController classController = Get.put(ClassController());

  AllClassListContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => classController.ontapClassStudents.value == true
          ? AllClassStudentListContainer()
          : SingleChildScrollView(
              scrollDirection: ResponsiveWebSite.isMobile(context)
                  ? Axis.horizontal
                  : Axis.vertical,
              child: Container(
                color: screenContainerbackgroundColor,
                height: 600,
                width: ResponsiveWebSite.isDesktop(context)
                    ? double.infinity
                    : 1200,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TextFontWidget(
                        text: 'All Class  List 📃',
                        fontsize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      Row(
                        children: [
                          // const RouteSelectedTextContainer(
                          //     width: 150, title: 'All Teacher'),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {},
                            child: const RouteSelectedTextContainer(
                                title: 'Edit Deatils'),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
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
                                      flex: 3,
                                      child: CatrgoryTableHeaderWidget(
                                          headerTitle: 'Class Name')),
                                  SizedBox(
                                    width: 01,
                                  ),
                                  Expanded(
                                      flex: 2,
                                      child: CatrgoryTableHeaderWidget(
                                          headerTitle: 'Class ID')),
                                  SizedBox(
                                    width: 01,
                                  ),
                                  Expanded(
                                      flex: 3,
                                      child: CatrgoryTableHeaderWidget(
                                          headerTitle: 'Class Teacher')),
                                  SizedBox(
                                    width: 02,
                                  ),
                                  Expanded(
                                      flex: 2,
                                      child: CatrgoryTableHeaderWidget(
                                          headerTitle: 'Total Students')),
                                  SizedBox(
                                    width: 02,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 400,
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
                                  .collection('classes')
                                  .snapshots(),
                              builder: (context, snaPS) {
                                if (snaPS.hasData) {
                                  return ListView.separated(
                                      itemBuilder: (context, index) {
                                        final data = ClassModel.fromMap(
                                            snaPS.data!.docs[index].data());
                                        return GestureDetector(
                                          onTap: () {
                                            classController.ontapClassStudents.value = true;
                                            // teacherController
                                            // //     .teacherModelData.value = data;
                                            // teacherController
                                            //     .ontapviewteacher.value = true;
                                          },
                                          child: AllClassDataList(
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
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
