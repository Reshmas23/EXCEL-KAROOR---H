import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/model/student_model/student_model.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/ioT_Card/controller/iotCardController.dart';
import 'package:vidyaveechi_website/view/ioT_Card/select_class_DropDown/select_class.dart';
import 'package:vidyaveechi_website/view/ioT_Card/student_dataList.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/students/student_details/widgets/category_tableHeader.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/widgets/loading_widget/loading_widget.dart';
import 'package:vidyaveechi_website/view/widgets/progess_button/progress_button.dart';
import 'package:vidyaveechi_website/view/widgets/routeSelectedTextContainer/routeSelectedTextContainer.dart';

class ClassWiseStudentListContainer extends StatelessWidget {
  final IoTCardController ioTCardController = Get.put(IoTCardController());

  ClassWiseStudentListContainer({super.key});

  @override
  Widget build(BuildContext context) {
    ioTCardController.registudentList.clear();
    ioTCardController.cardList.clear();
    ioTCardController.classStudentList.clear();
    ioTCardController.allStudentList.clear();
    return Scaffold(
      appBar: AppBar(),
      body: Obx(() {
        if (ioTCardController.classTaped.value == true) {
          ioTCardController.registudentList.clear();
          ioTCardController.cardList.clear();
          ioTCardController.classStudentList.clear();
          ioTCardController.allStudentList.clear();
          ioTCardController.getAllCardID();
        }
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 0, right: 20, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const TextFontWidget(
                        text: 'Class wise StudentList 📃',
                        fontsize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      const Spacer(),
                      ioTCardController.classDocID.value == 'dd'
                          ? Container()
                          : StreamBuilder(
                              stream: server
                                  .collection('SchoolListCollection')
                                  .doc(ioTCardController.schoolDocID.value)
                                  .collection(
                                      ioTCardController.batchDocID.value)
                                  .doc(ioTCardController.batchDocID.value)
                                  .collection('classes')
                                  .doc(ioTCardController.classDocID.value)
                                  .collection('Students')
                                  .snapshots(),
                              builder: (context, snapshot) {
                                return TextFontWidget(
                                  text:
                                      'Student Count : ${snapshot.data?.docs.length ?? 0}  ',
                                  fontsize: 16,
                                  fontWeight: FontWeight.bold,
                                );
                              }),
                      SizedBox(
                          height: 60,
                          width: 200,
                          child: CardSelectClassDropDown()),
                    ],
                  ),
                ),
                ioTCardController.classDocID.value == 'dd'
                    ? Container()
                    : Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 30,
                              child: RouteSelectedTextContainer(
                                title: ioTCardController.cardID.value == ''
                                    ? " Scan Card 💳"
                                    : ioTCardController.cardID.value,
                                width: 160,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: cWhite,
                                    border: Border.all(
                                        color:
                                            themeColorBlue.withOpacity(0.2))),
                                height: 30,
                                width: 350,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    TextFontWidget(
                                      text:
                                          ' Student Name :  ${ioTCardController.pastStudentName.value}',
                                      fontsize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: cBlack,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: cWhite,
                                    border: Border.all(
                                        color:
                                            themeColorBlue.withOpacity(0.2))),
                                height: 30,
                                width: 120,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    TextFontWidget(
                                      text:
                                          ' Ad No :  ${ioTCardController.pastStudentAdNO.value}',
                                      fontsize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: cBlack,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                ioTCardController.classDocID.value == 'dd'
                    ? Container()
                    : Row(
                        children: [
                          StreamBuilder(
                              stream: server
                                  .collection('SchoolListCollection')
                                  .doc(ioTCardController.schoolDocID.value)
                                  .collection(
                                      ioTCardController.batchDocID.value)
                                  .doc(ioTCardController.batchDocID.value)
                                  .collection('classes')
                                  .doc(ioTCardController.classDocID.value)
                                  .collection('Students')
                                  .snapshots(),
                              builder: (context, ssnapshot) {
                                final int studentLength =
                                    ssnapshot.data?.docs.length ?? 0;
                                final list =
                                    ioTCardController.classStudentList.length;
                                print("studentLength $studentLength");
                                print("list $list");
                                return ssnapshot.hasData
                                    ? RouteSelectedTextContainer(
                                        title:
                                            'Completed  ${studentLength - list} / ${ssnapshot.data?.docs.length ?? 0} ',
                                        width: 160,
                                      )
                                    : const SizedBox();
                              }),
                          const SizedBox(
                            width: 10,
                          ),
                          StreamBuilder(
                              stream: server
                                  .collection('StudentRegistration')
                                  .doc('CardData')
                                  .snapshots(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  if (snapshot.data!.data()?['CardID'] != '') {
                                    ioTCardController.registerCardForStudent();
                                  }
                                  return Container(
                                    decoration: BoxDecoration(
                                        color: cWhite,
                                        border: Border.all(
                                            color: themeColorBlue
                                                .withOpacity(0.2))),
                                    height: 30,
                                    width: 350,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        TextFontWidget(
                                          text:
                                              ' Current Card NO 💳 :  ${snapshot.data?.data()?['CardID'] == '' ? 'Scan the card ' : snapshot.data?.data()?['CardID']}',
                                          fontsize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: cBlack,
                                        ),
                                      ],
                                    ),
                                  );
                                } else {
                                  return const CircularProgressIndicator
                                      .adaptive();
                                }
                              }),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            height: 40,
                            width: 180,
                            child: ProgressButtonWidget(
                                buttonstate:
                                    ioTCardController.buttonstate.value,
                                text: '🔗 Status',
                                function: () {}),
                          ),
                          const Spacer(),
                        ],
                      ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  color: cWhite,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: Container(
                      color: cWhite,
                      height: 40,
                      child: const Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child:
                                  CatrgoryTableHeaderWidget(headerTitle: 'No')),
                          SizedBox(
                            width: 02,
                          ),
                          Expanded(
                              flex: 2,
                              child: CatrgoryTableHeaderWidget(
                                  headerTitle: 'CardID')),
                          SizedBox(
                            width: 02,
                          ),
                          Expanded(
                              flex: 2,
                              child: CatrgoryTableHeaderWidget(
                                  headerTitle: 'AD.No')),
                          SizedBox(
                            width: 02,
                          ),
                          Expanded(
                              flex: 4,
                              child: CatrgoryTableHeaderWidget(
                                  headerTitle: 'Name')),
                          SizedBox(
                            width: 02,
                          ),
                          Expanded(
                              flex: 4,
                              child: CatrgoryTableHeaderWidget(
                                  headerTitle: 'E mail')),
                          SizedBox(
                            width: 02,
                          ),
                          Expanded(
                              flex: 3,
                              child: CatrgoryTableHeaderWidget(
                                  headerTitle: 'Ph.NO')),
                          SizedBox(
                            width: 02,
                          ),
                          Expanded(
                              flex: 2,
                              child: CatrgoryTableHeaderWidget(
                                  headerTitle: 'Class')),
                          SizedBox(
                            width: 02,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    // width: 1200,
                    decoration: BoxDecoration(
                      color: cWhite,
                      border: Border.all(color: cWhite),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5, left: 5),
                      child: SizedBox(
                          // width: 1100,
                          child: StreamBuilder<List<StudentModel>>(
                        stream: ioTCardController.fetchClassAllStudents(),
                        builder: (context, snaPS) {
                          log("count ${ioTCardController.classStudentList.length}");
                          if (snaPS.hasData) {
                            return ListView.separated(
                                itemBuilder: (context, index) {
                                  return ClassWiseStudentDataList(
                                    data: ioTCardController
                                        .registudentList[index],
                                    index: index,
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return const SizedBox(
                                    height: 02,
                                  );
                                },
                                itemCount:
                                    ioTCardController.registudentList.length);
                          } else if (snaPS.data == null) {
                            return const LoadingWidget();
                          } else {
                            return const LoadingWidget();
                          }
                        },
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
      floatingActionButton: GestureDetector(
        onTap: () {
          Get.bottomSheet(
              Container(
                constraints: const BoxConstraints(maxHeight: 300),
                color: cWhite));
        },
        child: const SizedBox(
          height: 40,
          child: RouteSelectedTextContainer(title: 'Registered Students',width: 150,)),
      ),
    );
  }
}
