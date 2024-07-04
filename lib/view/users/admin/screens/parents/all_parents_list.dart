import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/admin_section/parent_controller/parent_controller.dart';
import 'package:vidyaveechi_website/model/parent_model/parent_model.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/parents/create_parent/create_parent.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/parents/list_table/list_table_of_prnt.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/parents/parent_details/parent_details.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/parents/search_parents/search_parents.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/students/student_details/widgets/category_tableHeader.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';
import 'package:vidyaveechi_website/view/widgets/loading_widget/loading_widget.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';
import 'package:vidyaveechi_website/view/widgets/routeSelectedTextContainer/routeSelectedTextContainer.dart';

class AllParentsListContainer extends StatelessWidget {
  final ParentController parentController = Get.put(ParentController());
  AllParentsListContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => parentController.ontapviewParent.value == true
        ? ParentDetailsContainer()
        : parentController.ontapParent.value == true
            ? CreateParent()
            : SingleChildScrollView(
                scrollDirection: ResponsiveWebSite.isMobile(context)
                    ? Axis.horizontal
                    : Axis.vertical,
                child: Container(
                  color: screenContainerbackgroundColor,
                  height: 650,
                  width: ResponsiveWebSite.isDesktop(context)
                      ? double.infinity
                      : 1200,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 20, right: 20, left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 60,
                          width: double.infinity,
                          child: TextFontWidget(
                            text: 'All Parents List',
                            fontsize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            const RouteSelectedTextContainer(
                                title: 'All Parents'),
                            const Spacer(),
                            GestureDetector(
                              onTap: () => searchParentsByName(context),
                              child: Container(
                                height: 40,
                                width: 200,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey.withOpacity(0.2)),
                                child: const Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(Icons.search),
                                    ),
                                    TextFontWidget(
                                        text: " Search By Parent Name",
                                        fontsize: 12)
                                  ],
                                ),
                              ),
                            ),

                            // GestureDetector(
                            //   onTap: () {
                            //     parentController.ontapParent.value = true;
                            //   },
                            //   child: Padding(
                            //     padding: const EdgeInsets.only(right: 25, top: 5),
                            //     child: ButtonContainerWidget(
                            //         curving: 30,
                            //         colorindex: 0,
                            //         height: 35,
                            //         width: 150,
                            //         child: const Center(
                            //           child: TextFontWidgetRouter(
                            //             text: 'Create New Parent',
                            //             fontsize: 12,
                            //             fontWeight: FontWeight.bold,
                            //             color: cWhite,
                            //           ),
                            //         )),
                            //   ),
                            // )
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
                                    // Expanded(
                                    //     flex: 2,
                                    //     child: CatrgoryTableHeaderWidget(
                                    //         headerTitle: 'ID')),
                                    // SizedBox(
                                    //   width: 01,
                                    // ),
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
                                        flex: 4,
                                        child: CatrgoryTableHeaderWidget(
                                            headerTitle: 'Student Name')),
                                    SizedBox(
                                      width: 02,
                                    ),
                                    Expanded(
                                        flex: 3,
                                        child: CatrgoryTableHeaderWidget(
                                            headerTitle: 'Class ')),
                                    SizedBox(
                                      width: 02,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
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
                                      .collection('AllParents')
                                      .snapshots(),
                                  builder: (context, snaPS) {
                                    if (snaPS.hasData) {
                                      return snaPS.data!.docs.isEmpty
                                          ? const Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Text(
                                                    "Please create parent",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ),
                                              ],
                                            )
                                          : ListView.separated(
                                              itemBuilder: (context, index) {
                                                final data =
                                                    ParentModel.fromMap(snaPS
                                                        .data!.docs[index]
                                                        .data());
                                                return GestureDetector(
                                                  onTap: () {
                                                    parentController
                                                        .parentModelData
                                                        .value = data;
                                                    parentController
                                                        .ontapviewParent
                                                        .value = true;
                                                  },
                                                  child: AllParentsDataList(
                                                    index: index,
                                                    data: data,
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

  Future<void> searchParentsByName(BuildContext context) async {
    parentController.fetchAllParents();
    await showSearch(context: context, delegate: AllParentSearchByName());
  }
}
