import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/fees_N_bills_Controller/feeStudent_controller.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/drop_down/fees/select_day.dart';
import 'package:vidyaveechi_website/view/drop_down/fees/select_month.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/students/student_details/widgets/category_tile_container.dart';

class PerStudentFeesHistory extends StatelessWidget {
  PerStudentFeesHistory({
    super.key,
  });

  final studentFeeController = Get.put(StudentFeeController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40,
          width: 1200,
          color: Colors.blue.withOpacity(0.1),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFontWidget(
              text: 'Fees section',
              fontsize: 16,
              fontWeight: FontWeight.bold,
              color: cBlue,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
               Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: TextFontWidget(
                    text: 'Select Month  :  ',
                    fontsize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Expanded(flex: 3, child: SelectFeeMonthDropDown()),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
             Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: TextFontWidget(
                    text: 'Select Day  :  ',
                    fontsize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Expanded(flex: 3, child: SelectFeeMonthDateDropDown()),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                StudentCategoryTileContainer(
                    title: 'Fees Collected',
                    subTitle:
                        '${studentFeeController.totalStudentFee.value} / -',
                    color: Color.fromARGB(255, 121, 240, 125)),
                StudentCategoryTileContainer(
                    title: 'Pending Fees',
                    subTitle:
                        '${studentFeeController.unpaidStudentFee.value} / -',
                    color: Color.fromARGB(255, 234, 102, 92)),
                StudentCategoryTileContainer(
                    title: 'Total Fees',
                    subTitle:
                        '${studentFeeController.paidStudentFee.value} / -',
                    color: Color.fromARGB(255, 121, 123, 240))
              ],
            ),
          ),
        ),
        // Expanded(
        //   child: Column(
        //     children: [
        //       Padding(
        //         padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
        //         child: Container(
        //           color: cWhite,
        //           height: 40,
        //           child: const Row(
        //             children: [
        //               Expanded(
        //                   flex: 1,
        //                   child: CatrgoryTableHeaderWidget(headerTitle: 'No')),
        //               SizedBox(
        //                 width: 02,
        //               ),
        //               Expanded(
        //                   flex: 1,
        //                   child:
        //                       CatrgoryTableHeaderWidget(headerTitle: 'Month')),
        //               SizedBox(
        //                 width: 02,
        //               ),
        //               Expanded(
        //                   flex: 5,
        //                   child: CatrgoryTableHeaderWidget(
        //                       headerTitle: 'Subjects')),
        //               SizedBox(
        //                 width: 02,
        //               ),
        //               Expanded(
        //                   flex: 1,
        //                   child: CatrgoryTableHeaderWidget(
        //                       headerTitle: 'Fees Required')),
        //               SizedBox(
        //                 width: 02,
        //               ),
        //               Expanded(
        //                   flex: 1,
        //                   child: CatrgoryTableHeaderWidget(
        //                       headerTitle: 'Fess Collected')),
        //               SizedBox(
        //                 width: 02,
        //               ),
        //               Expanded(
        //                   flex: 1,
        //                   child: CatrgoryTableHeaderWidget(
        //                       headerTitle: 'Fess pending')),
        //               SizedBox(
        //                 width: 02,
        //               ),
        //               Expanded(
        //                   flex: 1,
        //                   child:
        //                       CatrgoryTableHeaderWidget(headerTitle: 'Status')),
        //               SizedBox(
        //                 width: 02,
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //       Expanded(
        //           child: SizedBox(
        //               child: ListView.separated(
        //                   itemBuilder: (context, index) {
        //                     return Padding(
        //                       padding:
        //                           const EdgeInsets.only(left: 10, right: 10),
        //                       child: FeesDataListContainer(index: index),
        //                     );
        //                   },
        //                   separatorBuilder: (context, index) {
        //                     return const SizedBox(
        //                       height: 02,
        //                     );
        //                   },
        //                   itemCount: 100)))
        //     ],
        //   ),
        // )
      ],
    );
  }
}
