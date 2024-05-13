import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/event_controller/event_controller.dart';
import 'package:vidyaveechi_website/model/event_models/events_model.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/google_poppins_widget.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/events/create_event.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/events/data_list_event.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/students/student_details/widgets/category_tableHeader.dart';
import 'package:vidyaveechi_website/view/users/super_admin/widgets/buttonContainer.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';
import 'package:vidyaveechi_website/view/widgets/loading_widget/loading_widget.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';
import 'package:vidyaveechi_website/view/widgets/routeSelectedTextContainer/routeSelectedTextContainer.dart';

class AllEventsList extends StatelessWidget {
  const AllEventsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        color: screenContainerbackgroundColor,
        height: 1000,
        width: 1200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(
                ResponsiveWebSite.isMobile(context) ? 10 : 20,
              ),
              child: GooglePoppinsWidgets(
                text: 'Events ',
                fontsize: ResponsiveWebSite.isMobile(context) ? 18 : 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(
                ResponsiveWebSite.isMobile(context) ? 10 : 20,
              ),
              child: Row(
                children: [
                  const RouteSelectedTextContainer(
                      width: 180, title: 'All Events'),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      createEventAdmin(context);
                    },
                    child: ButtonContainerWidget(
                        curving: 30,
                        colorindex: 0,
                        height: 40,
                        width: 180,
                        child: const Center(
                          child: TextFontWidgetRouter(
                            text: 'Create Event',
                            fontsize: 14,
                            fontWeight: FontWeight.bold,
                            color: cWhite,
                          ),
                        )),
                  )
                ],
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.all(
            //     ResponsiveWebSite.isMobile(context) ? 10 : 20,
            //   ),
            //   child: CreateEvent(),
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
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
                            child:
                                CatrgoryTableHeaderWidget(headerTitle: 'No')),
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
                                headerTitle: 'Event Name')),
                        SizedBox(
                          width: 02,
                        ),
                        Expanded(
                            flex: 4,
                            child: CatrgoryTableHeaderWidget(
                                headerTitle: 'Event Description')),
                        SizedBox(
                          width: 02,
                        ),
                        Expanded(
                            flex: 2,
                            child:
                                CatrgoryTableHeaderWidget(headerTitle: 'Edit')),
                        SizedBox(
                          width: 02,
                        ),

                        Expanded(
                            flex: 2,
                            child: CatrgoryTableHeaderWidget(
                                headerTitle: 'Delete')),
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
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  width: 1200,
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
                                .doc(UserCredentialsController.batchId!)
                                .collection('AdminEvents')
                                .snapshots(),
                            builder: (context, snaPS) {
                              if (snaPS.hasData) {
                                return ListView.separated(
                                    itemBuilder: (context, index) {
                                      final data = EventModel.fromMap(
                                          snaPS.data!.docs[index].data());
                                      return GestureDetector(
                                        onTap: () {
                                          // parentController
                                          //     .parentModelData
                                          //     .value = data;
                                          // parentController
                                          //     .ontapviewParent
                                          //     .value = true;
                                        },
                                        child: AllEventsDataList(
                                          data: data,
                                          color: Colors.transparent,
                                          index: index,
                                        ),
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return const SizedBox(
                                        height: 02,
                                      );
                                    },
                                    itemCount: snaPS.data!.docs.length);
                                //           ////////
                              } else {
                                return const LoadingWidget();
                              }
                            }) ////
                        ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

final EventController eventController = Get.put(EventController());
