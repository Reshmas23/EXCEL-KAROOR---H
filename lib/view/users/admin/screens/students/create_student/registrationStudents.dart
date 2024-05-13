import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/registration_controller/registation_controller.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/constant/constant.validate.dart';
import 'package:vidyaveechi_website/view/drop_down/registration/regi_studentCount.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/students/student_details/widgets/category_tableHeader.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';
import 'package:vidyaveechi_website/view/widgets/blue_Container_widget/blue_Container_widget.dart';
import 'package:vidyaveechi_website/view/widgets/data_list_widgets/data_container.dart';
import 'package:vidyaveechi_website/view/widgets/loading_widget/loading_widget.dart';
import 'package:vidyaveechi_website/view/widgets/progess_button/progress_button.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';
import 'package:vidyaveechi_website/view/widgets/routeSelectedTextContainer/routeSelectedTextContainer.dart';
import 'package:vidyaveechi_website/view/widgets/routeSelectedTextContainer/route_NonSelectedContainer.dart';

class RegistrationStudentList extends StatelessWidget {
  final RegistrationController registrationController = Get.put(RegistrationController());
  RegistrationStudentList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        color: screenContainerbackgroundColor,
        width: 1200,
        height: ResponsiveWebSite.isMobile(context) ? 1200 : 820,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10, top: 25, bottom: 10),
                  child: TextFontWidget(
                    text: 'Student Registation List',
                    fontsize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Obx(() => Padding(
                      padding: const EdgeInsets.only(top: 20, right: 20),
                      child: SizedBox(
                        height: 60,
                        width: 200,
                        child: ProgressButtonWidget(
                            buttonstate: registrationController.buttonstate.value,
                            text: 'Add All Students',
                            function: () async {
                              await registrationController
                                  .addAllRegStudentToClass(
                                      Get.find<RegistrationController>()
                                          .classRegClassID
                                          .value);
                            }),
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 20, right: 20),
                  child: SizedBox(
                      height: 60,
                      width: 250,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TextFontWidget(text: 'Class *', fontsize: 10),
                          const SizedBox(
                            height: 05,
                          ),
                          SizedBox(height: 40, child: SelectRegClassStudntCountDropDown()),
                        ],
                      )),
                )
              ],
            ),
                      registrationController.ontapRegiStudentList.value == true?
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      registrationController.ontapRegiStudentList.value = false;
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(top: 30, left: 10),
                      child: RouteNonSelectedTextContainer(title: 'Home'),
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: RouteSelectedTextContainer(width: 200, title: 'Registered Students'),
                  ),
                ],
              ),
            ): const Padding(
                    padding: EdgeInsets.only(top: 30,bottom: 30,left: 10),
                    child: RouteSelectedTextContainer(width: 200, title: 'Registered Students'),
                  ),
            Expanded(
              child: Container(
                width: 1200,
                height: ResponsiveWebSite.isMobile(context) ? 800 : 500,
                color: cWhite,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, top: 20),
                      child: Row(
                        children: [
                          Expanded(flex: 1, child: CatrgoryTableHeaderWidget(headerTitle: 'No')),
                          SizedBox(
                            width: 02,
                          ),
                          Expanded(
                              flex: 5,
                              child: CatrgoryTableHeaderWidget(headerTitle: 'Student Name')),
                          SizedBox(
                            width: 02,
                          ),
                          Expanded(flex: 3, child: CatrgoryTableHeaderWidget(headerTitle: 'Class')),
                          SizedBox(
                            width: 02,
                          ),
                          Expanded(flex: 5, child: CatrgoryTableHeaderWidget(headerTitle: 'Mail')),
                          SizedBox(
                            width: 02,
                          ),
                          Expanded(
                              flex: 3, child: CatrgoryTableHeaderWidget(headerTitle: 'Phone No')),
                          SizedBox(
                            width: 02,
                          ),
                          Expanded(
                              flex: 3, child: CatrgoryTableHeaderWidget(headerTitle: 'Options')),
                          SizedBox(
                            width: 02,
                          ),
                        ],
                      ),
                    ),
                    Obx(() => Expanded(
                          child: StreamBuilder(
                            stream: server
                                .collection('SchoolListCollection')
                                .doc(UserCredentialsController.schoolId)
                                .collection(UserCredentialsController.batchId!)
                                .doc(UserCredentialsController.batchId!)
                                .collection('classes')
                                .doc(Get.find<RegistrationController>().classRegClassID.value)
                                .collection('RegTemp_Students')
                                .snapshots(),
                            builder: (context, snaps) {
                              if (snaps.hasData) {
                                return snaps.data!.docs.isEmpty
                                    ? const Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              "Please select the class",
                                              style: TextStyle(fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        ],
                                      )
                                    : ListView.separated(
                                        itemBuilder: (context, index) {
                                          final data = snaps.data!.docs[index].data();
                                          return Padding(
                                            padding: const EdgeInsets.only(left: 10, right: 10),
                                            child: RegStudentListDataList(data: data, index: index),
                                          );
                                        },
                                        separatorBuilder: (context, index) {
                                          return const SizedBox(
                                            height: 02,
                                          );
                                        },
                                        itemCount: snaps.data!.docs.length);
                              } else if (snaps.data == null) {
                                return const LoadingWidget();
                              } else {
                                return const LoadingWidget();
                              }
                            },
                          ),
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RegStudentListDataList extends StatelessWidget {
  final Map<String, dynamic> data;
  final int index;
  const RegStudentListDataList({
    required this.index,
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    log('data[studentName]${data['studentName']}');
    return SizedBox(
      height: 35,
      width: 1200,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: DataContainerWidget(
                rowMainAccess: MainAxisAlignment.center,
                color: cWhite,
                // width: 150,
                index: index,
                headerTitle: '${index + 1}'), //....................No
          ),
          const SizedBox(
            width: 02,
          ),
          Expanded(
            flex: 5,
            child: DataContainerWidget(
                rowMainAccess: MainAxisAlignment.center,
                color: cWhite,
                index: index,
                headerTitle: '${data['studentName']}'),
          ), //................................................. Months
          const SizedBox(
            width: 02,
          ),
          Expanded(
            flex: 3,
            child: StreamBuilder(
                stream: server
                    .collection('SchoolListCollection')
                    .doc(UserCredentialsController.schoolId)
                    .collection(UserCredentialsController.batchId!)
                    .doc(UserCredentialsController.batchId!)
                    .collection('classes')
                    .doc(data['classId'])
                    .snapshots(),
                builder: (context, classsnap) {
                  if (classsnap.hasData) {
                    return DataContainerWidget(
                        rowMainAccess: MainAxisAlignment.center,
                        color: cWhite,
                        index: index,
                        headerTitle: '${classsnap.data!.data()!['className']}');
                  } else {
                    return circularProgressIndicator;
                  }
                }),
          ), //................................................. Months
          const SizedBox(
            width: 02,
          ),
          Expanded(
            flex: 5,
            child: Container(
              color: index % 2 == 0 ? const Color.fromARGB(255, 246, 246, 246) : Colors.blue[50],
              child: DataContainerWidget(
                  rowMainAccess: MainAxisAlignment.center,
                  color: cWhite,
                  index: index,
                  headerTitle: "${data['parentPhoneNumber']}"),
            ),
          ), //........................................... Subjects
          const SizedBox(
            width: 02,
          ),
          Expanded(
            flex: 3,
            child: DataContainerWidget(
                rowMainAccess: MainAxisAlignment.center,
                color: cWhite,
                index: index,
                headerTitle: "${data['studentemail']}"),
          ), // ................................... Fees Required
          const SizedBox(
            width: 02,
          ),
          Expanded(
            flex: 3,
            child: GestureDetector(
              onTap: () {
                Get.find<RegistrationController>().removeRegiStudent(context,
                    Get.find<RegistrationController>().classRegClassID.value, data['docid']);
              },
              child: BlueContainerWidget(
                  title: 'Remove', fontSize: 12, color: themeColorBlue, width: 200),
            ),
          ), // ................................... Fees Required
          const SizedBox(
            width: 02,
          ),
          //............................. Status [Full paid or Pending]
        ],
      ),
    );
  }
}
