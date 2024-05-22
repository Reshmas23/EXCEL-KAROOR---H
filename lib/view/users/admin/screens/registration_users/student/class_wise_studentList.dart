import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' hide Column,Row,Border;
import 'package:vidyaveechi_website/controller/admin_section/student_controller/student_controller.dart';
import 'package:vidyaveechi_website/controller/class_controller/class_controller.dart';
import 'package:vidyaveechi_website/controller/registration_controller/registation_controller.dart';
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
  final ClassController classController = Get.put(ClassController());
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
                   Padding(
                     padding: const EdgeInsets.only(top: 10,left: 20),
                     child: TextFontWidget(text:'Class Name : ${classController. ontapClassName.toString()}',
                     // classController.classModelData.value?.className??'', 
                     fontsize: 15,fontWeight: FontWeight.bold,),
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
                                            studentController
                                                .studentModelData.value = data;

                                            Get.find<ClassController>()
                                                .ontapStudentsDetail
                                                .value = true;
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
                            Get.find<ClassController>()
                                .ontapStudentCreation
                                .value = true;
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
                            await excelController.pickExcelForStudent();
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
                          child: GestureDetector(
                            onTap: () async{
                              await generateExcel();
                            },
                            child: const SizedBox(
                              height: 30,
                              child: RouteSelectedTextContainer(
                                  title: 'Download From Web Data'),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 20),
                        child: GestureDetector(
                          onTap: () async {
                            showReportMenu(context);
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
          ));
  }
    Future<void> saveAndLaunchFile(List<int> bytes, String fileName) async {
    final blob = Blob([Uint8List.fromList(bytes)]);
    final url = Url.createObjectUrlFromBlob(blob);
    AnchorElement(href: url)
      ..target = 'webbrowser'
      ..download = fileName
      ..click();
    Url.revokeObjectUrl(url);
  }

  Future<void> generateExcel() async {
    final RegistrationController excelcontroller = Get.put(RegistrationController());
    

    // Fetch all users
    final List<StudentModel> users = await excelcontroller.fetchStudentData();

    // Debug: Print fetched users
    print('Fetched users: ${users.length}');
    for (var user in users) {
      print('User: ${user.studentName}, Class: ${user.classId}');
    }

    // Group users by class
    Map<String, List<StudentModel>> usersByClass = {};
    for (var user in users) {
      if (!usersByClass.containsKey(user.nameofClass)) {
        usersByClass[user.nameofClass] = [];
      }
      usersByClass[user.nameofClass]!.add(user);
    }

    // Debug: Print grouped users by class
    usersByClass.forEach((nameofClass, users) {
      print('Class: $nameofClass, Students: ${users.length}');
    });

    // Create Excel files for each class
    for (var entry in usersByClass.entries) {
      final nameofClass = entry.key;
      final classUsers = entry.value;

      // Debug: Print class details before creating Excel
      print('Creating Excel for Class: $nameofClass with ${classUsers.length} students');

      // Creating a workbook.
      final Workbook workbook = Workbook();
      // Accessing via index
      final Worksheet sheet = workbook.worksheets[0];
      sheet.showGridlines = true;

      // Enable calculation for worksheet.
      sheet.enableSheetCalculations();

      sheet.getRangeByName('A1').setText('Admission Number');
      sheet.getRangeByName('B1').setText('Student Name');
     
      sheet.getRangeByName('C1').setText('Gender');
       sheet.getRangeByName('D1').setText('Parent Phone Number(10 digit)');
      
      // sheet.getRangeByName('E1').setText('Parent Name');

      for (int i = 0; i < classUsers.length; i++) {
        sheet.getRangeByIndex(i + 2, 1).setText(classUsers[i].admissionNumber);
        sheet.getRangeByIndex(i + 2, 2).setText(classUsers[i].studentName);
          sheet.getRangeByIndex(i + 2, 3).setText(classUsers[i].gender);
        sheet.getRangeByIndex(i + 2, 4).setText(classUsers[i].parentPhoneNumber);
       
       
        // sheet.getRangeByIndex(i + 2, 5).setText(classUsers[i].nameofParent);
      }

      // Save and launch the excel.
      final List<int> bytes = workbook.saveAsStream();
      // Dispose the document.
      workbook.dispose();

      // Save and launch the file.
      await saveAndLaunchFile(bytes, '$nameofClass.xlsx');
    }

    // Debug: Completed
    print('Excel generation completed.');
}

  void showReportMenu(BuildContext context) {
    showMenu(
        context: context,
        position: const RelativeRect.fromLTRB(150, double.infinity, 115, 10),
        items: [
          PopupMenuItem(
              child: GestureDetector(
            onTap: () async{
              Get.back();
              await excelController.getAllStudentCredentialsReport();
            }
                ,
            child: const SizedBox(
              height: 30,
              child: RouteSelectedTextContainer(
                  title: 'Get All Students Report 📃'),
            ),
          )),
          PopupMenuItem(
              child: GestureDetector(
            onTap: () async {
                     Get.back();
                await excelController.getClassWiseStudentCredentialsReport();

            },
            child: SizedBox(
              height: 30,
              child: RouteSelectedTextContainer(
                  title:
                      'Get ${Get.find<ClassController>().ontapClassName.value} Students Report 📃'),
            ),
          )),
        ],
        elevation: 1.0);
  }
}
