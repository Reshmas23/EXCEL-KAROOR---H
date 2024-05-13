// import 'package:dash_board/view/fonts/text_widget.dart';
// import 'package:dash_board/view/pages/home/widgets/notice_display.dart';
// import 'package:dash_board/view/widgets/responsive/responsive.dart';
import 'package:flutter/material.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';

class StdNoticeBoardContainer extends StatelessWidget {
  const StdNoticeBoardContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final screensize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        width: ResponsiveWebSite.isTablet(context) ? 450 : 600,
        // height: 470,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding:
                  EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
              child: Row(
                children: [
                  TextFontWidget(
                    text: "Notice Board",
                    fontsize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                  Spacer(),
                  // const Icon(
                  //   Icons.more_horiz,
                  //   color: Colors.black38,
                  //   size: 30,
                  // ),
                ],
              ),
            ),
            StreamBuilder(
                stream: server
                    .collection("SchoolListCollection")
                    .doc(UserCredentialsController.schoolId)
                    .collection('AllUsersDeviceID')
                    .doc(serverAuth.currentUser!.uid)
                    .collection("Notification_Message")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(
                        child: Text('No Notifications available'));
                  } else {
                    return ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.docs.length,
                      separatorBuilder: (context, index) => const Divider(
                        color: Colors.grey,
                        height: 10,
                      ),
                      itemBuilder: (context, index) {
                        final data = snapshot.data!.docs[index].data();
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10, left: 10),
                              child: TextFontWidget(
                                text: data['headerText'] ?? "",
                                // "Great School",
                                fontsize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 15, left: 10, bottom: 15),
                              child: TextFontWidget(
                                text: data['messageText'] ?? "",
                                // "Great School manag mene esom tus eleifend lectus sed maximus mi faucibusnting.",
                                fontsize: 14,
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }
                }),

            // NoticeDisplayContainer(screensize: screensize,
            // text: "16 June,2023",
            // color: const Color.fromARGB(255, 251,213,64),
            // text1: "All PTA members meeting is there",
            // text2: "Principal",
            // ),
            // NoticeDisplayContainer(screensize: screensize,
            // text: "16 June,2023",
            // color: const Color.fromARGB(255, 249,57,161),
            // text1: "School anniversary is coming",
            // text2: "Principal",
            // ),
          ],
        ),
      ),
    );
  }
}

List<Color> colorList = [
  const Color.fromARGB(255, 64, 223, 205),
  const Color.fromARGB(255, 251, 213, 64),
  const Color.fromARGB(255, 249, 57, 161),
  const Color.fromARGB(255, 55, 81, 254)
];

List<String> text = [
  '16 June,2023',
  '16 June,2023',
  '16 June,2023',
  '16 June,2023'
];
List<String> text1 = [
  "School functions are coming so Get Ready",
  "All PTA members meeting is there",
  "School anniversary is coming",
  "Sports is coming"
];
List<String> text2 = ["Principal", "Principal", "Principal", "Principal"];
