import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/admin_section/teacher_controller/teacher_controller.dart';
import 'package:vidyaveechi_website/excel_File_Controller/excel_fileController.dart';
import 'package:vidyaveechi_website/model/teacher_model/teacher_model.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/students/student_details/widgets/category_tableHeader.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/teacher/create_teacher/create_newteachers.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/teacher/list_of_teacher/table_of_tr.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/teacher/teachers_details/teachers_details.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';
import 'package:vidyaveechi_website/view/widgets/loading_widget/loading_widget.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';
import 'package:vidyaveechi_website/view/widgets/routeSelectedTextContainer/routeSelectedTextContainer.dart';

class AllTeacherRegistrationList extends StatelessWidget {
  final TeacherController teacherController = Get.put(TeacherController());
  final ExcelFileController excelController = Get.put(ExcelFileController());
  AllTeacherRegistrationList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => teacherController.ontapviewteacher.value == true
          ? TeachersDetailsContainer()
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
                        text: 'All Teachers List 📃',
                        fontsize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      Row(
                        children: [
                          // const RouteSelectedTextContainer(
                          //     width: 150, title: 'All Teacher'),
                          const Spacer(),
                          teacherController.teacherEditDetail.value == true
                              ? Row(
                                  children: [
                                    const RouteSelectedTextContainer(
                                        title: 'Ready to Edit now !'),
                                    Checkbox(
                                      checkColor: cWhite,
                                      activeColor: cgreen,
                                      value: true,
                                      onChanged: (value) {
                                        teacherController
                                            .teacherEditDetail.value = false;
                                      },
                                    ),
                                  ],
                                )
                              : GestureDetector(
                                  onTap: () {
                                    teacherController.teacherEditDetail.value =
                                        true;
                                  },
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
                                      flex: 2,
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
                                  .collection('Teachers')
                                  .snapshots(),
                              builder: (context, snaPS) {
                                if (snaPS.hasData) {
                                  return ListView.separated(
                                      itemBuilder: (context, index) {
                                        final data = TeacherModel.fromMap(
                                            snaPS.data!.docs[index].data());
                                        return GestureDetector(
                                          onTap: () {
                                            teacherController
                                                .teacherModelData.value = data;
                                            teacherController
                                                .ontapviewteacher.value = true;
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
                      Expanded(
                          child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 20),
                            child: GestureDetector(
                              onTap: () async {
                                await excelController.pickExcelForTeachers(
                                    userCollection: 'Teachers',
                                    userRole: 'teacher');
                              },
                              child: const SizedBox(
                                height: 30,
                                child: RouteSelectedTextContainer(
                                    title: 'Upload Excel 📃'),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              createTeacherFunction(context, 'Teacher');
                            },
                            child: const SizedBox(
                              height: 30,
                              child: RouteSelectedTextContainer(
                                  title: 'Create Teacher'),
                            ),
                          ),
                             const Padding(
                               padding: EdgeInsets.only(left: 10),
                               child: TextFontWidget(text: "Excel formate should be in .xlsx,.csv", fontsize: 11),
                             ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 20),
                            child: GestureDetector(
                              onTap: () async {
                            await    excelController.getAllTeacherCredentialsReport();
                              },
                              child: const SizedBox(
                                height: 30,
                                child: RouteSelectedTextContainer(
                                    title: 'Get Credentials Report 📃'),
                              ),
                            ),
                          ),
                        ],
                      ))
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
