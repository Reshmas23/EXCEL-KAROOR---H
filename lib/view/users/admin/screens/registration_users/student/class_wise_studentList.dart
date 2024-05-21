import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/admin_section/student_controller/student_controller.dart';
import 'package:vidyaveechi_website/controller/class_controller/class_controller.dart';
import 'package:vidyaveechi_website/excel_File_Controller/excel_fileController.dart';
import 'package:vidyaveechi_website/model/student_model/student_model.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/registration_users/student/student_dataList.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/students/student_details/student_details.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/students/student_details/widgets/category_tableHeader.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';
import 'package:vidyaveechi_website/view/widgets/loading_widget/loading_widget.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';
import 'package:vidyaveechi_website/view/widgets/routeSelectedTextContainer/routeSelectedTextContainer.dart';
import 'package:vidyaveechi_website/view/widgets/routeSelectedTextContainer/route_NonSelectedContainer.dart';

class AllClassStudentListContainer extends StatelessWidget {
   AllClassStudentListContainer({super.key});
  final StudentController studentController = Get.put(StudentController());
  final ExcelFileController excelController = Get.put(ExcelFileController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => Get.find<ClassController>().ontapStudentsDetail.value ==
            true
        ? StudentDetailsContainer()
        : SingleChildScrollView(
            scrollDirection: ResponsiveWebSite.isMobile(context)
                ? Axis.horizontal
                : Axis.vertical,
            child: Container(
              color: screenContainerbackgroundColor,
              height: 600,
              width:
                  ResponsiveWebSite.isDesktop(context) ? double.infinity : 1200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.find<ClassController>().ontapClassStudents.value =
                          false;
                    },
                    child: const SizedBox(
                      height: 35,
                      width: 100,
                      child: Padding(
                        padding: EdgeInsets.only(top: 05, left: 05),
                        child: RouteNonSelectedTextContainer(
                          title: 'Back',
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10, right: 20, left: 20),
                    child: TextFontWidget(
                      text: 'All Class Student List 📃',
                      fontsize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // Row(
                  //   children: [
                  //     // const RouteSelectedTextContainer(
                  //     //     wid)th: 150, title: 'All Teacher'),
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
                              .collection(UserCredentialsController.batchId!)
                              .doc(UserCredentialsController.batchId)
                              .collection('classes')
                              .doc(Get.find<ClassController>()
                                  .ontapClassDocID
                                  .value)
                              .collection('Students')
                              .snapshots(),
                          builder: (context, snaPS) {
                            if (snaPS.hasData) {
                              return snaPS.data!.docs.isEmpty
                                  ? const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: TextFontWidget(
                                          text:
                                              "There is no students in this classs ☹️\nPlease add students 🥳 !!.",
                                          fontsize: 14),
                                    )
                                  : ListView.separated(
                                      itemBuilder: (context, index) {
                                        final data = StudentModel.fromMap(
                                            snaPS.data!.docs[index].data());
                                        return GestureDetector(
                                          onTap: () {
                                            studentController.studentModelData.value=data;
                              
                                           Get.find<ClassController>().ontapStudentsDetail.value = true;
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
                            Get.find<ClassController>().ontapStudentCreation.value=true;
                      
                          },
                          child: const SizedBox(
                            height: 30,
                            child: RouteSelectedTextContainer(
                                title: 'Create Student'),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 20),
                        child: GestureDetector(
                          onTap: () async {
                         await   excelController.pickExcelForStudent();
                          },
                          child: const SizedBox(
                            height: 30,
                            child: RouteSelectedTextContainer(
                                title: 'Upload Excel 📃'),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 20),
                        child: GestureDetector(
                          onTap: () async {
                            // await excelController.pickExcelForTeachers(
                            //     userCollection: 'Teachers',
                            //     userRole: 'teacher');
                          },
                          child: const SizedBox(
                            height: 30,
                            child: RouteSelectedTextContainer(
                                title: 'Upload From Web Data'),
                          ),
                        ),
                      ),
                    ],
                  ))
                ],
              ),
            ),
          ));
  }
}
