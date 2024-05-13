// import 'package:dash_board/view/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';

// import '../../../../../../../../fonts/text_widget.dart';

class ParentNotification extends StatelessWidget {
  const ParentNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: cWhite,
        // height: 700,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: TextFontWidget(
                      text: "Notifications",
                      fontsize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // const Icon(Icons.more_horiz),
              ],
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
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Center(child: Text('No Notifications available')),
                    );
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
          ],
        ),
      ),
    );
  }
}
