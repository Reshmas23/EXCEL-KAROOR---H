// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';
// import 'package:vidyaveechi_website/controller/meeting_controller/meeting_controller.dart';
// import 'package:vidyaveechi_website/view/colors/colors.dart';
// import 'package:vidyaveechi_website/view/constant/constant.validate.dart';
// import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
// import 'package:vidyaveechi_website/view/widgets/button_container/button_container.dart';
// import 'package:vidyaveechi_website/view/widgets/progess_button/progress_button.dart';
// import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';
// import 'package:vidyaveechi_website/view/widgets/routeSelectedTextContainer/routeSelectedTextContainer.dart';
// import 'package:vidyaveechi_website/view/widgets/textformFiledContainer/textformFiledContainer.dart';

// class MeetingCreatingPage extends StatelessWidget {
//   final MeetingController meetingController = Get.put(MeetingController());
//   final formKey = GlobalKey<FormState>();
//   MeetingCreatingPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     List<Widget> meetingListWidget = [
//        TextFontWidget(
//         text: "SCHEDULE MEETING",
//         fontsize: 19,
//         fontWeight: FontWeight.bold,
//       ), //...0

//       const ContainerTitleWidget(text: "Topic"), //////.....1

//       TextFormFiledContainerWidget(
//           controller: meetingController.topicController,
//           validator: checkFieldEmpty,
//           hintText: "Enter Topic Here",
//           title: '',
//           width: ResponsiveWebSite.isMobile(context)
//               ? 210
//               : ResponsiveWebSite.isTablet(context)
//                   ? 300
//                   : 450), //////////topic field......2

//       const ContainerTitleWidget(text: "When"), //////.3
//     GestureDetector(
//       onTap:() =>
//           meetingController.selectDateOfMeeting( context),
//       child: SizedBox(
//         height: 60,
//         width: ResponsiveWebSite.isTablet(context) ? 140 : 210,
//         child: Padding(
//           padding: const EdgeInsets.only(top: 25),
//           child: Container(width: ResponsiveWebSite.isTablet(context) ? 140 : 210,
//             height: 35,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius .circular(  05),
//                     color: screenContainerbackgroundColor,
//                     border: Border.all(
//                         color: cBlack  .withOpacity(0.4))),
//                 child: Padding(
//                   padding:
//                       const EdgeInsets .all(8.0),
//                   child: Obx(() => TextFontWidget(
//                       text: meetingController .dateController .value ==   ''
//                           ? 'DD/MM/YYYY *'
//                           : meetingController
//                               .dateController
//                               .value,
//                       fontsize: 12.5)),
//                 ),),
//         ),
//       ),
//     ),
//        /////////////////////////////////////////////////////////////////////...4
//       TextFormFiledContainerWidget(
//           controller: meetingController.timeController,
//           validator: checkFieldEmpty,
//           hintText: "Time",
//           title: '',
//           width: ResponsiveWebSite.isTablet(context) ? 140 : 210), /////....5

//       const ContainerTitleWidget(text: "Category"), /////////.........6

//       TextFormFiledContainerWidget(
//           controller: meetingController.categoryController,
//           validator: checkFieldEmpty,
//           hintText: "Enter Category Here",
//           title: '',
//           width: ResponsiveWebSite.isMobile(context)
//               ? 210
//               : ResponsiveWebSite.isTablet(context)
//                   ? 300
//                   : 450), //////.....7
//       const ContainerTitleWidget(text: "Members"), ////////////////,,,8

//       TextFormFiledContainerWidget(
//           controller: meetingController.memberController,
//           validator: checkFieldEmpty,
//           hintText: "Expected Members",
//           title: '',
//           width: ResponsiveWebSite.isTablet(context) ? 140 : 210), ///////9

//       TextFormFiledContainerWidget(
//           validator: checkFieldEmpty,
//           controller: meetingController.specialguestController,
//           hintText: "Special Guest",
//           title: '',
//           width: ResponsiveWebSite.isTablet(context) ? 140 : 210), //////////10

//       const ContainerTitleWidget(text: "Venue"), ///////////////////11

//       TextFormFiledContainerWidget(
//           controller: meetingController.venueController,
//           validator: checkFieldEmpty,
//           hintText: "Enter Venue Here",
//           title: '',
//           width: ResponsiveWebSite.isMobile(context)
//               ? 210
//               : ResponsiveWebSite.isTablet(context)
//                   ? 300
//                   : 450), //////////////////12

