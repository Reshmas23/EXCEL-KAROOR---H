// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/google_poppins_widget.dart';
import 'package:vidyaveechi_website/view/web_DashBoard/pages/staff_management/controller/employee_controller.dart';
import 'package:vidyaveechi_website/view/web_DashBoard/pages/staff_management/functions/upload_image/upload_image.dart';
import 'package:vidyaveechi_website/view/widgets/back_button/back_button_widget.dart';
import 'package:vidyaveechi_website/view/widgets/blue_Container_widget/blue_Container_widget.dart';


detailsShowingFunction(
    {required BuildContext context,
    required String employeeName,
    required String employeeID,
    required String mobileNo,
    required String whatsAppNo,
    required String emailID,
    required String gender,
    required String dob,
    required String joiningDate,
    required String assignRole,
    required String alMobileNo,
    required String address,
    required String city,
    required String district,
    required String imageUrl,
    required String state,
    required String collectionName}) {
  StaffManagementController staffManagementController =
      Get.put(StaffManagementController());
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GooglePoppinsWidgets(
                text: 'STAFF DETAILS',
                fontsize: 13,
                fontWeight: FontWeight.w600),
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: BackButtonContainerWidget(),
            ),
          ],
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              SizedBox(
                height: 700,
                width: 800,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 80,
                              backgroundImage: NetworkImage(imageUrl),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 100),
                              child: SizedBox(
                                height: 180,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    GooglePoppinsWidgets(
                                      text: employeeName,
                                      fontsize: 38,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    GooglePoppinsWidgets(
                                      text: assignRole,
                                      fontsize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    Row(
                                      children: [
                                        GooglePoppinsWidgets(
                                          text: "Employee ID  : ",
                                          fontsize: 11,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        GooglePoppinsWidgets(
                                          text: employeeID,
                                          fontsize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        GooglePoppinsWidgets(
                                          text: "Gender  : ",
                                          fontsize: 11,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        GooglePoppinsWidgets(
                                          text: gender,
                                          fontsize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: SizedBox(
                        height: 500,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ShowDetailStaffContainerWidget(
                                    height: 48,
                                    width: 300,
                                    title: 'D O B',
                                    content: dob),
                                ShowDetailStaffContainerWidget(
                                    height: 48,
                                    width: 300,
                                    title: 'JoiningDate',
                                    content: joiningDate),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ShowDetailStaffContainerWidget(
                                    height: 48,
                                    width: 300,
                                    title: 'Email',
                                    content: emailID),
                                ShowDetailStaffContainerWidget(
                                    height: 48,
                                    width: 300,
                                    title: 'Mobile No',
                                    content: mobileNo),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ShowDetailStaffContainerWidget(
                                    height: 48,
                                    width: 300,
                                    title: 'WhatsApp No',
                                    content: whatsAppNo),
                                ShowDetailStaffContainerWidget(
                                    height: 48,
                                    width: 300,
                                    title: 'Al MobileNo',
                                    content: alMobileNo),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ShowDetailStaffContainerWidget(
                                    height: 100,
                                    width: 400,
                                    title: 'Address',
                                    content: address),
                                ShowDetailStaffContainerWidget(
                                    height: 48,
                                    width: 300,
                                    title: 'City',
                                    content: city),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ShowDetailStaffContainerWidget(
                                    height: 48,
                                    width: 300,
                                    title: 'District',
                                    content: district),
                                ShowDetailStaffContainerWidget(
                                    height: 48,
                                    width: 300,
                                    title: 'State',
                                    content: state),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 20,
        ),
        actions: [
          collectionName == 'Active'
              ? Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    children: [
                      const Spacer(),
                      GestureDetector(
                        onTap: () => uploadImageForStaff(context, employeeID),
                        child: BlueContainerWidget(
                          title: 'Add Photo',
                          fontSize: 12,
                          color: themeColorBlue,
                          fontWeight: FontWeight.bold,
                          width: 120,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: GestureDetector(
                          onTap: () {
                            warningShowDilogueBox(
                                context: context,
                                title: "Alert",
                                discripition:
                                    "Do you want DeActivate this Person ?",
                                onPressed: () => staffManagementController
                                    .deActivateThisPerson(
                                        staffImage: imageUrl,
                                        alMobileNo: alMobileNo,
                                        whatsAppNo: whatsAppNo,
                                        employeeName: employeeName,
                                        employeeID: employeeID,
                                        mobileNo: mobileNo,
                                        emailID: emailID,
                                        gender: gender,
                                        dob: dob,
                                        joiningDate: joiningDate,
                                        assignRole: assignRole,
                                        address: address,
                                        city: city,
                                        district: district,
                                        state: state,
                                        context: context));
                          },
                          child: BlueContainerWidget(
                            title: 'DeActivate',
                            fontSize: 12,
                            color: cred,
                            fontWeight: FontWeight.bold,
                            width: 120,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : const Text(''),
          const SizedBox(
            height: 15,
          ),
        ],
      );
    },
  );
}

class ShowDetailStaffContainerWidget extends StatelessWidget {
  String title;
  String content;
  double height;
  double width;
  ShowDetailStaffContainerWidget({
    required this.title,
    required this.content,
    required this.height,
    required this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(border: Border.all(color: themeColorBlue, width: 0.2)),
      height: height,
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 20,
                width: 100,
                decoration: BoxDecoration(color: cBlack.withOpacity(0.9)),
                child: Center(
                  child: GooglePoppinsWidgets(
                    text: title,
                    fontsize: 11,
                    fontWeight: FontWeight.w400,
                    color: cWhite,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 02,
                  decoration: const BoxDecoration(color: themeColorBlue),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 04, left: 100),
            child: GooglePoppinsWidgets(
              text: content,
              fontsize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
