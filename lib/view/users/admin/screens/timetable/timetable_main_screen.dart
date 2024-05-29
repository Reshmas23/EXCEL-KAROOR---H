import 'dart:developer';

import 'package:awesome_side_sheet/Enums/sheet_position.dart';
import 'package:awesome_side_sheet/side_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/class_controller/class_controller.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/drop_down/select_class.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/timetable/period_wise_timetable.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';
import 'package:vidyaveechi_website/view/widgets/button_container/button_container.dart';
import 'package:vidyaveechi_website/view/widgets/loading_widget/loading_widget.dart';
import 'package:vidyaveechi_website/view/widgets/progess_button/progress_button.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';

import '../../../../../controller/timetable_controller/timetable_controller.dart';
import '../../../../drop_down/class_wise_subject.dart';
import '../../../../widgets/textformFiledContainer/textformFiledBlueContainer.dart';

class TimeTableMainScreen extends StatelessWidget {
  const TimeTableMainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final timetableCtrl = Get.put(TimeTableController());
    List<Widget> textformWidget = [
      const Padding(
        padding: EdgeInsets.only(top: 5, left: 10, right: 10),
        child: TextFontWidget(text: 'Select class *', fontsize: 12.5),
      ),
      Padding(
          padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
          child: SelectClassDropDown()),
      const Padding(
        padding: EdgeInsets.only(top: 15, left: 10, right: 10),
        child: TextFontWidget(text: 'Select Day *', fontsize: 12.5),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
        child: Obx(() => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
              width: 450,
              child: DropdownButton<String>(
                underline: Container(),
                isExpanded: true,
                value: timetableCtrl.dayName.value,
                onChanged: (String? newValue) {
                  timetableCtrl.dayName.value = newValue ?? '';
                },
                items: <String>[
                  'Select Day',
                  'Monday',
                  'Tuesday',
                  'Wednesday',
                  'Thursday',
                  'Friday',
                  'Saturday',
                  'Sunday',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            )),
      ),
      ////////////////////////////////////////////////////////1
      const Padding(
        padding: EdgeInsets.only(top: 15, left: 10, right: 10),
        child: TextFontWidget(text: 'Select subject *', fontsize: 12.5),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
        child: SelectClassWiseSubjectDropDown(),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
        child: TextFormFiledBlueContainerWidget(
          controller: timetableCtrl.periodController,
          width: ResponsiveWebSite.isMobile(context) ? double.infinity : 400,
          hintText: 'Period',
          title: 'Period',
          // onTap: () async {

          // },
        ),
      ), ///////////////////////////////////////////////2

      Padding(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: TextFormFiledBlueContainerWidget(
          controller: timetableCtrl.startTimeController,
          width: ResponsiveWebSite.isMobile(context) ? double.infinity : 400,
          hintText: 'Start time',
          title: 'Start time',
          validator: (value) {
            if (timetableCtrl.startTimeController.text.isEmpty) {
              return "Please select Time";
            } else {
              return null;
            }
          },
          onTap: () async {
            await timetableCtrl.selectTimesec(
                context, timetableCtrl.startTimeController);
          },

          // onTap: () async {

          // },
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: TextFormFiledBlueContainerWidget(
          controller: timetableCtrl.endTimeController,
          width: ResponsiveWebSite.isMobile(context) ? double.infinity : 400,
          hintText: 'End time',
          title: 'End time',
          onTap: () async {
            await timetableCtrl.selectTimesec(
                context, timetableCtrl.endTimeController);
          },
          // onTap: () async {

          // },
        ),
      ),
    ];

    return Obx(() => SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            color: screenContainerbackgroundColor,
            height:// ResponsiveWebSite.isMobile(context) ? 890 :
            650,
            width: 1200,
            padding: const EdgeInsets.only(top: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 20, top: 20),
                      child: TextFontWidget(
                        text: 'TimeTable',
                        fontsize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, right: 25),
                      child: GestureDetector(
                        onTap: () {
                          timetable_Creation(context, textformWidget);
                        },
                        child: ButtonContainerWidget(
                            curving: 30,
                            colorindex: 0,
                            height: 40,
                            width: 180,
                            child: const Center(
                              child: TextFontWidget(
                                text: 'Add TimeTable ',
                                fontsize: 14,
                                fontWeight: FontWeight.bold,
                                color: cWhite,
                              ),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: SizedBox(
                          height: 65,
                          width: 250,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const TextFontWidget(
                                  text: "Select Class *", fontsize: 12),
                              SizedBox(
                                  height: 40, child: SelectClassDropDown()),
                            ],
                          )),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: ResponsiveWebSite.isMobile(context) ? 20 : 10),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: cWhite,
                      height: //ResponsiveWebSite.isMobile(context) ? 750 :
                       540,
                      width: double.infinity,
                      child: StreamBuilder(
                          stream: server
                              .collection('SchoolListCollection')
                              .doc(UserCredentialsController.schoolId)
                              .collection(UserCredentialsController.batchId!)
                              .doc(UserCredentialsController.batchId!)
                              .collection('classes')
                              .doc(Get.find<ClassController>().classDocID.value)
                              .collection('timetables')
                              .orderBy('index', descending: false)
                              .snapshots(),
                          builder: (context, timesnaps) {
                            log("class id ${Get.find<ClassController>().classDocID.value}");
                            if (timesnaps.hasData) {
                              return timesnaps.data!.docs.isEmpty
                                  ? const Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            "Please select the class",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ],
                                    )
                                  : DefaultTabController(
                                      length: timesnaps.data!.docs.length,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 0, left: 20, right: 20),
                                            child: Column(
                                              children: [
                                                Container(
                                                  color: cWhite,
                                                  height: 40,
                                                  child: TabBar(
                                                    indicatorColor: cWhite,
                                                    tabAlignment:
                                                        TabAlignment.start,
                                                    isScrollable: true,
                                                    labelColor: Colors.blue,
                                                    labelStyle: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 12),
                                                    tabs: List.generate(
                                                      timesnaps
                                                          .data!.docs.length,
                                                      (index) => Tab(
                                                        text:
                                                            '${timesnaps.data!.docs[index].data()['docid']}',
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          // ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 0, left: 20, right: 20),
                                            child: Container(
                                              width: double.infinity,
                                              color:
                                                  screenContainerbackgroundColor,
                                              height: 02,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 0, left: 05, right: 05),
                                            child: Container(
                                              height: 480,
                                              color: cWhite,
                                              // color: Colors.amber,
                                              //// height: 300,
                                              child: TabBarView(
                                                children: List.generate(
                                                    timesnaps.data!.docs.length,
                                                    (index) =>
                                                        PeriodWiseTimeTable(
                                                          subjectID: timesnaps
                                                              .data!.docs[index]
                                                              .data()['docid'],
                                                          data: timesnaps
                                                              .data!.docs[index]
                                                              .data(),
                                                          docid: timesnaps
                                                              .data!.docs[index]
                                                              .data()['docid'],
                                                        )),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                            } else if (timesnaps.data == null) {
                              return const Center(
                                child: TextFontWidget(
                                    text: "No recordes found", fontsize: 16),
                              );
                            } else {
                              return const LoadingWidget();
                            }
                          }),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Future<void> timetable_Creation(
      BuildContext context, List<Widget> textformWidget) {
    final timetableCtrl = Get.put(TimeTableController());
    return aweSideSheet(
        context: context,
        sheetPosition: SheetPosition.right,
        header: Container(),
        body: Padding(
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Row(
                  children: [
                    BackButton(),
                    SizedBox(
                      width: 20,
                    ),
                    TextFontWidget(
                      text: 'Time Table',
                      fontsize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                SizedBox(
                    height: 800,
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      child:
                          //  Obx(() {
                          // return
                          Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            textformWidget[0],
                            textformWidget[1],
                            textformWidget[2],

                            textformWidget[3],
                            textformWidget[4],
                            textformWidget[5],
                            textformWidget[6],
                            textformWidget[7],
                            textformWidget[8],

                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              child: Center(
                                  child: ProgressButtonWidget(
                                      buttonstate:
                                          timetableCtrl.buttonstate.value,
                                      text: 'Submit',
                                      function: () {

                                        timetableCtrl
                                            .addTimeTableDataToFirebase(context);
                                      })
                                  //  NoticeButtonContainerWidget(
                                  //   text: 'Submit',
                                  //   width: 300,
                                  //   height: 50,
                                  //   fontSize: 18,
                                  //   onTap: () {
                                  //     timetableCtrl.addTimeTableDataToFirebase();
                                  //   },
                                  //   color: adminePrimayColor,
                                  // ),
                                  ),
                            )
                            // }),
                          ]),
                    )),
              ],
            ),
          ),
        ),
        showCloseButton: false,
        footer: Container());
  }
}

final List<String> weekdays = [
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
  'Sunday',
];

List<String> weekList = [
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
  'Sunday',
];
