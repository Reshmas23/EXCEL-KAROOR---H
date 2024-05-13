import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/app_bar/academic_year/add_academic.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';

import '../../../../../controller/batch_yearController/batch_year_Controller.dart';
import '../../../../drop_down/batch_year/batch_year.dart';

academicYearSettingFunction(BuildContext context) {
  final BatchYearController batchYearController=Get.put(BatchYearController());
  final academicYearListWidegt = [
    GestureDetector(
      onTap: () {
        addAcademicYearFunction(context);
      },
      child: Container(
        height: 40,
        width: 150,
        decoration: BoxDecoration(
            color: themeColorBlue,
            border: Border.all(color: themeColorBlue),
            borderRadius: BorderRadius.circular(05)),
        child: const Center(
          child: TextFontWidgetRouter(
            text: "Add Academic Year",
            fontsize: 14,
            // fontWeight: FontWeight.w600,
            color: cWhite,
          ),
        ),
      ),
    ), ///////////////////////.......0
    GestureDetector(
      onTap: () {
        if(batchYearController .formKey.currentState! .validate()){
      batchYearController .setBatchYear() ;
        }
      },
      child: Container(
        height: 40,
        width: 150,
        decoration: BoxDecoration(
            color: themeColorBlue,
            border: Border.all(color: themeColorBlue),
            borderRadius: BorderRadius.circular(05)),
        child: const Center(
          child: TextFontWidgetRouter(
            text: "Set Academic Year",
            fontsize: 14,
            // fontWeight: FontWeight.w600,
            color: cWhite,
          ),
        ),
      ),
    ), ////////////////...............1
    GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        height: 40,
        width: 150,
        decoration: BoxDecoration(
            color: themeColorBlue,
            border: Border.all(color: themeColorBlue),
            borderRadius: BorderRadius.circular(05)),
        child: const Center(
          child: TextFontWidgetRouter(
            text: "Cancel",
            fontsize: 14,
            // fontWeight: FontWeight.w600,
            color: cWhite,
          ),
        ),
      ),
    ), //////////////////.............2
  ];
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title:  TextFontWidget(text: "Academic Year", fontsize: 15),
        backgroundColor: cWhite,
        content: SizedBox(
          height: ResponsiveWebSite.isMobile(context)? 240: 170,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Form(
                key: batchYearController.formKey,
                child: SizedBox(
                  height: 95,
                  // color: cWhite,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       TextFontWidget(
                          text: 'Select Academic Year*', fontsize: 12.5),
                      const SizedBox(
                        height: 05,
                      ),
                      SelectBatchYearDropDown()
                    ],
                  ),
                ),
              ),
              ResponsiveWebSite.isMobile(context)
                  ? Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: academicYearListWidegt[
                                0] ///////////////............add year
                            ),
                        Padding(
                            padding: const EdgeInsets.all(4.0),
                            child:
                                academicYearListWidegt[1] //////........set year
                            ),
                        Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: academicYearListWidegt[
                                2] ///////////////////.............cancel
                            ),
                      ],
                    )
                  : Row(
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: academicYearListWidegt[
                                0] ///////////////............add year
                            ),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:
                                academicYearListWidegt[1] //////........set year
                            ),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: academicYearListWidegt[
                                2] ///////////////////.............cancel
                            ),
                      ],
                    ),
            ],
          ),
        ),
      );
    },
  );
}
