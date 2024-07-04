import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/google_poppins_widget.dart';
import 'package:vidyaveechi_website/view/web_DashBoard/pages/staff_management/controller/employee_controller.dart';
import 'package:vidyaveechi_website/view/web_DashBoard/pages/staff_management/model/create_employee_model.dart';
import 'package:vidyaveechi_website/view/widgets/back_button/back_button_widget.dart';
import 'package:vidyaveechi_website/view/widgets/textformFiledContainer/textformFiledContainer.dart';

arrangeStaffPriority(BuildContext context) {
  return showDialog(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GooglePoppinsWidgets(
                text: 'ARRANGE STAFF PRIORITY',
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
                height: 400,
                width: 500,
                child: Column(
                  children: [
                    SizedBox(
                      height: 400,
                      width: double.infinity,
                      child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection("StaffManagement")
                            .doc('StaffManagement')
                            .collection('Active')
                            .orderBy('index', descending: false)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data!.docs.isEmpty) {
                              return const Center(
                                child: Text("No Staff found"),
                              );
                            } else {
                              return ListView.separated(
                                  itemBuilder: (context, index) {
                                    final data =
                                        CreateEmployeeClassModel.fromMap(
                                            snapshot.data!.docs[index].data());
                                    return SizedBox(
                                      height: 80,
                                      width: 100,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 20,
                                            width: 100,
                                            decoration: const BoxDecoration(
                                              color: themeColorBlue,
                                            ),
                                            child: Center(
                                              child: GooglePoppinsWidgets(
                                                  text:
                                                      '${data.index}  POSITION',
                                                  color: cWhite,
                                                  fontsize: 11,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                height: 30,
                                                width: 230,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: cBlack)),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    GooglePoppinsWidgets(
                                                        text: " Name :  ",
                                                        fontsize: 11),
                                                    SingleChildScrollView(
                                                      
                                                      child: GooglePoppinsWidgets(
                                                        text: data.employeeName,
                                                        fontsize: 11,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: GooglePoppinsWidgets(
                                                    text: data.assignRole,
                                                    fontsize: 11),
                                              ),
                                              const Spacer(),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 20),
                                                child: IconButton(
                                                    onPressed: () {
                                                      changeIndex(context,
                                                          data.employeeID);
                                                    },
                                                    icon: const Icon(
                                                      Icons.settings,
                                                      size: 16,
                                                    )),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return const SizedBox(
                                      height: 01,
                                    );
                                  },
                                  itemCount: snapshot.data!.docs.length);
                            }
                          } else {
                            return const Center(
                              child: CircularProgressIndicator.adaptive(),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}

changeIndex(BuildContext context, String docid) async {
  StaffManagementController staffManagementController =
      Get.put(StaffManagementController());
  TextEditingController indexController = TextEditingController();
  return showDialog(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GooglePoppinsWidgets(
                text: 'CHANGE POSITION NUMBER',
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
                height: 140,
                width: 350,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFormFiledContainerWidget(
                        controller: indexController,
                        hintText: 'Enter Only 1 Digit Number eg 1,2,3...',
                        title: 'Enter Position Number',
                        width: double.infinity),
                    GestureDetector(
                      onTap: () async {
                        await staffManagementController
                            .changeIndexEmployeeInFirebase(
                                docid: docid,
                                index: int.parse(indexController.text.trim()),
                                context: context);
                      },
                      child: Container(
                        height: 32,
                        width: 150,
                        decoration: const BoxDecoration(
                          color: themeColorBlue,
                        ),
                        child: Center(
                          child: GooglePoppinsWidgets(
                              text: 'C H A N G E',
                              color: cWhite,
                              fontsize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}
