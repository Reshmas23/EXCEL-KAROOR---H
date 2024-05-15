import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/students/student_details/widgets/category_tableHeader.dart';
import 'package:vidyaveechi_website/view/widgets/data_list_widgets/data_container.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';

class TotalTeacherViewContainer extends StatelessWidget {
  const TotalTeacherViewContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        height: ResponsiveWebSite.isMobile(context) ? 320 : 420,
        width: ResponsiveWebSite.isMobile(context) ? double.infinity : 450,
        decoration:
            BoxDecoration(color: cWhite, border: Border.all(color: cBlack.withOpacity(0.1))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25, left: 20),
              child: TextFontWidget(
                text: "All Teachers",
                fontsize: ResponsiveWebSite.isMobile(context) ? 12 : 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: AllTeacherStatusListView(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AllTeacherStatusListView extends StatelessWidget {
  const AllTeacherStatusListView({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool status = true.obs;
    return Column(
      children: [
        const Row(
          children: [
            Expanded(flex: 7, child: CatrgoryTableHeaderWidget(headerTitle: 'Tr Name')),
            SizedBox(
              width: 02,
            ),
            Expanded(flex: 5, child: CatrgoryTableHeaderWidget(headerTitle: 'incharge')),
            SizedBox(
              width: 02,
            ),
            Expanded(flex: 7, child: CatrgoryTableHeaderWidget(headerTitle: 'Current class')),
            SizedBox(
              width: 02,
            ),
            Expanded(flex: 6, child: CatrgoryTableHeaderWidget(headerTitle: 'Rate/hour')),
            SizedBox(
              width: 02,
            ),
            Expanded(flex: 6, child: CatrgoryTableHeaderWidget(headerTitle: 'Total hour')),
            SizedBox(
              width: 02,
            ),
            Expanded(flex: 4, child: CatrgoryTableHeaderWidget(headerTitle: 'Status')),
            SizedBox(
              width: 02,
            ),
          ],
        ),
        ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(
            height: 1,
          ),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 2,
          itemBuilder: (context, index) {
            return Container(
              height: 45,
              color: index % 2 == 0 ? const Color.fromARGB(255, 246, 246, 246) : Colors.blue[50],
              child: Row(
                children: [
                  Expanded(
                    flex: 7,
                    child: Center(
                      child: DataContainerWidget(
                          rowMainAccess: MainAxisAlignment.center,
                          color: cWhite,
                          // width: 150,
                          index: index,
                          headerTitle: '  rani'),
                    ), //....................No
                  ),
                  const SizedBox(
                    width: 02,
                  ),
                  Expanded(
                    flex: 5,
                    child: Center(
                      child: DataContainerWidget(
                          rowMainAccess: MainAxisAlignment.center,
                          color: cWhite,
                          index: index,
                          headerTitle: 'XI'),
                    ),
                  ), //................................................. Months
                  const SizedBox(
                    width: 02,
                  ),
                  Expanded(
                    flex: 7,
                    child: Center(
                      child: DataContainerWidget(
                        rowMainAccess: MainAxisAlignment.center,
                        color: cWhite,
                        index: index,
                        headerTitle: 'X',
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 02,
                  ),
                  Expanded(
                    flex: 6,
                    child: Container(
                      color: index % 2 == 0
                          ? const Color.fromARGB(255, 246, 246, 246)
                          : Colors.blue[50],
                      child: Center(
                        child: DataContainerWidget(
                          rowMainAccess: MainAxisAlignment.center,
                          color: cWhite,
                          index: index,
                          headerTitle: "100",
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 02,
                  ),
                  Expanded(
                    flex: 6,
                    child: Center(
                      child: DataContainerWidget(
                        rowMainAccess: MainAxisAlignment.center,
                        color: cWhite,
                        index: index,
                        headerTitle: "10",
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 02,
                  ),
                  Expanded(
                    flex: 4,
                    child: GestureDetector(
                      onTap: () {
                        // status.value == true ? status.value = false : status.value = true;
                      },
                      child: Obx(
                        () => SizedBox(
                          width: 10,
                          height: 20,
                          child: Image.asset(
                            status.value == true
                                ? 'webassets/png/active.png'
                                : 'webassets/png/shape.png',
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 02,
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
