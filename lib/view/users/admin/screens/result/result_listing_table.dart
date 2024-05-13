import 'package:flutter/material.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/result/widget/data_container_marks.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/students/student_details/widgets/category_tableHeader.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';

class AllResultStatusListView extends StatelessWidget {
  const AllResultStatusListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: cWhite,
        height: ResponsiveWebSite.isMobile(context) ? 420 : 500,
        width: double.infinity,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 8, bottom: 8, right: 10, left: 10),
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: CatrgoryTableHeaderWidget(headerTitle: 'No')),
                  SizedBox(
                    width: 01,
                  ),
                  Expanded(
                      flex: 12,
                      child: CatrgoryTableHeaderWidget(headerTitle: 'Name')),
                  SizedBox(
                    width: 01,
                  ),
                ],
              ),
            ),
            Expanded(
                child: SizedBox(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 5, right: 5),
                            child: ExamResultDataListContainer(index: index),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 02,
                          );
                        },
                        itemCount: 100)))
          ],
        ),
      ),
    );
  }
}

class ExamResultDataListContainer extends StatelessWidget {
  final int index;
  const ExamResultDataListContainer({
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        title: Row(
          children: [
            Expanded(
                flex: 1,
                child: DataContainerMarksWidget(
                    index: index,
                    headerTitle: "${index + 1}",
                    color: index % 2 == 0
                        ? const Color.fromARGB(255, 246, 246, 246)
                        : Colors.blue[50],
                    rowMainAccess: MainAxisAlignment.center)),
            Expanded(
              flex: 12,
              child: Container(
                  height: 30,
                  decoration: BoxDecoration(
                    color: index % 2 == 0
                        ? const Color.fromARGB(255, 246, 246, 246)
                        : Colors.blue[50],
                  ),
                  alignment: Alignment.centerLeft,
                  child:  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child:
                        TextFontWidget(text: "Name Of Student", fontsize: 13),
                  )),
            ),
          ],
        ),
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              height: 250,
              width: ResponsiveWebSite.isMobile(context)
                  ? 650
                  : ResponsiveWebSite.isTablet(context)
                      ? 800
                      : 1200,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                            flex: 3,
                            child: Container(
                              height: 25,
                              color: themeColorBlue,
                              alignment: Alignment.center,
                              child: TextFontWidget(
                                text: "Subject",
                                fontsize: 13,
                                color: cWhite,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                        Expanded(
                            flex: 2,
                            child: Container(
                              height: 25,
                              color: themeColorBlue,
                              alignment: Alignment.center,
                              child:  TextFontWidget(
                                text: "Optained Marks",
                                fontsize: 13,
                                color: cWhite,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                        Expanded(
                            flex: 2,
                            child: Container(
                              height: 25,
                              color: themeColorBlue,
                              alignment: Alignment.center,
                              child:  TextFontWidget(
                                text: "Total Marks",
                                fontsize: 13,
                                color: cWhite,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                        Expanded(
                            flex: 2,
                            child: Container(
                              height: 25,
                              color: themeColorBlue,
                              alignment: Alignment.center,
                              child:TextFontWidget(
                                text: "Percentage",
                                fontsize: 13,
                                color: cWhite,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                        Expanded(
                            flex: 2,
                            child: Container(
                              height: 25,
                              color: themeColorBlue,
                              alignment: Alignment.center,
                              child:  TextFontWidget(
                                text: "Status",
                                fontsize: 13,
                                color: cWhite,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 200,
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return SizedBox(
                            child: Row(
                              //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: DataContainerMarksWidget(
                                      rowMainAccess: MainAxisAlignment.center,
                                      color: cWhite,
                                      index: index,
                                      headerTitle: "Subject"),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: DataContainerMarksWidget(
                                      rowMainAccess: MainAxisAlignment.center,
                                      color: cWhite,
                                      index: index,
                                      headerTitle: "65" " Marks"),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: DataContainerMarksWidget(
                                      rowMainAccess: MainAxisAlignment.center,
                                      color: cWhite,
                                      index: index,
                                      headerTitle: "100" " Marks"),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: DataContainerMarksWidget(
                                      rowMainAccess: MainAxisAlignment.center,
                                      color: cWhite,
                                      index: index,
                                      headerTitle: "65" "%"),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: DataContainerMarksWidget(
                                      rowMainAccess: MainAxisAlignment.center,
                                      color: cWhite,
                                      index: index,
                                      headerTitle: "Passed"),
                                ),
                              ],
                            ),
                          );
                        },
                        itemCount: 10,
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
