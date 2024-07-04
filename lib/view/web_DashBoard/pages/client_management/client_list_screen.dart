import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/web_DashBoard/controller/dashboard_Controllers.dart';
import 'package:vidyaveechi_website/view/web_DashBoard/pages/client_management/client/onClick/Client_OnClick.dart';
import 'package:vidyaveechi_website/view/web_DashBoard/pages/client_management/model/create_client_model.dart';
import 'package:vidyaveechi_website/view/web_DashBoard/pages/staff_management/widget/list_dataContainer.dart';


// ignore: must_be_immutable
class ListOFClientScreen extends StatelessWidget {
  DashBoardControllers dashBoardControllers = Get.put(DashBoardControllers());
  ListOFClientScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (dashBoardControllers.clientCasesORClosedCaseValue.value == 'Cases') {
        return StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('ClientManagement')
                .doc('ClientManagement')
                .collection(
                    dashBoardControllers.clientCasesORClosedCaseValue.value)
                .orderBy('clientName', descending: false)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.docs.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.only(top: 100),
                    child: Center(
                      child: Text("No Clients found"),
                    ),
                  );
                }

                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 10, bottom: 10),
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          final data = CreateClientClassModel.fromMap(
                              snapshot.data!.docs[index].data());
                          return GestureDetector(
                            onTap: () => clientDetailsShowingFunction(
                              context: context,
                              followUpDate: data.followUpDate??'',
                               cImageUrl: data.clientImage ??'https://cdn.pixabay.com/photo/2016/08/31/11/54/icon-1633249_640.png',
                              clientName: data.clientName,
                              caseNo: data.caseNo,
                              mobileNo: data.mobileNo,
                              whatsAppNo: data.whatsAppNo ?? '',
                              emailID: data.emailID,
                              gender: data.gender,
                              dob: data.dob,
                              marriageDate: data.marriageDate,
                              typeofcase: data.typeofcase,
                              clientoccupation: data.clientoccupation,
                              address: data.address,
                              casediscription: data.casediscription,
                              oppositeadvocate: data.oppositeadvocate,
                              typeofMarriage: data.typeofMarriage,
                              noofChildren: data.noofChildren ?? '',
                              seperationDate: data.seperationDate,
                              enteredDate: data.enteredDate,
                              enterBy: data.enterBy,
                              state: data.state,
                            ),
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
                                      width: 200),
                                       ListDataContainerWidget(
                                      text: data.caseNo,
                                      height: 40,
                                      width: 200),
                                  ListDataContainerWidget(
                                      text: data.clientName,
                                      height: 40,
                                      width: 200),
                                  ListDataContainerWidget(
                                    text: data.typeofcase,
                                    height: 40,
                                    width: 200,
                                  ),
                                  ListDataContainerWidget(
                                      text: data.mobileNo,
                                      height: 40,
                                      width: 200),
                                  ListDataContainerWidget(
                                      text: data.emailID,
                                      height: 40,
                                      width: 200),
                                 
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
                .collection('ClientManagement')
                .doc('ClientManagement')
                .collection(
                    dashBoardControllers.clientCasesORClosedCaseValue.value)
                .orderBy('clientName', descending: false)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.docs.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.only(top: 100),
                    child: Center(
                      child: Text("No Clients found"),
                    ),
                  );
                }

                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 10, bottom: 10),
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          final data = CreateClientClassModel.fromMap(
                              snapshot.data!.docs[index].data());
                          return GestureDetector(
                            onTap: () => clientDetailsShowingFunction(
                              context: context,
                              followUpDate: data.followUpDate??'',
                               cImageUrl: data.clientImage ??
                                    'https://cdn.pixabay.com/photo/2016/08/31/11/54/icon-1633249_640.png',
                              clientName: data.clientName,
                              caseNo: data.caseNo,
                              mobileNo: data.mobileNo,
                              whatsAppNo: data.whatsAppNo ?? '',
                              emailID: data.emailID,
                              gender: data.gender,
                              dob: data.dob,
                              marriageDate: data.marriageDate,
                              typeofcase: data.typeofcase,
                              clientoccupation: data.clientoccupation,
                              address: data.address,
                              casediscription: data.casediscription,
                              oppositeadvocate: data.oppositeadvocate,
                              typeofMarriage: data.typeofMarriage,
                              noofChildren: data.noofChildren ?? '',
                              seperationDate: data.seperationDate,
                              enteredDate: data.enteredDate,
                              enterBy: data.enterBy,
                              state: data.state,
                            ),
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
                                      text: data.clientName,
                                      height: 40,
                                      width: 200),
                                  ListDataContainerWidget(
                                    text: data.typeofcase,
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
                                      text: data.marriageDate,
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
