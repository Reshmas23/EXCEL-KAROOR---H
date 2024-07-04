import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/therapy_controller/therapy_controller.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/widgets/data_list_widgets/tableheaderWidget.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';

class TherapyHomePage extends StatelessWidget {
  const TherapyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    TherapyController therapycontroller = Get.put(TherapyController());
    return SingleChildScrollView(
      child: Container(
        color: screenContainerbackgroundColor,
        height: ResponsiveWebSite.isMobile(context) ? 840 : 840,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 25),
                  child: InkWell(
                    onTap: () {
                      therapycontroller.therapyhome.value = false;
                    },
                    child: const TextFontWidget(
                      text: 'All Therapy',
                      fontsize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: InkWell(
                    onTap: () {
                      // therapycontroller.therapyhome.value = false;
                    },
                    child: const TextFontWidget(
                      text: 'Add Students',
                      fontsize: 18,
                      fontWeight: FontWeight.bold,
                      color: cred,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: ResponsiveWebSite.isMobile(context) ? 20 : 50),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: cWhite,
                  height: ResponsiveWebSite.isMobile(context) ? 750 : 700,
                  width: double.infinity,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 580,
                        width: ResponsiveWebSite.isMobile(context) ? double.infinity : 1300,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(flex: 1, child: TableHeaderWidget(headerTitle: 'No')),
                                  SizedBox(
                                    width: 1,
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: ResultTableHeaderWidget(
                                          headerTitle: "Types of therapies")),
                                  SizedBox(
                                    width: 1,
                                  ),
                                  Expanded(
                                      flex: 3,
                                      child: ResultTableHeaderWidget(headerTitle: "Description")),
                                  SizedBox(
                                    width: 1,
                                  ),
                                  Expanded(
                                      flex: 2,
                                      child: ResultTableHeaderWidget(headerTitle: "Remedy")),
                                  SizedBox(
                                    width: 1,
                                  ),
                                  Expanded(
                                      flex: 2,
                                      child: ResultTableHeaderWidget(headerTitle: "Duration")),
                                  SizedBox(
                                    width: 1,
                                  ),
                                  Expanded(
                                      flex: 2,
                                      child:
                                          ResultTableHeaderWidget(headerTitle: "Total students")),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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
