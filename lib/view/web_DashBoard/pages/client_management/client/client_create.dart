// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/constant/const.dart';
import 'package:vidyaveechi_website/view/constant/constant.validate.dart';
import 'package:vidyaveechi_website/view/fonts/google_poppins_widget.dart';
import 'package:vidyaveechi_website/view/web_DashBoard/pages/client_management/controller/client_controller.dart';
import 'package:vidyaveechi_website/view/widgets/back_button/back_button_widget.dart';
import 'package:vidyaveechi_website/view/widgets/select_DateWidget/select_Date_widget.dart';
import 'package:vidyaveechi_website/view/widgets/textformFiledContainer/textformFiledContainer.dart';



  Future<void> clientDetails(BuildContext context) async{
     final _formKey = GlobalKey<FormState>();
     String selectgender = '';
     String selectstate= '';
  TextEditingController clientNameController = TextEditingController();
  TextEditingController caseNoController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController whatsAppNoController = TextEditingController();
  TextEditingController emailIDController = TextEditingController();
  TextEditingController typeofCaseController = TextEditingController();
  TextEditingController clientOccupationController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController casediscriptionController = TextEditingController();
  TextEditingController oppositeadvocateController = TextEditingController();
  TextEditingController typeofMarriageController = TextEditingController();
  // TextEditingController seperationDateController = TextEditingController();
  TextEditingController noofChildrenController = TextEditingController();
  // TextEditingController enteredDateController = TextEditingController();
  TextEditingController enterByController = TextEditingController();
  ClientManagementController clientController =
      Get.put(ClientManagementController());
  return showDialog(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return Form(
        key: _formKey,
        child: AlertDialog(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GooglePoppinsWidgets(
                  text: 'CLIENT DETAILS',
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
              children: <Widget>[
                SizedBox(
                  height: 500,
                  width: 1000,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextFormFiledContainerWidget(
                              controller: clientNameController,
                              hintText: "Enter  Full Name",
                              title: "Full Name",
                              width: 300,
                              validator: checkFieldEmpty,),
                          TextFormFiledContainerWidget(
                              onChanged: (value) {
                                whatsAppNoController.text = value;
                                log("changing -- ${whatsAppNoController.value.text.toString()}");
                              },
                              controller: mobileNoController,
                              hintText: "Mobile No.",
                              title: "Enter Mobile No.",
                              width: 300,
                              validator: checkFieldPhoneNumberIsValid,),
                          TextFormFiledContainerWidget(
                              autofillHints: const ['asdasd'],
                              controller: whatsAppNoController,
                              hintText: "WhatsApp No.",
                              title: "Enter WhatsApp No.",
                              width: 300),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextFormFiledContainerWidget(
                              controller: emailIDController,
                              hintText: "Enter  Email ID.",
                              title: "Email ID.",
                              width: 300,
                              validator: checkFieldEmailIsValid,),
                          SizedBox(
                            height: 60,
                            width: 300,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                 GooglePoppinsWidgets(
                                      text: 'Gender', fontsize: 12),
                                  SizedBox(
                                      height: 35,
                                      width: 300,
                                      child: Center(
                                        child: DropdownSearch(
                                          onChanged: (value) {
                                            selectgender = value ?? '';
                                          },
                                          dropdownDecoratorProps:
                                              DropDownDecoratorProps(
                                                  baseStyle: GoogleFonts.poppins(
                                                      fontSize: 13,
                                                      color: Colors.black
                                                          .withOpacity(0.7))),
                                          selectedItem: 'Please Select Gender',
                                          // popupProps: const PopupProps.menu(),
      
                                          items: listofGender,
                                        ),
                                      )
                                      ),
                              ],
                            ),
                          ),
                          Obx(() {
                            if (clientController.dobSelectedDate.value == '') {
                              return TextFormFiledContainerWidget(
                                  onTap: () async {
                                    selectDateFunction(context);
                                    String formatedate = DateFormat('yyyy-MMM-dd')
                                        .format(await selectDateFunction(context)
                                            .whenComplete(
                                                () => Navigator.pop(context)));
      
                                    clientController.dobSelectedDate.value =
                                        formatedate;
                                  },
                                  hintText: "📅 Select Date",
                                  title: "D O B",
                                  validator: checkFieldDateIsValid,
                                  width: 300);
                            } else {
                              return SizedBox(
                                height: 60,
                                width: 300,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GooglePoppinsWidgets(
                                        text: 'D O B', fontsize: 12),
                                    Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: cBlack.withOpacity(0.4),
                                                width: 1)),
                                        height: 35,
                                        width: 300,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: GooglePoppinsWidgets(
                                              text: clientController
                                                  .dobSelectedDate.value
                                                  .toString(),
                                              fontsize: 12),
                                        ))
                                  ],
                                ),
                              );
                            }
                          }
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(() {
                            if (clientController.marriageSelectedDate.value == '') {
                              return TextFormFiledContainerWidget(
                                  onTap: () async {
                                    selectDateFunction(context);
                                    String formatedate = DateFormat('yyyy-MMM-dd')
                                        .format(await selectDateFunction(context)
                                            .whenComplete(
                                                () => Navigator.pop(context)));
      
                                    clientController.marriageSelectedDate.value =
                                        formatedate;
                                  },
                                  hintText: "📅 Select Date",
                                  title: "Date of Marriage",
                                  validator: checkFieldDateIsValid,
                                  width: 300);
                            } else {
                              return SizedBox(
                                height: 60,
                                width: 300,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GooglePoppinsWidgets(
                                        text: 'Date of Marriage', fontsize: 12),
                                    Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: cBlack.withOpacity(0.4),
                                                width: 1)),
                                        height: 35,
                                        width: 300,
                                        
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: GooglePoppinsWidgets(
                                              text: clientController
                                                  .marriageSelectedDate.value
                                                  .toString(),
                                              fontsize: 12),
                                        )
                                        )
                                  ],
                                ),
                              );
                            }
                           }
                          ),
                          TextFormFiledContainerWidget(
                              controller: typeofCaseController,
                              title: "Type of case",
                              hintText: "Enter Type of case",
                              width: 300,
                              validator: checkFieldEmpty,),
                          TextFormFiledContainerWidget(
                              controller: clientOccupationController,
                              title: "Client Occupation",
                              hintText: "Enter Client Occupation",
                              width: 300,
                              validator: checkFieldEmpty,),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextFormFiledContainerWidget(
                              controller: addressController,
                              title: "Address Line 1",
                              hintText: "Enter Door No.,Street,Area...",
                              width: 300,
                              validator: checkFieldEmpty,),
                          TextFormFiledContainerWidget(
                              controller: casediscriptionController,
                              title: "Case Description",
                              hintText: "Enter Case Description",
                              width: 300,
                              validator: checkFieldEmpty,),
                          TextFormFiledContainerWidget(
                              controller: oppositeadvocateController,
                              title: "Opposite Advocate",
                              hintText: "Opposite Advocate Name",
                              validator: checkFieldEmpty,
                              width: 300),
                        ],
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [ TextFormFiledContainerWidget(
                            controller: typeofMarriageController,
                            title: "Type of Marriage",
                            hintText: "Enter Type of Marriage",
                            width: 300,
                            validator: checkFieldEmpty,),
                        TextFormFiledContainerWidget(
                            controller: noofChildrenController,
                            title: "Number of Children",
                            hintText: "Enter No. of Children",
                            width: 300,
                            validator: checkFieldEmpty,),
                        Obx(() {
                            if (clientController.seperationSelectedDate.value == '') {
                              return TextFormFiledContainerWidget(
                                  onTap: () async {
                                    selectDateFunction(context);
                                    String formatedate = DateFormat('yyyy-MMM-dd')
                                        .format(await selectDateFunction(context)
                                            .whenComplete(
                                                () => Navigator.pop(context)));
      
                                    clientController.seperationSelectedDate.value =
                                        formatedate;
                                  },
                                  hintText: "📅 Select Date",
                                  title: "Seperation Date",
                                  validator: checkFieldDateIsValid,
                                  width: 300);
                            } else {
                              return SizedBox(
                                height: 60,
                                width: 300,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GooglePoppinsWidgets(
                                        text: 'Seperation Date', fontsize: 12),
                                    Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: cBlack.withOpacity(0.4),
                                                width: 1)),
                                        height: 35,
                                        width: 300,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: GooglePoppinsWidgets(
                                              text: clientController
                                                  .seperationSelectedDate.value
                                                  .toString(),
                                              fontsize: 12),
                                        ))
                                  ],
                                ),
                              );
                            }
                          }
                          ),
                        ],
                      ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Obx(() {
                            if (clientController.enteredSelectedDate.value == '') {
                              return TextFormFiledContainerWidget(
                                  onTap: () async {
                                    selectDateFunction(context);
                                    String formatedate = DateFormat('yyyy-MMM-dd')
                                        .format(await selectDateFunction(context)
                                            .whenComplete(
                                                () => Navigator.pop(context)));
      
                                    clientController.enteredSelectedDate.value =
                                        formatedate;
                                  },
                                  hintText: "📅 Select Date",
                                  title: "Commencement Date",
                                  validator: checkFieldDateIsValid,
                                  width: 300);
                            } else {
                              return SizedBox(
                                height: 60,
                                width: 300,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GooglePoppinsWidgets(
                                        text: 'Commencement Date', fontsize: 12),
                                    Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: cBlack.withOpacity(0.4),
                                                width: 1)),
                                        height: 35,
                                        width: 300,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: GooglePoppinsWidgets(
                                              text: clientController
                                                  .enteredSelectedDate.value
                                                  .toString(),
                                              fontsize: 12),
                                        )
                                        )
                                  ],
                                ),
                              );
                            }
                           }
                          ),
                       TextFormFiledContainerWidget(
                             controller: enterByController,
                            title: "Enter By",
                            hintText: "Enter By",
                            width: 300,
                            validator: checkFieldEmpty,),
                              SizedBox(
                                height: 60,
                                width: 300,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                   GooglePoppinsWidgets(
                                  text: 'Select State/Province', fontsize: 12),
                              SizedBox(
                                  height: 35,
                                  width: 300,
                                  child: Center(
                                    child: DropdownSearch(
                                      autoValidateMode: AutovalidateMode.always,
                                      onChanged: (value) {
                                        selectstate = value ?? '';
                                        log("$selectstate-------");
                                      },
                                      dropdownDecoratorProps:
                                          DropDownDecoratorProps(
                                              baseStyle: GoogleFonts.poppins(
                                                  fontSize: 13,
                                                  color: Colors.black
                                                      .withOpacity(0.7))),
                                      selectedItem: 'All States',
                                      items: listofState,
                                    ),
                                  )),
                                  ],
                                ),
                              ),
                            ],
                          ),SizedBox(height: 10,),
                      Center(
                        child: GestureDetector(
                          onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                if (selectstate == '') {
                                  return showToast(msg: 'Please select State');
                                } else if (selectgender == '') {
                                  return showToast(msg: 'Please select Gender');
                                } else {
                                  
                      
                            clientController.addclientDetailsToSever(
                                clientName: clientNameController.text.trim(),
                                caseNo: caseNoController.text.trim(),
                                mobileNo: mobileNoController.text.trim(),
                                whatsAppNo:  whatsAppNoController.text.trim(),
                                 emailID: emailIDController.text.trim(),
                                 gender: selectgender,
                                 dob: clientController
                                  .dobSelectedDate.value,
                                marriageDate: clientController.marriageSelectedDate.value,
                                typeofcase: typeofCaseController.text.trim(),
                                address: addressController.text.trim(),
                                casediscription: casediscriptionController.text.trim(),
                                oppositeadvocate: oppositeadvocateController.text.trim(),
                                clientoccupation: clientOccupationController.text.trim(),
                                state: selectstate,
                                typeofMarriage: typeofMarriageController.text.trim(),
                                seperationDate: clientController.seperationSelectedDate.value,
                                noofChildren: noofChildrenController.text.trim(),
                                enteredDate: clientController.enteredSelectedDate.value,
                                enterBy: enterByController.text.trim(),
                                context: context)
                                .then((value) {
                                      clientController.marriageSelectedDate.value =
                                          '';
                                      clientController.dobSelectedDate.value = '';
                                      clientController.enteredSelectedDate.value='';
                                      clientController.seperationSelectedDate.value='';
                                    });
                          }
                              }
                          },
                          child: Container(
                            height: 40,
                            width: 250,
                            decoration: const BoxDecoration(
                              color: themeColorBlue,
                            ),
                            child: Center(
                              child: GooglePoppinsWidgets(
                                  text: 'Add  Details',
                                  color: cWhite,
                                  fontsize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                      TextFormFiledContainerWidget(
                          
                              controller: caseNoController,
                              hintText: "Enter Case Number",
                              title: "Case No.",
                              validator: checkFieldEmpty,
                              width: 300),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}

List<String> listofGender = [
  'Male',
  'Female',
  'Other',
];
List<String> listofState = [
  'Andhra Pradesh',
  'Arunachal Pradesh',
  'Assam',
  'Bihar',
  'Chhattisgarh',
  'Delhi',
  'Goa',
  'Gujarat',
  'Haryana',
  'Himachal Pradesh',
  'Jammu & Kashmir',
  'Jharkhand',
  'Karnataka',
  'Kerala',
  'Ladakh',
  'Madhya Pradesh',
  'Maharashtra',
  'Manipur',
  'Meghalaya',
  'Mizoram',
  'Nagaland',
  'Odisha',
  'Puducherry(Pondicherry)',
  'Punjab',
  'Rajasthan',
  'Sikkim',
  'Tamil Nadu',
  'Telangana',
  'Tripura',
  'Uttar Pradesh',
  'Uttarakhand',
  'West Bengal',
];
