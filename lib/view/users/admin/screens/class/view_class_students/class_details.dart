import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/class_controller/class_controller.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/widgets/data_list_widgets/tableheaderWidget.dart';
import 'package:vidyaveechi_website/view/widgets/routeSelectedTextContainer/routeSelectedTextContainer.dart';
import 'package:vidyaveechi_website/view/widgets/routeSelectedTextContainer/route_NonSelectedContainer.dart';

class ViewClassStudentScreen extends StatelessWidget {
  const ViewClassStudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // List<Widget> widgetlist = [];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        height: 1000,
        width: 1200,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 25, top: 25),
              child: SizedBox(
                height: 60,
                width: double.infinity,
                child: TextFontWidget(
                  text: 'Classes Student List',
                  fontsize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 05, right: 05),
                    child: GestureDetector(
                      onTap: () =>
                          Get.find<ClassController>().ontapClass.value = false,
                      child: const RouteNonSelectedTextContainer(
                          title: 'All Classes'),
                    ),
                  ),
                  const RouteSelectedTextContainer(title: 'Class Students'),
                ],
              ),
            ),
            const Row(
              children: [
                Expanded(flex: 1, child: TableHeaderWidget(headerTitle: 'No')),
                SizedBox(
                  width: 01,
                ),
                Expanded(
                    flex: 4, child: TableHeaderWidget(headerTitle: 'Class')),
                SizedBox(
                  width: 01,
                ),
                Expanded(
                    flex: 2,
                    child: TableHeaderWidget(headerTitle: 'TotalStudents')),
                SizedBox(
                  width: 01,
                ),
                Expanded(
                    flex: 3, child: TableHeaderWidget(headerTitle: 'Status')),
                SizedBox(
                  width: 01,
                ),
                Expanded(
                    flex: 1, child: TableHeaderWidget(headerTitle: 'Options')),
                SizedBox(
                  width: 01,
                ),
              ],
            ),
            // Expanded(
            //     child: SizedBox(
            //         width: 1200,
            //         child: ListView.separated(
            //             itemBuilder: (context, index) {
            //               return ClassDataListWidget(
                            
            //                 index: index,
            //               );
            //             },
            //             separatorBuilder: (context, index) {
            //               return const SizedBox(
            //                 height: 02,
            //               );
            //             },
            //             itemCount: 100)))
          ],
        ),
      ),
    );
  }
}
