import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/subject/create_subject/subject_dispaly_tble.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/subject/manage_subject/add_subject_function.dart';
import 'package:vidyaveechi_website/view/widgets/button_container/button_container.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';
import 'package:vidyaveechi_website/view/widgets/routeSelectedTextContainer/routeSelectedTextContainer.dart';
import 'package:vidyaveechi_website/view/widgets/routeSelectedTextContainer/route_NonSelectedContainer.dart';

class CreateSubject extends StatelessWidget {
  const CreateSubject({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: screenContainerbackgroundColor,
      height: ResponsiveWebSite.isMobile(context) ? 1200 : 820,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ResponsiveWebSite.isMobile(context)
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   Padding(
                      padding: EdgeInsets.only(left: 25, top: 25),
                      child: TextFontWidget(
                        text: 'Create A New Subject',
                        fontsize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: 08,
                              right: 05,
                            ),
                            child: RouteNonSelectedTextContainer(title: 'Home'),
                          ),
                          RouteSelectedTextContainer(
                              width: 140, title: 'Create Subject'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: SingleChildScrollView(
                        child: Container(
                          height: 1000,
                          color: cWhite,
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                   Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 10, top: 10, bottom: 40),
                                      child: TextFontWidget(
                                        text: '',
                                        fontsize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, left: 20, bottom: 20),
                                        child: GestureDetector(
                                          onTap: () {
                                            addSubjectFunction(context);
                                          },
                                          child: Container(
                                            height: 35,
                                            width: 120,
                                            decoration: BoxDecoration(
                                                color: themeColorBlue,
                                                border: Border.all(
                                                    color: themeColorBlue),
                                                borderRadius:
                                                    BorderRadius.circular(05)),
                                            child:  Center(
                                              child: TextFontWidget(
                                                text: "Add Subject",
                                                fontsize: 14,
                                                // fontWeight: FontWeight.w600,
                                                color: cWhite,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 20, top: 0),
                                child: Container(
                                  height: 70,
                                  color: cWhite,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                       TextFontWidget(
                                          text: 'Select Class *',
                                          fontsize: 12.5),
                                      const SizedBox(
                                        height: 05,
                                      ),
                                      SizedBox(
                                        height: 40,
                                        child: DropdownSearch(
                                          items: const ['XI', 'XII'],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 300,
                                width: double.infinity,
                                child: SubjectDisplayTable(),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ) ////////////////////////////////////////////////////////////////////////////////.....................................
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 25, top: 25),
                      child: TextFontWidget(
                        text: 'Create A New Subject',
                        fontsize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          // Padding(
                          //   padding: EdgeInsets.only(
                          //     left: 08,
                          //     right: 05,
                          //   ),
                          //   child: RouteNonSelectedTextContainer(title: 'Home'),
                          // ),
                          // RouteSelectedTextContainer(width: 140, title: 'Create Subject'),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 08,
                            right: 05,
                          ),
                          child: RouteNonSelectedTextContainer(title: 'Home'),
                        ),
                        const RouteSelectedTextContainer(
                            width: 140, title: 'Create Subject'),
                        const Expanded(
                            flex: 1,
                            child: SizedBox(
                              height: 10,
                            )),
                        Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 0, left: 20, bottom: 15),
                              child: GestureDetector(
                                onTap: () {
                                  addSubjectFunction(context);
                                },
                                child: ButtonContainerWidget(
                                  curving: 30,
                                  colorindex: 0,
                                  height: 40,
                                  width: 180,
                                  child:  Center(
                                    child: TextFontWidget(
                                      text: 'Create / E D I T',
                                      fontsize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: cWhite,
                                    ),
                                  )),
                              ),
                            )),
                        Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 20, top: 0),
                              child: SizedBox(
                                height: 100,
                                //  color: cWhite,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                     TextFontWidget(
                                        text: 'Select Class *', fontsize: 12.5),
                                    const SizedBox(
                                      height: 05,
                                    ),
                                    SizedBox(
                                      height: 40,
                                      child: DropdownSearch(
                                        items: const ['XI', 'XII'],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        color: cWhite,
                        height: 650,
                        width: double.infinity,
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                height: 500,
                                width:ResponsiveWebSite.isMobile(context)? double.infinity:650,
                                child: const SubjectDisplayTable()),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
        ],
      ),
    );
  }
}
