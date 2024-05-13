import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/meeting_controller/meeting_controller.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/constant/constant.validate.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/meeting/all_meeting_list.dart';
import 'package:vidyaveechi_website/view/widgets/progess_button/progress_button.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';
import 'package:vidyaveechi_website/view/widgets/routeSelectedTextContainer/routeSelectedTextContainer.dart';
import 'package:vidyaveechi_website/view/widgets/routeSelectedTextContainer/route_NonSelectedContainer.dart';
import 'package:vidyaveechi_website/view/widgets/textformFiledContainer/textformFiledContainer.dart';

class CreateMeetinPage extends StatelessWidget {
  final MeetingController meetingController = Get.put(MeetingController());
  CreateMeetinPage({
    Key? key,
    // required this.schoolID
  }) : super(key: key);

  // String schoolID;

  @override
  Widget build(BuildContext context) {
    List<Widget> meetingListWidget = [
       TextFontWidget(
        text: "SCHEDULE MEETING",
        fontsize: 19,
        fontWeight: FontWeight.bold,
      ), //...0

      const ContainerTitleWidget(text: "Topic"), //////.....1

      TextFormFiledContainerWidget(
          controller: meetingController.topicController,
          validator: checkFieldEmpty,
          hintText: "Enter Topic Here",
          title: '',
          width: ResponsiveWebSite.isMobile(context)
              ? 210
              : ResponsiveWebSite.isTablet(context)
                  ? 300
                  : 450), //////////topic field......2

      const ContainerTitleWidget(text: "When"), //////.3
       TextFormFiledContainerWidget(
        onTap: () {
          meetingController.selectDate(context,  meetingController.dateController);
        },
          controller: meetingController.dateController,
          validator: checkFieldDateIsValid,
          hintText: "Date",
          title: '',
          width: ResponsiveWebSite.isTablet(context) ? 140 : 210), 
      
      /////////////////////////////////////////////////////////////////////...4
      TextFormFiledContainerWidget(
          controller: meetingController.timeController,
          validator: checkFieldEmpty,
          hintText: "Time",
          title: '',
          width: ResponsiveWebSite.isTablet(context) ? 140 : 210), /////....5

      const ContainerTitleWidget(text: "Category"), /////////.........6

      TextFormFiledContainerWidget(
          controller: meetingController.categoryController,
          validator: checkFieldEmpty,
          hintText: "Enter Category Here",
          title: '',
          width: ResponsiveWebSite.isMobile(context)
              ? 210
              : ResponsiveWebSite.isTablet(context)
                  ? 300
                  : 450), //////.....7
      const ContainerTitleWidget(text: "Members"), ////////////////,,,8

      TextFormFiledContainerWidget(
          controller: meetingController.memberController,
          validator: checkFieldEmpty,
          hintText: "Expected Members",
          title: '',
          width: ResponsiveWebSite.isTablet(context) ? 140 : 210), ///////9

      TextFormFiledContainerWidget(
          validator: checkFieldEmpty,
          controller: meetingController.specialguestController,
          hintText: "Special Guest",
          title: '',
          width: ResponsiveWebSite.isTablet(context) ? 140 : 210), //////////10

      const ContainerTitleWidget(text: "Venue"), ///////////////////11

      TextFormFiledContainerWidget(
          controller: meetingController.venueController,
          validator: checkFieldEmpty,
          hintText: "Enter Venue Here",
          title: '',
          width: ResponsiveWebSite.isMobile(context)
              ? 210
              : ResponsiveWebSite.isTablet(context)
                  ? 300
                  : 450), //////////////////12

      Obx(() => ProgressButtonWidget(
          function: () async {
            if (meetingController .formKey .currentState! .validate()) {
              meetingController.createMeeting();
            }
          },
          buttonstate: meetingController.buttonstate.value,
          text: 'Create Meeting')),
      // GestureDetector(
      //   onTap: () {
      //     if (meetingController.formKey.currentState!.validate()) {
      //       meetingController.createMeeting();
      //       print("object");
      //     }
      //   },
      //   child: Container(
      //     height: 35,
      //     width: 120,
      //     decoration: const BoxDecoration(
      //         borderRadius: BorderRadius.all(Radius.circular(8)), color: themeColorBlue),
      //     child: const Center(
      //         child: TextFontWidget(
      //       text: "Submit",
      //       fontsize: 15,
      //       fontWeight: FontWeight.bold,
      //       color: cWhite,
      //     )),
      //   ),
      // ), ////////////////////////13
      Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Checkbox(
              value: true,
              onChanged: (value) {},
            ),
            TextFontWidget(text: "Students", fontsize: 12),
            Checkbox(
              value: true,
              onChanged: (value) {},
            ),
            TextFontWidget(text: "Parents", fontsize: 12),
            Checkbox(
              value: true,
              onChanged: (value) {},
            ),
            TextFontWidget(text: "Teachers", fontsize: 12),
          ],
        ),
      ) ///////////////////14
    ];
    return SingleChildScrollView(
    //  scrollDirection: Axis.horizontal,
      child: Container(
        color: screenContainerbackgroundColor,
        height: 800,
        width: 1200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Padding(
              padding: EdgeInsets.only(left: 25, top: 25),
              child: TextFontWidget(
                text: 'Create Meeting',
                fontsize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      meetingController.ontapMeeting.value = false;
                    },
                    child: const RouteNonSelectedTextContainer(title: 'Home'),
                  ),
                  // const Spacer(),
                  const RouteSelectedTextContainer(
                      width: 140, title: 'Create Meeting '),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              color: cWhite,
              height: 560,
              alignment: Alignment.topLeft,
              child: ResponsiveWebSite.isMobile(context)
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            height: 550,
                            width: 280,
                            // decoration: BoxDecoration(border: Border.all(width: 2,color: Colors.grey.withOpacity(0.2)),
                            // boxShadow: const [BoxShadow(blurRadius: 2)],
                            color: cWhite,
                            //  ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                meetingListWidget[
                                    0], ///////////////////////heading.........................0
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: meetingListWidget[
                                            1] //////////////////topic.........................1,
                                        ),
                                    meetingListWidget[2] //////////topic field
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: meetingListWidget[3]),
                                    Column(
                                      children: [
                                        meetingListWidget[4], //////......date
                                        meetingListWidget[5], /////....time
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: meetingListWidget[
                                            6] ////.....category
                                        ),
                                    meetingListWidget[
                                        7] //////////////..........................categroy field
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: meetingListWidget[
                                            8] ///////////////////............members
                                        ),
                                    Column(
                                      children: [
                                        meetingListWidget[
                                            9], ////////...........expected members
                                        meetingListWidget[
                                            10], /////////special guest
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: meetingListWidget[11], ///////venu
                                    ),
                                    meetingListWidget[
                                        12] /////////////////venu field
                                  ],
                                ),
                                //  meetingListWidget[14],

                                Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: meetingListWidget[
                                          13] /////////////////button
                                      ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ) ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 65.0, top: 35, right: 65),
                          child: Container(
                            height: 450,
                            width:
                                ResponsiveWebSite.isTablet(context) ? 400 : 600,
                            // decoration: BoxDecoration(border: Border.all(width: 2,color: Colors.grey.withOpacity(0.2)),
                            // boxShadow: const [BoxShadow(blurRadius: 2)],
                            color: cWhite,
                            //  ),
                            child: Form(
                              key: meetingController.formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  meetingListWidget[
                                      0], ///////////////////////heading.........................0
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.only(top: 20),
                                          child: meetingListWidget[
                                              1] //////////////////topic.........................1
                                          ),
                                      meetingListWidget[2] //////////topic field
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.only(top: 20),
                                          child: meetingListWidget[
                                              3] ///////.......whwn
                                          ),
                                      meetingListWidget[4], //////......date
                                      meetingListWidget[5], /////....time
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.only(top: 20),
                                          child: meetingListWidget[
                                              6] ////.....category
                                          ),
                                      meetingListWidget[
                                          7] /////////....category field
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.only(top: 20),
                                          child: meetingListWidget[
                                              8] ///////////////////............member
                                          ),
                                      meetingListWidget[
                                          9], ////////...........expected members
                                      meetingListWidget[
                                          10], /////////special guest
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: meetingListWidget[11], ///////venue
                                      ),
                                      meetingListWidget[
                                          12] /////////////////venu field
                                    ],
                                  ),
                                  //  meetingListWidget[14],
                              
                                  Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: meetingListWidget[
                                            13] /////////////////button
                                        ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class TextFormFiledBlueContainerWidgetMeeting extends StatelessWidget {
  TextEditingController? controller = TextEditingController();
  final String title;
  final String hintText;
  final Widget? widget;
  final double? width;
  Function(String)? onChanged;
  Iterable<String>? autofillHints;
  String? Function(String?)? validator;
  Function()? onTap;
  TextInputType? keyboardType;
  TextFormFiledBlueContainerWidgetMeeting({
    this.width,
    this.widget,
    required this.hintText,
    required this.title,
    this.keyboardType,
    this.controller,
    this.autofillHints,
    this.onChanged,
    this.validator,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 350,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFontWidget(text: '$title *', fontsize: 12.5),
              widget == null ? const SizedBox() : widget!,
            ],
          ),
          const SizedBox(
            height: 05,
          ),
          Container(
            // height: 40,
            width: width,
            color: screenContainerbackgroundColor,
            child: Center(
              child: TextFormField(
                onChanged: onChanged,
                autofillHints: autofillHints,
                onTap: onTap,
                validator: validator,
                keyboardType: keyboardType,
                controller: controller,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 01, horizontal: 01),
                  errorBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0)),
                      borderSide: BorderSide(
                        width: 1,
                        style: BorderStyle.none,
                        color: Colors.red,
                      )),
                  focusedErrorBorder: const OutlineInputBorder(
                    // borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(
                      width: 1,
                      style: BorderStyle.none,
                      color: Colors.red,
                    ),
                  ),
                  // contentPadding: const EdgeInsets.all(8.0),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(width: 0.4)),
                  hintStyle: const TextStyle(fontSize: 13),
                  hintText: hintText,
                  focusedBorder: const OutlineInputBorder(
                    //<-- SEE HERE
                    borderSide: BorderSide(width: 1, color: Colors.green),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
