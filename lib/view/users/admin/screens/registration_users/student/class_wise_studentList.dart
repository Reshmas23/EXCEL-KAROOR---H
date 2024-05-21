import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/admin_section/student_controller/student_controller.dart';
import 'package:vidyaveechi_website/excel_File_Controller/excel_fileController.dart';
import 'package:vidyaveechi_website/model/student_model/student_model.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/registration_users/student/student_dataList.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/students/create_student/create_newStudent.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/students/student_details/widgets/category_tableHeader.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/teacher/teachers_details/teachers_details.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';
import 'package:vidyaveechi_website/view/widgets/loading_widget/loading_widget.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';
import 'package:vidyaveechi_website/view/widgets/routeSelectedTextContainer/routeSelectedTextContainer.dart';
import 'package:vidyaveechi_website/view/widgets/routeSelectedTextContainer/route_NonSelectedContainer.dart';

class AllClassStudentListContainer extends StatelessWidget {
  final StudentController studentController = Get.put(StudentController());
  final ExcelFileController excelController = Get.put(ExcelFileController());
  AllClassStudentListContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => studentController.ontapStudent.value == true
          ? TeachersDetailsContainer()
          : studentController.ontapCreateStudent.value == true
                ? CreateStudent()
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
                        text: 'All Class Student List 📃',
                        fontsize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                       GestureDetector(
                                onTap: () {
                                  
                                  // print(studentController
                                  //     .ontapCreateStudent.value);
                                },
                                child: const RouteNonSelectedTextContainer(
                                    title: 'Home'),
                              ),
                      // Row(
                      //   children: [
                      //     // const RouteSelectedTextContainer(
                      //     //     width: 150, title: 'All Teacher'),
                      //     const Spacer(),
                      //     studentController.teacherEditDetail.value == true
                      //         ? Row(
                      //             children: [
                      //               const RouteSelectedTextContainer(
                      //                   title: 'Ready to Edit now !'),
                      //               Checkbox(
                      //                 checkColor: cWhite,
                      //                 activeColor: cgreen,
                      //                 value: true,
                      //                 onChanged: (value) {
                      //                   studentController
                      //                       .teacherEditDetail.value = false;
                      //                 },
                      //               ),
                      //             ],
                      //           )
                      //         : GestureDetector(
                      //             onTap: () {
                      //               studentController.teacherEditDetail.value =
                      //                   true;
                      //             },
                      //             child: const RouteSelectedTextContainer(
                      //                 title: 'Edit Deatils'),
                      //           )
                      //   ],
                      // ),
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
                                  .collection(
                                      UserCredentialsController.batchId!)
                                  .doc(UserCredentialsController.batchId)
                                  .collection('classes')
                                  .doc()
                                  .collection('Teachers')
                                  .snapshots(),
                              builder: (context, snaPS) {
                                if (snaPS.hasData) {
                                  return ListView.separated(
                                      itemBuilder: (context, index) {
                                        final data = StudentModel.fromMap(
                                            snaPS.data!.docs[index].data());
                                        return GestureDetector(
                                          onTap: () {
                                            // studentController
                                            //     .teacherModelData.value = data;
                                            studentController
                                                .ontapStudent.value = true;
                                          },
                                          child: AllClassStudentDataList(
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
                              studentController.ontapCreateStudent.value =
                                        true;
                           //   studentController.ontapCreateStudent.value == true;
                             // createTeacherFunction(context, 'Teacher');
                            },
                            child: const SizedBox(
                              height: 30,
                              child: RouteSelectedTextContainer(
                                  title: 'Create Student'),
                            ),
                          )
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
