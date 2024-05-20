import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/class_controller/class_controller.dart';
import 'package:vidyaveechi_website/model/class_model/class_model.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/constant/constant.validate.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/registration_users/all_students_list_registration.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/registration_users/widget_list_of_classes.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/students/student_details/widgets/category_tableHeader.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';

class ListOfClassesRegistration extends StatelessWidget {
  final ClassController classController = Get.put(ClassController());
  ListOfClassesRegistration({super.key});

  @override
  Widget build(BuildContext context) {
    return
        // List<Widget> widgetlist = [];
        Obx(
      () => classController.ontapClass.value == true
          ? AllStudentsListRegistration()
          : SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                color: screenContainerbackgroundColor,
                height: 800,
                width: 1200,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       const SizedBox(
                        height: 40,
                        width: double.infinity,
                        child: TextFontWidget(
                          text: 'List Of Classes',
                          fontsize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    
                      // const SizedBox(
                      //   height: 25,
                      // ),
                      Container(
                        color: cWhite,
                        child: const Padding(
                          padding: EdgeInsets.only(left: 5, right: 5, top: 5),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: CatrgoryTableHeaderWidget(
                                      headerTitle: 'No')),
                              SizedBox(
                                width: 01,
                              ),
                              Expanded(
                                  flex: 4,
                                  child: CatrgoryTableHeaderWidget(
                                      headerTitle: 'Class Name')),
                              SizedBox(
                                width: 01,
                              ),
                              Expanded(
                                  flex: 2,
                                  child: CatrgoryTableHeaderWidget(
                                      headerTitle: 'Last Class Active Status')),
                              SizedBox(
                                width: 01,
                              ),
                              Expanded(
                                  flex: 2,
                                  child: CatrgoryTableHeaderWidget(
                                      headerTitle: 'Total Students')),
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
                                  flex: 2,
                                  child: CatrgoryTableHeaderWidget(
                                      headerTitle: 'Class Teacher')),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: 1200,
                          color: cWhite,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 5, right: 5, top: 5),
                            child: StreamBuilder(
                              stream: server
                                  .collection('SchoolListCollection')
                                  .doc(UserCredentialsController.schoolId)
                                  .collection(
                                      UserCredentialsController.batchId!)
                                  .doc(UserCredentialsController.batchId!)
                                  .collection('classes')
                                  .snapshots(),
                              builder: (context, snaps) {
                                if (snaps.hasData) {
                                  if (snaps.data!.docs.isEmpty) {
                                    return  const Center(
                                      child: TextFontWidget(
                                          text:
                                              "No class found add new classes",
                                          fontsize: 12.5),
                                    );
                                  } else {
                                    return ListView.separated(
                                        itemBuilder: (context, index) {
                                          final data = ClassModel.fromMap(
                                              snaps.data!.docs[index].data());
                                          return GestureDetector(
                                            onTap: () {
                                              classController
                                                  .classModelData.value = data;
                                              classController.ontapClass.value =
                                                  true;
                                            },
                                            child: ListOfClassWidget(
                                              classStatus: snaps,
                                              data: data,
                                              index: index,
                                            ),
                                          );
                                        },
                                        separatorBuilder: (context, index) {
                                          return const SizedBox(
                                            height: 02,
                                          );
                                        },
                                        itemCount: snaps.data!.docs.length);
                                  }
                                } else {
                                  return circularProgressIndicator;
                                }
                              },
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
