import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/therapy_controller/therapy_controller.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/constant/constant.validate.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/result/widget/data_container_marks.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/therapy_management/therapy_home.dart';
import 'package:vidyaveechi_website/view/widgets/data_list_widgets/tableheaderWidget.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';
import 'package:vidyaveechi_website/view/widgets/routeSelectedTextContainer/routeSelectedTextContainer.dart';
import 'package:vidyaveechi_website/view/widgets/routeSelectedTextContainer/route_NonSelectedContainer.dart';
import 'package:vidyaveechi_website/view/widgets/textformFiledContainer/textformFiledBlueContainer.dart';

class TherapyManagement extends StatelessWidget {
  const TherapyManagement({super.key});
  @override
  Widget build(BuildContext context) {
    TherapyController therapycontroller = Get.put(TherapyController());
    return Obx(() => therapycontroller.therapyhome == true
        ? const TherapyHomePage()
        : SingleChildScrollView(
            child: Container(
              color: screenContainerbackgroundColor,
              height: ResponsiveWebSite.isMobile(context) ? 840 : 820,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 25, top: 25),
                    child: TextFontWidget(
                      text: 'All Students Therapy List ',
                      fontsize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                            onTap: () {
                              therapycontroller.therapyhome.value = true;
                            },
                            child: const RouteSelectedTextContainer(width: 50, title: 'Home')),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                            onTap: () {},
                            child: const RouteNonSelectedTextContainer(
                                width: 100, title: 'Therapy List')),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 250,
                                    height: ResponsiveWebSite.isMobile(context) ? 80 : 100,
                                    color: cWhite,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                                      child: TextFormFiledBlueContainerWidget(
                                        // controller: studentController.stNameController,
                                        hintText: "Enter Therapy Type",
                                        title: 'Therapy Type ',
                                        validator: checkFieldEmpty,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 580,
                              width: ResponsiveWebSite.isMobile(context) ? double.infinity : 1300,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    const Row(
                                      children: [
                                        Expanded(
                                            flex: 1, child: TableHeaderWidget(headerTitle: 'No')),
                                        SizedBox(
                                          width: 1,
                                        ),
                                        Expanded(
                                            flex: 1,
                                            child: ResultTableHeaderWidget(headerTitle: "ID .")),
                                        SizedBox(
                                          width: 1,
                                        ),
                                        Expanded(
                                            flex: 3,
                                            child: ResultTableHeaderWidget(
                                                headerTitle: "Student Name")),
                                        SizedBox(
                                          width: 1,
                                        ),
                                        Expanded(
                                            flex: 2,
                                            child: ResultTableHeaderWidget(headerTitle: "Date")),
                                        SizedBox(
                                          width: 1,
                                        ),
                                        Expanded(
                                            flex: 2,
                                            child: ResultTableHeaderWidget(headerTitle: "Therapy")),
                                        SizedBox(
                                          width: 1,
                                        ),
                                        Expanded(
                                            flex: 2,
                                            child: ResultTableHeaderWidget(
                                                headerTitle: "Status/Comment")),
                                        SizedBox(
                                          width: 1,
                                        ),
                                        Expanded(
                                            flex: 2,
                                            child:
                                                ResultTableHeaderWidget(headerTitle: " Follow-up")),
                                        SizedBox(
                                          width: 1,
                                        ),
                                        Expanded(
                                            flex: 2,
                                            child: ResultTableHeaderWidget(
                                                headerTitle: "Therapy Duration")),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 500,
                                      child: ListView.separated(
                                        itemBuilder: (context, index) {
                                          return SizedBox(
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: DataContainerMarksWidget(
                                                      rowMainAccess: MainAxisAlignment.center,
                                                      color: cWhite,
                                                      index: index,
                                                      headerTitle: "${index + 1}"),
                                                ),
                                                const SizedBox(
                                                  width: 1,
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: DataContainerMarksWidget(
                                                      rowMainAccess: MainAxisAlignment.center,
                                                      color: cWhite,
                                                      index: index,
                                                      headerTitle: " 32"),
                                                ),
                                                const SizedBox(
                                                  width: 1,
                                                ),
                                                Expanded(
                                                  flex: 3,
                                                  child: DataContainerMarksWidget(
                                                      rowMainAccess: MainAxisAlignment.center,
                                                      color: cWhite,
                                                      index: index,
                                                      headerTitle: " Student Full Name"),
                                                ),
                                                const SizedBox(
                                                  width: 1,
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: DataContainerMarksWidget(
                                                      rowMainAccess: MainAxisAlignment.center,
                                                      color: cWhite,
                                                      index: index,
                                                      headerTitle: " 23/04/2024"),
                                                ),
                                                const SizedBox(
                                                  width: 1,
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: Container(
                                                    height: 30,
                                                    decoration: BoxDecoration(
                                                      color: index % 2 == 0
                                                          ? const Color.fromARGB(255, 246, 246, 246)
                                                          : Colors.blue[50],
                                                    ),
                                                    child: DropdownSearch(
                                                      items: const [
                                                        'Physio Theray',
                                                        'Mental Therapy'
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 1,
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: DataContainerMarksWidget(
                                                      rowMainAccess: MainAxisAlignment.center,
                                                      color: cWhite,
                                                      index: index,
                                                      headerTitle: " Present"),
                                                ),
                                                const SizedBox(
                                                  width: 1,
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: DataContainerMarksWidget(
                                                      rowMainAccess: MainAxisAlignment.center,
                                                      color: cWhite,
                                                      index: index,
                                                      headerTitle: "--"),
                                                ),
                                                const SizedBox(
                                                  width: 1,
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: DataContainerMarksWidget(
                                                      rowMainAccess: MainAxisAlignment.center,
                                                      color: cWhite,
                                                      index: index,
                                                      headerTitle: "--"),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                        itemCount: 5,
                                        separatorBuilder: (context, index) => const SizedBox(
                                          height: 1,
                                        ),
                                      ),
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
          ));
  }
}
