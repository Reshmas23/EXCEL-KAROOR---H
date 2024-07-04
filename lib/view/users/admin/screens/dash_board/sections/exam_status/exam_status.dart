
import 'package:flutter/material.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/dash_board/sections/exam_status/exam_status_graph.dart';
import 'package:vidyaveechi_website/view/web_DashBoard/pages/video_management/presentation/pages/widgets/video_widgets.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';

import '../../../../../../colors/colors.dart';

class ExamStatusContainer extends StatelessWidget {
  const ExamStatusContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ResponsiveWebSite.isMobile(context) ? 420 : 500,
      width: double.infinity,
      decoration: BoxDecoration(
          color: cWhite, border: Border.all(color: cBlack.withOpacity(0.1))),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             const Padding(
              padding: EdgeInsets.only(top: 10, left: 20, bottom: 05),
              child: TextFontWidget(
                text: "Exam Results Analyser",
                fontsize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SingleChildScrollView(scrollDirection: Axis.horizontal,
              child: SizedBox(
                height: ResponsiveWebSite.isMobile(context) ? 300 : 400,
                width: ResponsiveWebSite.isMobile(context) ?500:1200,
                child:  ExamStatusGraph(),
              ),
            ),
            SizedBox(
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Container(
                              height: 04,
                              width: 60,
                              color: const Color.fromARGB(255, 48, 79, 254),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10, top: 05),
                            child: TextFontWidget(
                              text: 'Total Students',
                              fontsize: 11.5,
                              color: Colors.black.withOpacity(0.8),
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.only(top: 06),
                          //   child: TextFontWidget(
                          //     text: '500',
                          //     fontsize: 12,
                          //     color: Colors.black.withOpacity(0.4),
                          //   ),
                          // )
                        ],
                      ),
                      Container(
                        width: 01,
                        color: Colors.grey,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Container(
                              height: 04,
                              width: 60,
                              color: const Color.fromARGB(255, 255, 166, 1),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, top: 05),
                            child: TextFontWidget(
                              text: 'Pass Level',
                              fontsize: 11.5,
                              color: Colors.black.withOpacity(0.8),
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.only(top: 06),
                          //   child: TextFontWidget(
                          //     text: '500',
                          //     fontsize: 12,
                          //     color: Colors.black.withOpacity(0.4),
                          //   ),
                          // )
                        ],
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
