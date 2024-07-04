import 'dart:developer';
import 'package:flutter/material.dart';
// ignore_for_file: must_be_immutable
import 'package:dropdown_search/dropdown_search.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/google_poppins_widget.dart';
import 'package:vidyaveechi_website/view/web_DashBoard/controller/dashboard_Controllers.dart';
import 'package:vidyaveechi_website/view/web_DashBoard/pages/client_management/client/headerText_widget.dart';
import 'package:vidyaveechi_website/view/web_DashBoard/pages/client_management/client_list_screen.dart';

import 'client_create.dart';

class ClientDetailsScreen extends StatelessWidget {
  const ClientDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 750,
      color: cGrey.withOpacity(0.1),
      child: Column(
        children: [
          SizedBox(
            height: 100,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 20),
                      child: GooglePoppinsWidgets(
                          text: 'CLIENT DETAILS',
                          fontsize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 20, top: 10),
                      child: GestureDetector(
                        onTap: () async {
                          await clientDetails(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: cBlue),
                          height: 40,
                          width: 140,
                          child: Center(
                            child: GooglePoppinsWidgets(
                              text: 'Client Creation',
                              fontsize: 12,
                              color: cWhite,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                color: cWhite,
                child: Column(
                  children: [ClientsListHeaderWidget(), ListOFClientScreen()],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ClientsListHeaderWidget extends StatelessWidget {
  DashBoardControllers dashBoardControllers = Get.put(DashBoardControllers());
  ClientsListHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          Row(
            children: [
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 10, bottom: 10),
                child: SizedBox(
                    height: 40,
                    width: 200,
                    child: DropdownSearch(
                      onChanged: (value) async {
                        dashBoardControllers
                            .clientCasesORClosedCaseValue.value = value!;
                        log('Getx Controller ${Get.find<DashBoardControllers>().clientCasesORClosedCaseValue.value}');
                      },
                      selectedItem: dashBoardControllers
                          .clientCasesORClosedCaseValue.value,
                      items: const ['Cases', 'Closed Cases'],
                    )),
              ),
            ],
          ), //
          Container(
            height: 45,
            decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                border: Border.all(color: cGrey)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 90),
                  child: HeaderRowTextWidgetClient(
                    title: 'No',
                  ),
                ),
                HeaderRowTextWidgetClient(
                  title: clientSecTe[0],
                ),
                HeaderRowTextWidgetClient(
                  title: clientSecTe[1],
                ),
                HeaderRowTextWidgetClient(
                  title: clientSecTe[2],
                ),
                HeaderRowTextWidgetClient(
                  title: clientSecTe[3],
                ),
                Padding(
                padding: const EdgeInsets.only(right: 30),
                child: HeaderRowTextWidgetClient(
                  title: clientSecTe[4],
                ),
              )
                // Padding(
                //   padding: const EdgeInsets.only(right: 10),
                //   child: HeaderRowTextWidget(
                //     title: clientSecTe[4],
                //   ),
                // )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

List<String> clientSecTe = [
  'Case Number',
  'Client Name',
  'Type of case',
  'Mobile Number',
  'Client Email Id',
  // 'Date of Marriage',
];
