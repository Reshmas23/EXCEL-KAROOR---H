import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';
import 'package:vidyaveechi_website/view/widgets/loading_widget/loading_widget.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';

class TotalClassViewContainer extends StatelessWidget {
  const TotalClassViewContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ResponsiveWebSite.isMobile(context) ? 320 : 420,
      width: ResponsiveWebSite.isMobile(context) ? double.infinity : 450,
      decoration: BoxDecoration(
          color: cWhite, border: Border.all(color: cBlack.withOpacity(0.1))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25, left: 20),
            child: Row(
              children: [
                TextFontWidget(
                  text: "All Classes",
                  fontsize: ResponsiveWebSite.isMobile(context) ? 12 : 17,
                  fontWeight: FontWeight.bold,
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10, right: 10),
                  child: TextFontWidget(
                    text: "View All",
                    fontsize: ResponsiveWebSite.isMobile(context) ? 12 : 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: AllClassListViewContainer(),
            ),
          )
        ],
      ),
    );
  }
}

class AllClassListViewContainer extends StatelessWidget {
  const AllClassListViewContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final date = DateTime.now();
    DateTime parseDate = DateTime.parse(date.toString());
    final month = DateFormat('MMMM-yyyy');
    // ignore: unused_local_variable
    String monthwise = month.format(parseDate);
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    String formatted = formatter.format(parseDate);
    return StreamBuilder(
        stream: server
            .collection('SchoolListCollection')
            .doc(UserCredentialsController.schoolId)
            .collection(UserCredentialsController.batchId!)
            .doc(UserCredentialsController.batchId)
            .collection('TodayActiveClasses')
            .doc(formatted)
            .collection('Classes')
            .snapshots(),
        builder: (context, snaps) {
          if (snaps.hasData) {
            return snaps.data!.docs.isEmpty
                ? const Text('Please take attendece in application !!!')
                : ListView.separated(
                    itemBuilder: (context, index) {
                      final data = snaps.data!.docs[index].data();
                      return Container(
                        height: 60,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 176, 238, 178)
                                .withOpacity(0.1),
                            border: Border.all(
                                color: Colors.grey.withOpacity(0.1))),
                        child: ListTile(
                          title: StreamBuilder(
                              stream: server
                                  .collection('SchoolListCollection')
                                  .doc(UserCredentialsController.schoolId)
                                  .collection(
                                      UserCredentialsController.batchId!)
                                  .doc(UserCredentialsController.batchId)
                                  .collection('classes')
                                  .doc(data['docid'])
                                  .snapshots(),
                              builder: (context, classSnap) {
                                if (classSnap.hasData) {
                                  return TextFontWidget(
                                    text: classSnap.data!.data()!['className'],
                                    fontsize:
                                        ResponsiveWebSite.isMobile(context)
                                            ? 12
                                            : 14,
                                    fontWeight: FontWeight.w600,
                                  );
                                } else {
                                  return TextFontWidget(
                                    text: ' ......',
                                    fontsize:
                                        ResponsiveWebSite.isMobile(context)
                                            ? 12
                                            : 14,
                                    fontWeight: FontWeight.w600,
                                  );
                                }
                              }),
                          trailing: SizedBox(
                            width:
                                ResponsiveWebSite.isMobile(context) ? 100 : 200,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    color: Colors.green.withOpacity(0.2),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                         TextFontWidget(
                                          text: "Pr",
                                          fontsize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        TextFontWidget(
                                          text:data['presentStudents'].toString(),
                                          fontsize: 10,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    color: Colors.red.withOpacity(0.2),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                         TextFontWidget(
                                          text: "Ab",
                                          fontsize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        TextFontWidget(
                                          text: data['absentStudents'].toString(),
                                          fontsize: 10,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    color: Colors.blue.withOpacity(0.4),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                         TextFontWidget(
                                          text: "Total",
                                          fontsize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        TextFontWidget(
                                          text: data['totalStudent']
                                              .toString(),
                                          fontsize: 10,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          subtitle: Row(
                            children: [
                              SizedBox(
                                height: ResponsiveWebSite.isMobile(context)
                                    ? 20
                                    : 25,
                                width: ResponsiveWebSite.isMobile(context)
                                    ? 20
                                    : 35,
                                child: Image.asset(
                                    'webassets/stickers/icons8-school-director-100.png'),
                              ),
                              Expanded(
                                child: StreamBuilder(
                                    stream: server
                                        .collection('SchoolListCollection')
                                        .doc(UserCredentialsController.schoolId)
                                        .collection('Teachers')
                                        .doc(data['teacherDocid'])
                                        .snapshots(),
                                    builder: (context, teacherSnap) {
                                      if (teacherSnap.hasData) {
                                        return TextFontWidget(
                                          text: teacherSnap.data!
                                              .data()!['teacherName'],
                                          fontsize: ResponsiveWebSite.isMobile(
                                                  context)
                                              ? 11
                                              : 12,
                                          fontWeight: FontWeight.w500,
                                        );
                                      } else {
                                        return TextFontWidget(
                                          text: '........',
                                          fontsize: ResponsiveWebSite.isMobile(
                                                  context)
                                              ? 11
                                              : 12,
                                          fontWeight: FontWeight.w500,
                                        );
                                      }
                                    }),
                              ),
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
                    itemCount: snaps.data!.docs.length);
          } else if (snaps.data == null) {
            return  Center(
              child:
                  TextFontWidget(text: 'Please take attendence', fontsize: 12),
            );
          } else {
            return const LoadingWidget();
          }
        });
  }
}