//                     Obx(() =>
//                       ProgressButtonWidget(
//                           function: () async {
//                             if (meetingController.formKey.currentState!.validate()) {
//                                meetingController.createMeeting();
//                                print("object");
//                                  }
//                                },
//                                buttonstate: meetingController .buttonstate.value,
//                                text: 'Create Meeting')),
//       // GestureDetector(
//       //   onTap: () {
//       //     if (meetingController.formKey.currentState!.validate()) {
//       //       meetingController.createMeeting();
//       //       print("object");
//       //     }
//       //   },
//       //   child: Container(
//       //     height: 35,
//       //     width: 120,
//       //     decoration: const BoxDecoration(
//       //         borderRadius: BorderRadius.all(Radius.circular(8)), color: themeColorBlue),
//       //     child: const Center(
//       //         child: TextFontWidget(
//       //       text: "Submit",
//       //       fontsize: 15,
//       //       fontWeight: FontWeight.bold,
//       //       color: cWhite,
//       //     )),
//       //   ),
//       // ), ////////////////////////13
//       GestureDetector(
//         onTap: () {
//           if (meetingController.formKey.currentState!.validate()) {
//             meetingController.createMeeting();
//             print("object");
//           }
//         },
//         child: Container(
//           height: 35,
//           width: 120,
//           decoration: const BoxDecoration(
//               borderRadius: BorderRadius.all(Radius.circular(8)), color: themeColorBlue),
//           child:Center(
//               child: TextFontWidget(
//             text: "Submit",
//             fontsize: 15,
//             fontWeight: FontWeight.bold,
//             color: cWhite,
//           )),
//         ),
//       ), ////////////////////////13
//       Padding(
//         padding: const EdgeInsets.only(top: 5),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Checkbox(
//               value: true,
//               onChanged: (value) {},
//             ),
//             TextFontWidget(text: "Students", fontsize: 12),
//             Checkbox(
//               value: true,
//               onChanged: (value) {},
//             ),
//             TextFontWidget(text: "Parents", fontsize: 12),
//             Checkbox(
//               value: true,
//               onChanged: (value) {},
//             ),
//             TextFontWidget(text: "Teachers", fontsize: 12),
//           ],
//         ),
//       ) ///////////////////14
//     ];
//     //////////////////////////////////////////////////////////////////////////////
//     ///...............................................................///
//     /////////////////////////////////////////////////////////////////
//     //  final Size size = MediaQuery.of(context).size;
//     return Obx(() => meetingController.ontapMeeting.value == true
//         ? MeetingEditRemove()
//         : SingleChildScrollView(
//             child: Container(
//               color: screenContainerbackgroundColor,
//               height: 720,
//               width: double.infinity,
//               child: Form(
//                 key: meetingController.formKey,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                      Padding(
//                       padding: EdgeInsets.only(left: 25, top: 25),
//                       child: TextFontWidget(
//                         text: "Meeting",
//                         fontsize: 21,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(
//                         top: 40,
//                         left: 8,
//                         right: 8,
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.only(right: 05, bottom: 5),
//                                 child: GestureDetector(
//                                   onTap: () {
//                                     //   meetingController.ontapMeeting.value = true;
//                                   },
//                                   child: const RouteSelectedTextContainer(
//                                       width: 150, title: 'CREATE MEETINGS'),
//                                 ),
//                               ),
//                               Spacer(),
//                               GestureDetector(
//                                 onTap: () {
//                                   meetingController.ontapMeeting.value = true;
//                                 },
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(right: 25, bottom: 5),
//                                   child: ButtonContainerWidget(
//                                       curving: 30,
//                                       colorindex: 0,
//                                       height: 35,
//                                       width: 150,
//                                       child:  Center(
//                                         child: TextFontWidget(
//                                           text: 'View All Meetings',
//                                           fontsize: 12,
//                                           fontWeight: FontWeight.bold,
//                                           color: cWhite,
//                                         ),
//                                       )),
//                                 ),
//                               )
//                             ],
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           Container(
//                             color: cWhite,
//                             height: 560,
//                             alignment: Alignment.topLeft,
//                             child: ResponsiveWebSite.isMobile(context)
//                                 ? Row(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     children: [
//                                       Padding(
//                                         padding: const EdgeInsets.all(10.0),
//                                         child: Container(
//                                           height: 550,
//                                           width: 280,
//                                           // decoration: BoxDecoration(border: Border.all(width: 2,color: Colors.grey.withOpacity(0.2)),
//                                           // boxShadow: const [BoxShadow(blurRadius: 2)],
//                                           color: cWhite,
//                                           //  ),
//                                           child: Column(
//                                             crossAxisAlignment: CrossAxisAlignment.start,
//                                             children: [
//                                               meetingListWidget[
//                                                   0], ///////////////////////heading.........................0
//                                               Row(
//                                                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                                 children: [
//                                                   Padding(
//                                                       padding: const EdgeInsets.only(top: 20),
//                                                       child: meetingListWidget[
//                                                           1] //////////////////topic.........................1,
//                                                       ),
//                                                   meetingListWidget[2] //////////topic field
//                                                 ],
//                                               ),
//                                               Row(
//                                                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                                 children: [
//                                                   Padding(
//                                                       padding: const EdgeInsets.only(top: 20),
//                                                       child: meetingListWidget[3]),
//                                                   Column(
//                                                     children: [
//                                                       meetingListWidget[4], //////......date
//                                                       meetingListWidget[5], /////....time
//                                                     ],
//                                                   ),
//                                                 ],
//                                               ),
//                                               Row(
//                                                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                                 children: [
//                                                   Padding(
//                                                       padding: const EdgeInsets.only(top: 20),
//                                                       child: meetingListWidget[6] ////.....category
//                                                       ),
//                                                   meetingListWidget[
//                                                       7] //////////////..........................categroy field
//                                                 ],
//                                               ),
//                                               Row(
//                                                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                                 children: [
//                                                   Padding(
//                                                       padding: const EdgeInsets.only(top: 20),
//                                                       child: meetingListWidget[
//                                                           8] ///////////////////............members
//                                                       ),
//                                                   Column(
//                                                     children: [
//                                                       meetingListWidget[
//                                                           9], ////////...........expected members
//                                                       meetingListWidget[10], /////////special guest
//                                                     ],
//                                                   ),
//                                                 ],
//                                               ),
//                                               Row(
//                                                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                                 children: [
//                                                   Padding(
//                                                     padding: const EdgeInsets.only(top: 20),
//                                                     child: meetingListWidget[11], ///////venu
//                                                   ),
//                                                   meetingListWidget[12] /////////////////venu field
//                                                 ],
//                                               ),
//                                               meetingListWidget[14],

//                                               Align(
//                                                 alignment: Alignment.center,
//                                                 child: Padding(
//                                                     padding: const EdgeInsets.only(top: 20),
//                                                     child: meetingListWidget[
//                                                         13] /////////////////button
//                                                     ),
//                                               )
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ) ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                 : Row(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     children: [
//                                       Padding(
//                                         padding:
//                                             const EdgeInsets.only(left: 65.0, top: 35, right: 65),
//                                         child: Container(
//                                           height: 450,
//                                           width: ResponsiveWebSite.isTablet(context) ? 400 : 600,
//                                           // decoration: BoxDecoration(border: Border.all(width: 2,color: Colors.grey.withOpacity(0.2)),
//                                           // boxShadow: const [BoxShadow(blurRadius: 2)],
//                                           color: cWhite,
//                                           //  ),
//                                           child: Column(
//                                             crossAxisAlignment: CrossAxisAlignment.start,
//                                             children: [
//                                               meetingListWidget[
//                                                   0], ///////////////////////heading.........................0
//                                               Row(
//                                                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                                 children: [
//                                                   Padding(
//                                                       padding: const EdgeInsets.only(top: 20),
//                                                       child: meetingListWidget[
//                                                           1] //////////////////topic.........................1
//                                                       ),
//                                                   meetingListWidget[2] //////////topic field
//                                                 ],
//                                               ),
//                                               Row(
//                                                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                                 children: [
//                                                   Padding(
//                                                       padding: const EdgeInsets.only(top: 20),
//                                                       child: meetingListWidget[3] ///////.......whwn
//                                                       ),
//                                                   meetingListWidget[4], //////......date
//                                                   meetingListWidget[5], /////....time
//                                                 ],
//                                               ),
//                                               Row(
//                                                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                                 children: [
//                                                   Padding(
//                                                       padding: const EdgeInsets.only(top: 20),
//                                                       child: meetingListWidget[6] ////.....category
//                                                       ),
//                                                   meetingListWidget[7] /////////....category field
//                                                 ],
//                                               ),
//                                               Row(
//                                                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                                 children: [
//                                                   Padding(
//                                                       padding: const EdgeInsets.only(top: 20),
//                                                       child: meetingListWidget[
//                                                           8] ///////////////////............member
//                                                       ),
//                                                   meetingListWidget[
//                                                       9], ////////...........expected members
//                                                   meetingListWidget[10], /////////special guest
//                                                 ],
//                                               ),
//                                               Row(
//                                                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                                 children: [
//                                                   Padding(
//                                                     padding: const EdgeInsets.only(top: 20),
//                                                     child: meetingListWidget[11], ///////venue
//                                                   ),
//                                                   meetingListWidget[12] /////////////////venu field
//                                                 ],
//                                               ),
//                                               meetingListWidget[14],

//                                               Align(
//                                                 alignment: Alignment.center,
//                                                 child: Padding(
//                                                     padding: const EdgeInsets.only(top: 20),
//                                                     child: meetingListWidget[
//                                                         13] /////////////////button
//                                                     ),
//                                               )
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ));
//   }
// }

// class ContainerTitleWidget extends StatelessWidget {
//   final String text;
//   const ContainerTitleWidget({
//     required this.text,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 35,
//       width: ResponsiveWebSite.isDesktop(context) ? 90 : 70,
//       color: cWhite,
//       child: Padding(
//         padding: const EdgeInsets.only(top: 5),
//         child: TextFontWidget(
//           text: text,
//           fontsize: 15,
//           fontWeight: FontWeight.w500,
//         ),
//       ),
//     );
//   }
// }
