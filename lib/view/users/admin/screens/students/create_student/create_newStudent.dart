import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/admin_section/parent_controller/parent_controller.dart';
import 'package:vidyaveechi_website/controller/admin_section/student_controller/student_controller.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/students/create_student/class_wise_creation.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/students/create_student/manual_creation.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';
import 'package:vidyaveechi_website/view/widgets/routeSelectedTextContainer/routeSelectedTextContainer.dart';
import 'package:vidyaveechi_website/view/widgets/routeSelectedTextContainer/route_NonSelectedContainer.dart';

class CreateStudent extends StatelessWidget {
  final StudentController studentController = Get.put(StudentController());
  final ParentController parentController = Get.put(ParentController());
  CreateStudent({super.key});

  @override
  Widget build(BuildContext context) {
    log("SchoolID :  ${UserCredentialsController.schoolId}");
    log("BatchID :  ${UserCredentialsController.batchId}");
    log("userrole :  ${UserCredentialsController.userRole}");
    return DefaultTabController(
      length: 2,
      child: Container(
        color: screenContainerbackgroundColor,
        height: ResponsiveWebSite.isMobile(context) ? 1200 : 820,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 25, top: 25),
              child: TextFontWidget(
                text: 'Create A New Student',
                fontsize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ResponsiveWebSite.isMobile(context)
                  ? Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 8,
                            left: 10,
                            right: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  studentController.ontapCreateStudent.value =
                                      false;
                                  // print(studentController
                                  //     .ontapCreateStudent.value);
                                },
                                child: const RouteNonSelectedTextContainer(
                                    title: 'Home'),
                              ),
                              const RouteSelectedTextContainer(
                                  width: 140, title: 'Create Student'),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: 300,
                                child: TabBar(
                                    // indicatorSize: TabBarIndicatorSize.tab,
                                    indicatorColor: Colors.red,
                                    tabs: [
                                      Tab(
                                          height: 30,
                                          child: RouteSelectedTextContainer(
                                              width: 120, title: 'Manual')),
                                      Tab(
                                          height: 30,
                                          child: RouteSelectedTextContainer(
                                              width: 120, title: 'Class Wise')),
                                    ]),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 08,
                            right: 05,
                          ),
                          child: GestureDetector(
                              onTap: () {
                                studentController.ontapCreateStudent.value =
                                    false;
                              },
                              child: const RouteNonSelectedTextContainer(
                                  title: 'Home')),
                        ),
                        const RouteSelectedTextContainer(
                            width: 140, title: 'Create Student'),
                        const Spacer(),
                        SizedBox(
                          width:
                              ResponsiveWebSite.isTablet(context) ? 360 : 600,
                          child: const TabBar(
                              // indicatorSize: TabBarIndicatorSize.tab,
                              indicatorColor: Colors.red,
                              tabs: [
                                Tab(
                                    height: 30,
                                    child: RouteSelectedTextContainer(
                                        width: 140, title: ' Manual Creation')),
                                Tab(
                                    height: 30,
                                    child: RouteSelectedTextContainer(
                                        width: 140,
                                        title: 'Class Wise Creation')),
                              ]),
                        )
                      ],
                    ),
            ),
            Expanded(
              child: TabBarView(children: [
                ManualStudentCreation(), /////////////////////////////..................Create A New Student
                ClassWiseStudentCreation()
              ]),
            )
          ],
        ),
      ),
    );
  }
}
