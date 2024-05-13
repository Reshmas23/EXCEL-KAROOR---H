import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/google_poppins_widget.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';

addAttendance(BuildContext context) {
  final addAttendanceListWidget = [
    const BackButton(), //////////////////////..............0
    GooglePoppinsWidgets(
      text: "ADD ATTENDANCE",
      fontsize:ResponsiveWebSite.isMobile(context)?14: 17,
      fontWeight: FontWeight.bold,
    ), ////////////////................1
    Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GooglePoppinsWidgets(
          text: "SELECT CLASS",
          fontsize: ResponsiveWebSite.isMobile(context) ? 12 : 13,
          fontWeight: FontWeight.w500,
        ),
        SizedBox(
          height: 40,
          child: DropdownSearch<Map<String, dynamic>>(
            // asyncItems: (String filter) =>
            //     _addAttendanceController.fetchAllClass(),
            // itemAsString: (Map<String, dynamic> u) => u["className"],
            // onChanged: (Map<String, dynamic>? data) =>
            //     _addAttendanceController.selectClassData = data ?? {},
            dropdownDecoratorProps: const DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                  labelText: "Select Class", border: OutlineInputBorder()),
            ),
          ),
        ),
      ],
    ), //////////////...............2
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GooglePoppinsWidgets(
          text: "SELECT MONTH",
          fontsize: ResponsiveWebSite.isMobile(context) ? 12 : 13,
          fontWeight: FontWeight.w500,
        ),
        SizedBox(
          height: 40,
          child: DropdownSearch<Map<String, dynamic>>(
            // asyncItems: (String filter) =>
            //     _addAttendanceController.fetchAllMonths(),
            // itemAsString: (Map<String, dynamic> u) => u["id"],
            // onChanged: (Map<String, dynamic>? data) =>
            //     _addAttendanceController.selectMonthId =
            //         data?["id"] ?? "",
            dropdownDecoratorProps: const DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                  labelText: "Select Month", border: OutlineInputBorder()),
            ),
          ),
        ),
      ],
    ), //////////////////////////////..........3
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GooglePoppinsWidgets(
          text: ResponsiveWebSite.isMobile(context)
              ? "SELECT DATE"
              : "  SELECT DATE",
          fontsize: ResponsiveWebSite.isMobile(context) ? 12 : 13,
          fontWeight: FontWeight.w500,
        ),
        SizedBox(
          height: 40,
          child: TextFormField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: "Select Date"),
            readOnly: true,
            // controller: _addAttendanceController.dateTextController,
            // onTap: () async {
            //   if (_addAttendanceController.selectClassData.isNotEmpty ||
            //       _addAttendanceController.selectMonthId.isNotEmpty) {
            //     await _addAttendanceController.callDatePicker(
            //         context: context);
            //     await _addAttendanceController.fetchAllStudentsData();
            //   }
            // },
          ),
        ),
      ],
    ), ///////////////////////...........4
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GooglePoppinsWidgets(
          text: ResponsiveWebSite.isMobile(context)
              ? "SELECTPERIOD"
              : "  SELECT PERIOD",
          fontsize: ResponsiveWebSite.isMobile(context) ? 12 : 13,
          fontWeight: FontWeight.w500,
        ),
        SizedBox(
          height: 40,
          child: DropdownSearch<int>(
            // items: _addAttendanceController.periodLists,
            itemAsString: (int u) => u.toString(),
            onChanged: (int? data) {
              if (data != null) {
                //  _addAttendanceController.selectedPeriod = data;
              }
            },
            dropdownDecoratorProps: const DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                  labelText: "Select Period", border: OutlineInputBorder()),
            ),
          ),
        ),
      ],
    ), //////......5
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GooglePoppinsWidgets(
          text: ResponsiveWebSite.isMobile(context)
              ? "SELECT SUBJECT"
              : "  SELECT SUBJECT",
          fontsize: ResponsiveWebSite.isMobile(context) ? 12 : 13,
          fontWeight: FontWeight.w500,
        ),
        SizedBox(
          height: 40,
          child: DropdownSearch<Map<String, dynamic>>(
            // asyncItems: (String filter) =>
            //     _addAttendanceController.fetchAllSubjects(),
            // itemAsString: (Map<String, dynamic> u) => u["subjectName"],
            // onChanged: (Map<String, dynamic>? data) =>
            //     _addAttendanceController.selectedSubject = data ?? {},
            dropdownDecoratorProps: const DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                  labelText: "Select Subject", border: OutlineInputBorder()),
            ),
          ),
        ),
      ],
    ), ///////////////..........6
    ButtonBar(
      alignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 40,
          width: 160,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: themeColorBlue,
          ),
          child: Center(
              child: GooglePoppinsWidgets(
            text: "Submit",
            fontsize: 15,
            fontWeight: FontWeight.w500,
            color: cWhite,
          )),
        )
      ],
    ), /////....button....7
  ];
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: cWhite,
        content: SingleChildScrollView(
          child: SizedBox(
            width: 500,
            child: ResponsiveWebSite.isMobile(context)
                ? Column(
                    children: [
                      Row(
                        children: [
                          addAttendanceListWidget[0],

                          ///...back arrow
                          addAttendanceListWidget[1] /////......Heading
                        ],
                      ),
                      Padding(
                          padding: const EdgeInsets.only( top: 15, left: 7, right: 7, bottom: 7),
                          child: addAttendanceListWidget[ 2] ///////..........select class
                          ),
                      Padding(
                          padding: const EdgeInsets.only(
                              top: 7, left: 7, right: 7, bottom: 7),
                          child: addAttendanceListWidget[3] ////....select month
                          ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 7, bottom: 7, left: 7, right: 7),
                        child: SizedBox(
                            height: 60, child: addAttendanceListWidget[4]

                            ///...select date
                            ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(
                              top: 7, bottom: 7, left: 7, right: 7),
                          child: addAttendanceListWidget[
                              5] ///////....select peroid
                          ),
                      Padding(
                          padding: const EdgeInsets.only(
                              top: 7, bottom: 7, left: 7, right: 7),
                          child:
                              addAttendanceListWidget[6] ////....select subject
                          ),
                      Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: addAttendanceListWidget[7] /////.....sumbit
                          ),
                    ],
                  ) /////////////////////////////////////////////////////////////
                : Column(
                    children: [
                      Row(
                        children: [
                          addAttendanceListWidget[0],

                          ///...back arrow
                          addAttendanceListWidget[1] /////......Heading
                        ],
                      ),

                      Padding(
                          padding: const EdgeInsets.only(
                              top: 15, left: 15, right: 15),
                          child: addAttendanceListWidget[
                              2] ///////..........slect class
                          ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: SizedBox(
                          width: double.infinity,
                          height: 65,
                          child: Row(
                            children: [
                              Expanded(
                                  child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: SizedBox(
                                    height: 65,
                                    child: addAttendanceListWidget[
                                        3] ////....select month
                                    ),
                              )),
                              Expanded(
                                  child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: SizedBox(
                                    height: 65,
                                    child: addAttendanceListWidget[4]

                                    ///...select date
                                    ),
                              ))
                            ],
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: SizedBox(
                          width: double.infinity,
                          height: 65,
                          child: Row(
                            children: [
                              Expanded(
                                  child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: SizedBox(
                                    height: 65,
                                    child: addAttendanceListWidget[
                                        5] ///////....select peroid
                                    ),
                              )),
                              Expanded(
                                  child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: SizedBox(
                                    height: 65,
                                    child: addAttendanceListWidget[
                                        6] ////....select subject
                                    ),
                              ))
                            ],
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: addAttendanceListWidget[7] /////.....sumbit
                          ),
                    ],
                  ),
          ),
        ),
      );
    },
  );
}
