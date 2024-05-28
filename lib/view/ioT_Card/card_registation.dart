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
import 'package:vidyaveechi_website/view/widgets/routeSelectedTextContainer/routeSelectedTextContainer.dart';

class ClassWiseStudentListContainer extends StatelessWidget {
  final IoTCardController ioTCardController = Get.put(IoTCardController());

  ClassWiseStudentListContainer({super.key});

  @override
  Widget build(BuildContext context) {
    log("Schhol Id ${ioTCardController.schoolDocID.value}");
    log("batchDocID Id ${ioTCardController.batchDocID.value}");
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            color: screenContainerbackgroundColor,
            height: 1000,
            width: 1200,
            child: Padding(
              padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
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
                        SizedBox(
                            height: 60,
                            width: 200,
                            child: CardSelectClassDropDown()),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Row(
                    children: [
                      RouteSelectedTextContainer(
                        title: 'All Students',
                        width: 200,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Spacer(),
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
                                child: CatrgoryTableHeaderWidget(
                                    headerTitle: 'No')),
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
                          child: Obx(() => StreamBuilder(
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
                                builder: (context, snaPS) {
                                  if (snaPS.hasData) {
                                    return ListView.separated(
                                        itemBuilder: (context, index) {
                                          final data = StudentModel.fromMap(
                                              snaPS.data!.docs[index].data());
                                          return GestureDetector(
                                            onTap: () {},
                                            child: StreamBuilder(
                                                stream: server
                                                    .collection(
                                                        'StudentRegistration')
                                                    .doc('CardData')
                                                    .snapshots(),
                                                builder: (context, cardSnaps) {
                                                  if (cardSnaps.data
                                                          ?.data()?['CardID'] !=
                                                      '') {
                                                    print("Calling...........");
                                                    Get.find<
                                                            IoTCardController>()
                                                        .getAllCardID();
                                                    for (var i = 0;
                                                        i <
                                                            snaPS.data!.docs
                                                                .length;
                                                        i++) {
                                                          
                                                      Get.find<
                                                              IoTCardController>()
                                                          .cardAsignToStudent(
                                                        snaPS.data?.docs[i].data()['docid'],
                                                      );
                                                    }
                                                  }
                                                  return ClassWiseStudentDataList(
                                                    serverData: snaPS
                                                        .data!.docs[0]
                                                        .data(),
                                                    data: data,
                                                    index: index,
                                                  );
                                                }),
                                          );
                                        },
                                        separatorBuilder: (context, index) {
                                          return const SizedBox(
                                            height: 02,
                                          );
                                        },
                                        itemCount: snaPS.data!.docs.length);
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
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
