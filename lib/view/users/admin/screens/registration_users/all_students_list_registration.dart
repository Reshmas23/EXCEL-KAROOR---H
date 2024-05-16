import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/admin_section/student_controller/student_controller.dart';
import 'package:vidyaveechi_website/controller/class_controller/class_controller.dart';
import 'package:vidyaveechi_website/controller/registration_controller/registation_controller.dart';
import 'package:vidyaveechi_website/model/student_model/student_model.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/registration_users/widget_class_students_list.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/students/create_student/create_newStudent.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/students/create_student/registrationStudents.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/students/search_students/search_studentID.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/students/search_students/search_studentName.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/students/student_details/student_details.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/students/student_details/widgets/category_tableHeader.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';
import 'package:vidyaveechi_website/view/widgets/button_container/button_container.dart';
import 'package:vidyaveechi_website/view/widgets/loading_widget/loading_widget.dart';

class AllStudentsListRegistration extends StatelessWidget {
  final StudentController studentController = Get.put(StudentController());
  final RegistrationController regiControl = Get.put(RegistrationController());
  AllStudentsListRegistration({super.key});

  @override
  Widget build(BuildContext context) {
    regiControl.ontapRegiStudentList.value = false;
    return Obx(() => regiControl.ontapRegiStudentList.value == true
        ? RegistrationStudentList()
        : studentController.ontapStudent.value == true
            ? StudentDetailsContainer()
            : studentController.ontapCreateStudent.value == true
                ? CreateStudent()
                : SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      color: screenContainerbackgroundColor,
                      height: 650,
                      width: 1200,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 10, right: 20, left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconButton(
                              color: Colors.black,
                              icon: Icon(Icons.arrow_back),
                              iconSize: 20,
                              onPressed: () {
                               Get.find<ClassController>().ontapClass.value= false;
                              },
                            ),
                            SizedBox(
                              height: 50,
                              width: double.infinity,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const TextFontWidget(
                                    text: '10 A Students List',
                                    fontsize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Spacer(),
                                GestureDetector(
                                  // onTap: () {
                                  //   studentController.ontapCreateStudent.value =
                                  //       true;
                                  // },
                                  child: ButtonContainerWidget(
                                      curving: 30,
                                      colorindex: 0,
                                      height: 35,
                                      width: 200,
                                      child: const Center(
                                        child: TextFontWidgetRouter(
                                          text: 'Update',
                                          fontsize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: cWhite,
                                        ),
                                      )),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              color: cWhite,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 5, right: 5),
                                child: Container(
                                  color: cWhite,
                                  height: 40,
                                  child: const Row(
                                    children: [
                                      Expanded(
                                          flex: 1,
                                          child: CatrgoryTableHeaderWidget(
                                              headerTitle: 'Roll No')),
                                      SizedBox(
                                        width: 02,
                                      ),
                                      Expanded(
                                          flex: 4,
                                          child: CatrgoryTableHeaderWidget(
                                              headerTitle: 'Name')),
                                      SizedBox(
                                        width: 02,
                                      ),
                                      Expanded(
                                          flex: 2,
                                          child: CatrgoryTableHeaderWidget(
                                              headerTitle: 'Class ID')),
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
                                              headerTitle: 'Phone Number')),
                                      SizedBox(
                                        width: 02,
                                      ),
                                      Expanded(
                                          flex: 4,
                                          child: CatrgoryTableHeaderWidget(
                                              headerTitle: 'Parent Name')),
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
                                  padding:
                                      const EdgeInsets.only(right: 5, left: 5),
                                  child: SizedBox(
                                    // width: 1100,
                                    child: StreamBuilder(
                                      stream: studentController
                                                  .onClassWiseSearch.value ==
                                              true
                                          ? server
                                              .collection(
                                                  'SchoolListCollection')
                                              .doc(UserCredentialsController
                                                  .schoolId)
                                              .collection(
                                                  UserCredentialsController
                                                      .batchId!)
                                              .doc(UserCredentialsController
                                                  .batchId!)
                                              .collection('classes')
                                              .doc(Get.find<ClassController>()
                                                  .classDocID
                                                  .value)
                                              .collection('Students')
                                              .snapshots()
                                          : server
                                              .collection(
                                                  'SchoolListCollection')
                                              .doc(UserCredentialsController
                                                  .schoolId)
                                              .collection('AllStudents')
                                              .orderBy('admissionNumber')
                                              .snapshots(),
                                      builder: (context, snaPS) {
                                        if (snaPS.hasData) {
                                          return ListView.separated(
                                              itemBuilder: (context, index) {
                                                final data =
                                                    StudentModel.fromMap(snaPS
                                                        .data!.docs[index]
                                                        .data());
                                                return GestureDetector(
                                                  onTap: () {
                                                    studentController
                                                        .studentModelData
                                                        .value = data;
                                                    studentController
                                                        .ontapStudent
                                                        .value = true;
                                                  },
                                                  child:
                                                      ListOfClassStudentsWidgets(
                                                    data: data,
                                                    index: index,
                                                  ),
                                                );
                                              },
                                              separatorBuilder:
                                                  (context, index) {
                                                return const SizedBox(
                                                  height: 02,
                                                );
                                              },
                                              itemCount:
                                                  snaPS.data!.docs.length);
                                        } else if (snaPS.data == null) {
                                          return const LoadingWidget();
                                        } else {
                                          return const LoadingWidget();
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("*****Add New Students",style: TextStyle(color: Colors.red),),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  // onTap: () {
                                  //   studentController.ontapCreateStudent.value =
                                  //       true;
                                  // },
                                  child: ButtonContainerWidget(
                                      curving: 30,
                                      colorindex: 0,
                                      height: 35,
                                      width: 200,
                                      child: const Center(
                                        child: TextFontWidgetRouter(
                                          text: 'Manual',
                                          fontsize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: cWhite,
                                        ),
                                      )),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  // onTap: () {
                                  //   studentController.ontapCreateStudent.value =
                                  //       true;
                                  // },
                                  child: ButtonContainerWidget(
                                      curving: 30,
                                      colorindex: 0,
                                      height: 35,
                                      width: 200,
                                      child: const Center(
                                        child: TextFontWidgetRouter(
                                          text: 'Upload From Excel',
                                          fontsize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: cWhite,
                                        ),
                                      )),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  // onTap: () {
                                  //   studentController.ontapCreateStudent.value =
                                  //       true;
                                  // },
                                  child: ButtonContainerWidget(
                                      curving: 30,
                                      colorindex: 0,
                                      height: 35,
                                      width: 200,
                                      child: const Center(
                                        child: TextFontWidgetRouter(
                                          text: 'Upload From Web Data',
                                          fontsize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: cWhite,
                                        ),
                                      )),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ));
  }

  Future<void> searchStudentsByName(BuildContext context) async {
    studentController.fetchAllStudents();
    await showSearch(context: context, delegate: AllStudentSearchByName());
  }

  Future<void> searchStudentsByID(BuildContext context) async {
    studentController.fetchAllStudents();
    await showSearch(context: context, delegate: AllStudentSearchByID());
  }
}
