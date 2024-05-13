import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/widgets/custom_delete_showdialog/custom_delete_showdialog.dart';
import 'package:vidyaveechi_website/view/widgets/table/table_widgets.dart';

import '../../../../../controller/batch_yearController/batch_year_Controller.dart';
import '../../../../utils/shared_pref/user_auth/user_credentials.dart';

class BatchHistroyListPage extends StatelessWidget {
  final BatchYearController batchYearController =
      Get.put(BatchYearController());
  BatchHistroyListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         TextFontWidget(
          text: 'List Of Batch',
          fontsize: 18,
          fontWeight: FontWeight.bold,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            width: 870,
            height: 800,
            child: Column(
              children: [
                const Row(
                  children: [
                    HeaderOfTable(text: "No.", flex: 1),
                    HeaderOfTable(text: "Batch Name", flex: 3),
                    HeaderOfTable(text: "Delete Option", flex: 3),
                    //  HeaderOfTable(text: "Create By", flex: 2),
                    // HeaderOfTable(text: "Total Students", flex: 2),
                    // HeaderOfTable(text: "Total Staff", flex: 2),
                  ],
                ),
                Expanded(
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('SchoolListCollection')
                          .doc(UserCredentialsController.schoolId)
                          .collection('BatchYear')
                          .snapshots(),
                      builder: (context, snapshot) {
           
                        if (snapshot.hasData) {
                          return ListView.separated(
                              itemBuilder: (context, index) {
                                final data = snapshot.data!.docs[index].data();

                                return SizedBox(
                                  width: 870,
                                  height: 45,
                                  child: Row(
                                    children: [
                                      TableListContainers(
                                          text: '${index + 1}', flex: 1),
                                      TableListContainers(
                                        text: data['id'] ?? '',
                                        flex: 3,
                                      ),
                                      TableListContainers(
                                        onTap: () {
                                          customDeleteShowDialog(
                                              context: context,
                                              onTap: () {
                                                batchYearController
                                                    .enableDelete(data['id']);
                                                Navigator.of(context).pop();
                                              });
                                          log(data['id']);
                                        },
                                        text: 'Delete',
                                        flex: 3,
                                      ),
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                    height: 1,
                                  ),
                              itemCount: snapshot.data!.docs.length);
                        } else {
                          return const Text('No data found');
                        }
                      }),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}