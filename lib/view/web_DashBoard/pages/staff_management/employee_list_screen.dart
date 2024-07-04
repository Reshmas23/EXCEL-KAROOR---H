import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/web_DashBoard/controller/dashboard_Controllers.dart';
import 'package:vidyaveechi_website/view/web_DashBoard/pages/staff_management/functions/clickOnStaffContainer/click_OnStaffContainer.dart';
import 'package:vidyaveechi_website/view/web_DashBoard/pages/staff_management/model/create_employee_model.dart';
import 'package:vidyaveechi_website/view/web_DashBoard/pages/staff_management/widget/list_dataContainer.dart';


class ListOFStaffScreen extends StatelessWidget {
  const ListOFStaffScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (Get.find<DashBoardControllers>().staffActiveORInActiveValue.value ==
          "Active") {
        return StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('StaffManagement')
                .doc('StaffManagement')
                .collection(Get.find<DashBoardControllers>()
                    .staffActiveORInActiveValue
                    .value)
                .orderBy('employeeName', descending: false)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.docs.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.only(top: 100),
                    child: Center(
                      child: Text("No Employess found"),
                    ),
                  );
                }
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 10, bottom: 10),
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          final data = CreateEmployeeClassModel.fromMap(
                              snapshot.data!.docs[index].data());
                          return GestureDetector(
                            onTap: () => detailsShowingFunction(
                                collectionName: Get.find<DashBoardControllers>()
                                    .staffActiveORInActiveValue
                                    .value,
                                imageUrl: data.staffImage ??
                                    'https://cdn.pixabay.com/photo/2016/08/31/11/54/icon-1633249_640.png',
                                context: context,
                                employeeName: data.employeeName,
                                employeeID: data.employeeID,
                                mobileNo: data.mobileNo,
                                whatsAppNo: data.whatsAppNo ?? '',
                                emailID: data.emailID,
                                gender: data.gender,
                                dob: data.dob,
                                joiningDate: data.joiningDate,
                                assignRole: data.assignRole,
                                alMobileNo: data.alMobileNo ?? '',
                                address: data.address,
                                city: data.city,
                                district: data.district,
                                state: data.state),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: themeColorBlue.withOpacity(0.2),
                                      width: 0.9)),
                              height: 50,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ListDataContainerWidget(
                                      text: '${index + 1}',
                                      height: 40,
                                      width: 50),
                                  ListDataContainerWidget(
                                      text: data.employeeID,
                                      height: 40,
                                      width: 200),
                                  ListDataContainerWidget(
                                      text: data.employeeName,
                                      height: 40,
                                      width: 200),
                                  ListDataContainerWidget(
                                    text: data.assignRole,
                                    height: 40,
                                    width: 100,
                                  ),
                                  ListDataContainerWidget(
                                      text: data.mobileNo,
                                      height: 40,
                                      width: 200),
                                  ListDataContainerWidget(
                                      text: data.emailID,
                                      height: 40,
                                      width: 200),
                                  ListDataContainerWidget(
                                      text: data.joiningDate,
                                      height: 40,
                                      width: 100),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 05,
                          );
                        },
                        itemCount: snapshot.data!.docs.length),
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
            });
      } else {
        return StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('StaffManagement')
                .doc('StaffManagement')
                .collection(Get.find<DashBoardControllers>()
                    .staffActiveORInActiveValue
                    .value)
                .orderBy('employeeName', descending: false)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.docs.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.only(top: 100),
                    child: Center(
                      child: Text("No Employess found"),
                    ),
                  );
                }
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 10, bottom: 10),
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          final data = CreateEmployeeClassModel.fromMap(
                              snapshot.data!.docs[index].data());
                          return GestureDetector(
                            onTap: () => detailsShowingFunction(
                                collectionName: Get.find<DashBoardControllers>()
                                    .staffActiveORInActiveValue
                                    .value,
                                imageUrl: data.staffImage ??
                                    'https://cdn.pixabay.com/photo/2016/08/31/11/54/icon-1633249_640.png',
                                context: context,
                                employeeName: data.employeeName,
                                employeeID: data.employeeID,
                                mobileNo: data.mobileNo,
                                whatsAppNo: data.whatsAppNo ?? '',
                                emailID: data.emailID,
                                gender: data.gender,
                                dob: data.dob,
                                joiningDate: data.joiningDate,
                                assignRole: data.assignRole,
                                alMobileNo: data.alMobileNo ?? '',
                                address: data.address,
                                city: data.city,
                                district: data.district,
                                state: data.state),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: themeColorBlue.withOpacity(0.2),
                                      width: 0.9)),
                              height: 50,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ListDataContainerWidget(
                                      text: '${index + 1}',
                                      height: 40,
                                      width: 50),
                                  ListDataContainerWidget(
                                      text: data.employeeID,
                                      height: 40,
                                      width: 200),
                                  ListDataContainerWidget(
                                      text: data.employeeName,
                                      height: 40,
                                      width: 200),
                                  ListDataContainerWidget(
                                    text: data.assignRole,
                                    height: 40,
                                    width: 100,
                                  ),
                                  ListDataContainerWidget(
                                      text: data.mobileNo,
                                      height: 40,
                                      width: 200),
                                  ListDataContainerWidget(
                                      text: data.emailID,
                                      height: 40,
                                      width: 200),
                                  ListDataContainerWidget(
                                      text: data.joiningDate,
                                      height: 40,
                                      width: 100),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 05,
                          );
                        },
                        itemCount: snapshot.data!.docs.length),
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
            });
      }
    });
  }
}
