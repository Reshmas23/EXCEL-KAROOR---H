import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vidyaveechi_website/controller/meeting_controller/meeting_controller.dart';
import 'package:vidyaveechi_website/model/meeting_model/meeting_model.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/meeting/view_of_allmeetings/all_view_data_list.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/meeting/creating_meeting/create_meeting.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/students/student_details/widgets/category_tableHeader.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';
import 'package:vidyaveechi_website/view/widgets/button_container/button_container.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';
import 'package:vidyaveechi_website/view/widgets/routeSelectedTextContainer/routeSelectedTextContainer.dart';

class AllMeetingsListPage extends StatelessWidget {
  final MeetingController meetingController = Get.put(MeetingController());
  final formKey = GlobalKey<FormState>();
  AllMeetingsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    //  final Size size = MediaQuery.of(context).size;
    return Obx(() => meetingController.ontapMeeting.value == true
        ? CreateMeetinPage()
        : SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              color: screenContainerbackgroundColor,
              height: 920,
              width: 1200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Padding(
                    padding: EdgeInsets.only(left: 25, top: 25),
                    child: TextFontWidget(
                      text: "Meeting",
                      fontsize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 40,
                      left: 8,
                      right: 8,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 05, bottom: 5),
                              child: GestureDetector(
                                onTap: () {
                                  //   meetingController.ontapMeeting.value = true;
                                },
                                child: const RouteSelectedTextContainer(
                                    width: 150, title: 'ALL MEETINGS'),
                              ),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                meetingController.ontapMeeting.value = true;
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(right: 25, bottom: 5),
                                child: ButtonContainerWidget(
                                    curving: 30,
                                    colorindex: 0,
                                    height: 35,
                                    width: 150,
                                    child: const Center(
                                      child: TextFontWidgetRouter(
                                        text: 'Create Meetings',
                                        fontsize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: cWhite,
                                      ),
                                    )),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 25, left: 25),
                          child: Container(
                            color: cWhite,
                            height: 700,
                            width: 1200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                 Padding(
                                  padding: EdgeInsets.all(20),
                                  child: TextFontWidget(
                                    text: 'Meeting ',
                                    fontsize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Expanded(
                                  child: StreamBuilder(
                                      stream: server
                                          .collection('SchoolListCollection')
                                          .doc(UserCredentialsController
                                              .schoolId)
                                          .collection(UserCredentialsController
                                              .batchId!)
                                          .doc(UserCredentialsController
                                              .batchId!)
                                          .collection('AdminMeetings')
                                          .snapshots(),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return const Center(
                                              child:
                                                  CircularProgressIndicator());
                                        }
                                        // ignore: prefer_is_empty
                                        if (snapshot.data!.docs.length == 0) {
                                          return Center(
                                              child: Text(
                                            'No Meetings',
                                            style: GoogleFonts.poppins(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500),
                                          ));
                                        }
                                        return Container(
                                          color: screenContainerbackgroundColor,
                                          height: 650,
                                          width: 1200,
                                          child: Column(
                                            children: [
                                              Container(
                                                color: cWhite,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5, right: 5),
                                                  child: Container(
                                                    color: cWhite,
                                                    height: 40,
                                                    child: const Row(
                                                      children: [
                                                        Expanded(
                                                            flex: 1,
                                                            child:
                                                                CatrgoryTableHeaderWidget(
                                                                    headerTitle:
                                                                        'No')),
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
                                                            child:
                                                                CatrgoryTableHeaderWidget(
                                                                    headerTitle:
                                                                        'Topic')),
                                                        SizedBox(
                                                          width: 02,
                                                        ),
                                                        Expanded(
                                                            flex: 3,
                                                            child:
                                                                CatrgoryTableHeaderWidget(
                                                                    headerTitle:
                                                                        'Time')),
                                                        SizedBox(
                                                          width: 02,
                                                        ),
                                                        Expanded(
                                                            flex: 3,
                                                            child:
                                                                CatrgoryTableHeaderWidget(
                                                                    headerTitle:
                                                                        'Date')),
                                                        SizedBox(
                                                          width: 02,
                                                        ),
                                                        Expanded(
                                                            flex: 4,
                                                            child:
                                                                CatrgoryTableHeaderWidget(
                                                                    headerTitle:
                                                                        'Venue')),
                                                        SizedBox(
                                                          width: 02,
                                                        ),
                                                        Expanded(
                                                            flex: 3,
                                                            child:
                                                                CatrgoryTableHeaderWidget(
                                                                    headerTitle:
                                                                        'Edit')),
                                                        SizedBox(
                                                          width: 02,
                                                        ),

                                                        Expanded(
                                                            flex: 3,
                                                            child: CatrgoryTableHeaderWidget(
                                                                headerTitle:
                                                                    'Delete')),
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
                                                  width: 1200,
                                                  decoration: BoxDecoration(
                                                    color: cWhite,
                                                    border: Border.all(
                                                        color: cWhite),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 5, right: 5),
                                                    child: ListView.separated(
                                                        itemBuilder:
                                                            (context, index) {
                                                          final data = MeetingModel
                                                              .fromMap(snapshot
                                                                  .data!
                                                                  .docs[index]
                                                                  .data());
                                                          return GestureDetector(
                                                            onTap: () {
                                                              // adminLoginHistroyController
                                                              //     .parentModelData
                                                              //     .value = data;
                                                              // adminLoginHistroyController
                                                              //     .loginHistroyontapped
                                                              //     .value = true;
                                                            },
                                                            child:
                                                                AllMeetingsDataList(
                                                              index: index,
                                                              data: data,
                                                            ),
                                                          ); ///////
                                                        },
                                                        separatorBuilder:
                                                            (context, index) {
                                                          return const SizedBox(
                                                            height: 02,
                                                          );
                                                        },
                                                        itemCount: snapshot
                                                            .data!.docs.length),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                        // GridView.count(//
                                        //   crossAxisCount: ResponsiveWebSite.isMobile(context)
                                        //       ? 1
                                        //       : ResponsiveWebSite.isTablet(context)
                                        //           ? 3
                                        //           : 4,
                                        //   crossAxisSpacing: 12,
                                        //   mainAxisSpacing: 12,
                                        //   children: List.generate(snapshot.data!.docs.length, (index) {
                                        //       MeetingModel data = MeetingModel.fromMap(
                                        //       snapshot.data!.docs[index].data() );
                                        //     return Padding(
                                        //       padding: const EdgeInsets.all(20),
                                        //       child: Container(
                                        //         height: 200,
                                        //         width: 300,
                                        //         decoration: const BoxDecoration(
                                        //             color: cWhite,
                                        //             //Color.fromARGB(255, 245,252,255),
                                        //             boxShadow: [
                                        //               BoxShadow(
                                        //                 blurRadius: 1,
                                        //                 offset: Offset(3, 3),
                                        //               ),
                                        //               BoxShadow(
                                        //                 blurRadius: 1,
                                        //                 offset: Offset(1, 1),
                                        //               )
                                        //             ]),
                                        //         child: Column(
                                        //           mainAxisAlignment: MainAxisAlignment.start,
                                        //           crossAxisAlignment: CrossAxisAlignment.start,
                                        //           children: [
                                        //              Padding(
                                        //               padding: const EdgeInsets.only(top: 10, left: 10),
                                        //               child: TextFontWidget(
                                        //                 text: data.topic,
                                        //                 fontsize: 18,
                                        //                 fontWeight: FontWeight.bold,
                                        //               ),
                                        //             ),
                                        //             Padding(
                                        //               padding: EdgeInsets.only(left: 10, top: 10),
                                        //               child: TextFontWidget(
                                        //                 text: data.date,
                                        //                 fontsize: 14,
                                        //               ),
                                        //             ),
                                        //              Padding(
                                        //               padding: EdgeInsets.only(left: 10, top: 10),
                                        //               child: TextFontWidget(
                                        //                 text: data.time,
                                        //                 fontsize: 14,
                                        //               ),
                                        //             ),
                                        //              Padding(
                                        //               padding: EdgeInsets.only(left: 10, top: 10),
                                        //               child: TextFontWidget(
                                        //                 text: data.venue,
                                        //                 fontsize: 14,
                                        //               ),
                                        //             ),
                                        //             const Spacer(),
                                        //             Padding(
                                        //               padding: const EdgeInsets.only(
                                        //                 top: 10,
                                        //                 bottom: 10,
                                        //               ),
                                        //               child: Row(
                                        //                 children: [
                                        //                   Expanded(
                                        //                     child: Padding(
                                        //                       padding:
                                        //                           const EdgeInsets.only(left: 10),
                                        //                       child: MaterialButton(
                                        //                         onPressed: () {
                                        //                           editFunctionOfMeeting(context, data);
                                        //                         },
                                        //                         color: themeColorBlue,
                                        //                         child: GooglePoppinsWidgets(
                                        //                           text: 'Edit',
                                        //                           fontsize: 13,
                                        //                           color: cWhite,
                                        //                         ),
                                        //                       ),
                                        //                     ),
                                        //                   ),
                                        //                   Expanded(
                                        //                     child: Padding(
                                        //                       padding: const EdgeInsets.only(
                                        //                         left: 10,
                                        //                         right: 10,
                                        //                       ),
                                        //                       child: MaterialButton(
                                        //                         onPressed: () {
                                        //                          deleteFunctionOfMeetings(context);
                                        //                         },
                                        //                         color: cred,
                                        //                         child: GooglePoppinsWidgets(
                                        //                           text: 'Delete',
                                        //                           fontsize: 13,
                                        //                           color: cWhite,
                                        //                         ),
                                        //                       ),
                                        //                     ),
                                        //                   ),
                                        //                 ],
                                        //               ),
                                        //             )
                                        //           ],
                                        //         ),
                                        //       ),
                                        //     );
                                        //   }),
                                        // );///
                                      }),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ));
  }
}

class ContainerTitleWidget extends StatelessWidget {
  final String text;
  const ContainerTitleWidget({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: ResponsiveWebSite.isDesktop(context) ? 90 : 70,
      color: cWhite,
      child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: TextFontWidget(
          text: text,
          fontsize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
