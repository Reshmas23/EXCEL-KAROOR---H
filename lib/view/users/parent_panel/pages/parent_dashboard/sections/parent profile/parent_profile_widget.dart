// import 'package:dash_board/view/fonts/text_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/google_monstre.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';

// import '../../../../../../../../colors/colors.dart';

class ParentProfileWidget extends StatelessWidget {
  ParentProfileWidget({super.key});

  final String formatter = DateFormat.yMd().format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Container(
      color: cWhite,
      // width: 565,
      height: 160,
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 10),
        child: Row(
          children: [
             Padding(
              padding:  EdgeInsets.only(
                left: ResponsiveWebSite.isMobile(context) ?5: 10,
                top: 10,
              ),
              child: CircleAvatar(
                radius:ResponsiveWebSite.isMobile(context) ?50: 60,
                 backgroundImage: NetworkImage(UserCredentialsController
                                  .parentModel!.profileImageURL ??
                              ''),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60, left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFontWidget(
                    text: UserCredentialsController.parentModel!.parentName!,
                    fontsize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                   Padding(
                            padding: const EdgeInsets.only(top: 1),
                            child: FutureBuilder(
                                future: FirebaseFirestore.instance
                                    .collection("SchoolListCollection")
                                    .doc(UserCredentialsController.schoolId)
                                    .collection("AllStudents")
                                    .doc(UserCredentialsController
                                            .parentModel?.studentID ??
                                        '')
                                    .get(),
                                builder: (context, snap) {
                                  if (snap.hasData) {
                                    return GoogleMonstserratWidgets(
                                      text:
                                          'Student : ${snap.data?.data()?['studentName']}',
                                      fontsize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: cBlack.withOpacity(0.8),
                                    );
                                  } else {
                                    return const Text('');
                                  }
                                }),
                          ),
                  TextFontWidget(
                      text: formatter,
                      //"Thursday ,Nov 23 2023",
                      fontsize: 12),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
