
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/widgets/table/table_widgets.dart';

import '../../../../controller/card_controller.dart';
import '../../../utils/shared_pref/user_auth/user_credentials.dart';


class ListofCard extends StatelessWidget {
  final CardController cardController =
      Get.put(CardController());
  ListofCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         const TextFontWidget(
          text: 'List Of Card',
          fontsize: 18,
          fontWeight: FontWeight.bold,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            width: 980,
            height: 800,
            child: Column(
              children: [
                const Row(
                  children: [
                    HeaderOfTable(text: "No.", flex: 1),
                    HeaderOfTable(text: "Student name", flex: 5),
                    HeaderOfTable(text: "Admission number", flex: 5),
                       HeaderOfTable(text: "Card Id", flex: 5),
                    HeaderOfTable(text: "Time", flex: 5),
                      
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
                          .collection('CurrentStudentAttendance')
                          .snapshots(),
                      builder: (context, snapshot) {
           
                        if (snapshot.hasData) {
                          return ListView.separated(
                              itemBuilder: (context, index) {
                                final data = snapshot.data!.docs[index].data();

                                return SizedBox(
                                  width: 980,
                                  height: 45,
                                  child: Row(
                                    children: [
                                      TableListContainers(
                                          text: '${index + 1}', flex: 1),
                                      TableListContainers(
                                        text: data['studentName'] ?? '',
                                        flex: 5,
                                      ),
                                        TableListContainers(
                                        text: data['admissionNumber'] ?? '',
                                        flex: 5,
                                      ),
                                      TableListContainers(
                                        text: data['CardId'] ?? '',
                                        flex: 5,
                                      ),
                                      TableListContainers(
                                       
                                        text:   data['Time'] ?? '',
                                        flex: 5,
                                      ),
                                    
                                    //  TableListContainers(text: text, flex: flex)
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