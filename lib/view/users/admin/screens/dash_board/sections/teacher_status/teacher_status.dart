import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';
import 'package:vidyaveechi_website/view/widgets/loading_widget/loading_widget.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';

class TotalTeacherViewContainer extends StatelessWidget {
  const TotalTeacherViewContainer({super.key});

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
            child: TextFontWidget(
              text: "All Teachers",
              fontsize: ResponsiveWebSite.isMobile(context) ? 12 : 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: AllTeacherStatusListView(),
            ),
          )
        ],
      ),
    );
  }
}

class AllTeacherStatusListView extends StatelessWidget {
  const AllTeacherStatusListView({super.key});

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
            return  snaps.data!.docs.isEmpty
                ? const Text('Please take attendece in application !!!')
                :   ListView.separated(
                itemBuilder: (context, index) {
                  final data = snaps.data!.docs[index].data();
                  return Container(
                    height: 60,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 176, 238, 178)
                            .withOpacity(0.1),
                        border:
                            Border.all(color: Colors.grey.withOpacity(0.1))),
                    child: ListTile(
                      leading: const CircleAvatar(
                        radius: 15,
                        child: CircleAvatar(
                          backgroundColor: cWhite,
                          radius: 10,
                        ),
                      ),
                      title: StreamBuilder(
                          stream: server
                              .collection('SchoolListCollection')
                              .doc(UserCredentialsController.schoolId)
                              .collection('Teachers')
                              .doc(data['teacherDocid'])
                              .snapshots(),
                          builder: (context, teacherSnap) {
                            if (teacherSnap.hasData) {
                              return TextFontWidget(
                                text: teacherSnap.data!.data()!['teacherName'],
                                fontsize: ResponsiveWebSite.isMobile(context)
                                    ? 11
                                    : 12,
                                fontWeight: FontWeight.w500,
                              );
                            } else {
                              return TextFontWidget(
                                text: '........',
                                fontsize: ResponsiveWebSite.isMobile(context)
                                    ? 11
                                    : 12,
                                fontWeight: FontWeight.w500,
                              );
                            }
                          }),
                      subtitle: Row(
                        children: [
                          Expanded(
                            child: TextFontWidget(
                              text: data['subjectName'],
                              fontsize:
                                  ResponsiveWebSite.isMobile(context) ? 11 : 12,
                              fontWeight: FontWeight.w500,
                            ),
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
            return TextFontWidget(
              text: 'PLease take attendence',
              fontsize: ResponsiveWebSite.isMobile(context) ? 11 : 12,
              fontWeight: FontWeight.w500,
            );
          } else {
            return const LoadingWidget();
          }
        });
  }
}
