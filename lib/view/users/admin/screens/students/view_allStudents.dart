import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/admin_section/student_controller/student_controller.dart';
import 'package:vidyaveechi_website/controller/class_controller/class_controller.dart';
import 'package:vidyaveechi_website/controller/registration_controller/registation_controller.dart';
import 'package:vidyaveechi_website/model/student_model/student_model.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/drop_down/select_class.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/students/create_student/create_newStudent.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/students/create_student/registrationStudents.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/students/search_students/search_studentID.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/students/search_students/search_studentName.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/students/student_details/student_details.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/students/student_details/widgets/category_tableHeader.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/students/widget/data_list.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';
import 'package:vidyaveechi_website/view/widgets/loading_widget/loading_widget.dart';
import 'package:vidyaveechi_website/view/widgets/routeSelectedTextContainer/routeSelectedTextContainer.dart';

class AllStudentListContainer extends StatelessWidget {
  final StudentController studentController = Get.put(StudentController());
  final RegistrationController regiControl = Get.put(RegistrationController());
  AllStudentListContainer({super.key});

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
                      height: 1000,
                      width: 1200,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 10, right: 20, left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 60,
                              width: double.infinity,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const TextFontWidget(
                                    text: 'All Student List',
                                    fontsize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () => searchStudentsByName(context),
                                    child: Container(
                                      height: 40,
                                      width: 200,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.grey.withOpacity(0.2)),
                                      child: const Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Icon(Icons.search),
                                          ),
                                          TextFontWidget(
                                              text: " Search By StudentName",
                                              fontsize: 12)
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: GestureDetector(
                                      onTap: () => searchStudentsByID(context),
                                      child: Container(
                                        height: 40,
                                        width: 200,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color:
                                                Colors.grey.withOpacity(0.2)),
                                        child: const Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Icon(Icons.search),
                                            ),
                                            TextFontWidget(
                                                text: " Search By StudentID",
                                                fontsize: 12)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Obx(() => studentController
                                              .onClassWiseSearch.value ==
                                          true
                                      ? Row(
                                          children: [
                                            SizedBox(
                                                height: 40,
                                                width: 200,
                                                child: SelectClassDropDown()),
                                            Checkbox(
                                              value: studentController
                                                  .onClassWiseSearch.value,
                                              onChanged: (value) {
                                                studentController
                                                    .onClassWiseSearch
                                                    .value = false;
                                              },
                                            )
                                          ],
                                        )
                                      : GestureDetector(
                                          onTap: () {
                                            studentController
                                                .onClassWiseSearch.value = true;
                                          },
                                          child: Container(
                                            height: 40,
                                            width: 200,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.grey
                                                    .withOpacity(0.2)),
                                            child: const Row(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Icon(Icons.search),
                                                ),
                                                TextFontWidget(
                                                    text:
                                                        " Search By ClassWise",
                                                    fontsize: 12),
                                              ],
                                            ),
                                          ),
                                        )),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            const Row(
                              children: [
                                RouteSelectedTextContainer(
                                  title: 'All Students',
                                  width: 200,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                // GestureDetector(
                                //   onTap: () {
                                //     regiControl.ontapRegiStudentList.value =
                                //         true;
                                //   },
                                //   child: const RouteSelectedTextContainer(
                                //       width: 200, title: 'Registered Student'),
                                // ),
                                Spacer(),
                                // GestureDetector(
                                //   onTap: () {
                                //     studentController.ontapCreateStudent.value =
                                //         true;
                                //   },
                                //   child: ButtonContainerWidget(
                                //       curving: 30,
                                //       colorindex: 0,
                                //       height: 35,
                                //       width: 200,
                                //       child: const Center(
                                //         child: TextFontWidgetRouter(
                                //           text: 'Create New Student',
                                //           fontsize: 12,
                                //           fontWeight: FontWeight.bold,
                                //           color: cWhite,
                                //         ),
                                //       )),
                                // )
                              ],
                            ),
                            const SizedBox(
                              height: 30,
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
                                              headerTitle: 'No')),
                                      SizedBox(
                                        width: 02,
                                      ),
                                      Expanded(
                                          flex: 2,
                                          child: CatrgoryTableHeaderWidget(
                                              headerTitle: 'ID')),
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
                                          flex: 4,
                                          child: CatrgoryTableHeaderWidget(
                                              headerTitle: 'E mail')),
                                      SizedBox(
                                        width: 02,
                                      ),
                                      Expanded(
                                          flex: 3,
                                          child: CatrgoryTableHeaderWidget(
                                              headerTitle: 'Ph.NO')),
                                      SizedBox(
                                        width: 02,
                                      ),
                                      Expanded(
                                          flex: 2,
                                          child: CatrgoryTableHeaderWidget(
                                              headerTitle: 'Class')),
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
                                                  child: AllStudentDataList(
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
                            )
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
