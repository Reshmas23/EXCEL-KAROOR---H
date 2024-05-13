import 'package:awesome_side_sheet/Enums/sheet_position.dart';
import 'package:awesome_side_sheet/side_sheet.dart';
import 'package:flutter/material.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';

notificationShowingFunctionOnAppBar(BuildContext context) {
  aweSideSheet(
      context: context,
      sheetPosition: SheetPosition.right,
      title: "Notifications",
      body: SingleChildScrollView(
        // child: DefaultTabController(
        //   length: 2,
          child: Column(
            children: [
              TextFontWidget(text: 'All Notifications', fontsize: 15),
              // const TabBar(
              //   dividerColor: Colors.transparent,
              //   tabs: <Widget>[
              //     Tab(
              //       text: 'All Notifications',
              //       // icon: Icon(Icons.flight),
              //     ),
              //     Tab(
              //       text: 'New Notifications',
              //       // icon: Icon(Icons.flight),
              //     ),
              //   ],
              // ),
              SizedBox(
                height: 500,
                child: 
               // TabBarView(children: [
                  Container(
                    color: themeColorGreen.withOpacity(0.1),
                    height: 300,
                    child: StreamBuilder(
                        stream: server
                            .collection("SchoolListCollection")
                            .doc(UserCredentialsController.schoolId)
                            .collection('AllUsersDeviceID')
                            .doc(serverAuth.currentUser!.uid)
                            .collection("Notification_Message")
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else if (!snapshot.hasData ||
                              snapshot.data!.docs.isEmpty) {
                            return const Center(
                                child: Text('No Notifications available'));
                          } else {
                            return ListView.separated(
                                itemBuilder: (context, index) {
                                  final data =
                                      snapshot.data!.docs[index].data();
                                  return GestureDetector(
                                    onTap: () {},
                                    child: ListTile(
                                      title: Text(
                                        data['headerText'] != ""
                                            ? data['headerText']
                                            : 'No Title available',
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Text(
                                        data['messageText'] != ""
                                            ? data['messageText']
                                            : 'NO Content available',
                                        style: const TextStyle(fontSize: 11),
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return Container(
                                    height: 0.1,
                                    color:
                                        const Color.fromARGB(255, 12, 94, 14),
                                  );
                                },
                                itemCount: snapshot.data!.docs.length);
                          }
                        }),
                  ),
                  // Container(
                  //   color: themeColorGreen.withOpacity(0.1),
                  //   height: 300,
                  //   child: ListView.separated(
                  //       itemBuilder: (context, index) {
                  //         return GestureDetector(
                  //           onTap: () {},
                  //           child: const ListTile(
                  //             title: Text(
                  //               'Title',
                  //               style: TextStyle(
                  //                   fontSize: 12, fontWeight: FontWeight.bold),
                  //             ),
                  //             subtitle: Text(
                  //               'Notifications',
                  //               style: TextStyle(fontSize: 11),
                  //             ),
                  //           ),
                  //         );
                  //       },
                  //       separatorBuilder: (context, index) {
                  //         return Container(
                  //           height: 0.1,
                  //           color: const Color.fromARGB(255, 12, 94, 14),
                  //         );
                  //       },
                  //       itemCount: 20),
                  // ),
              //  ]),
              ),
            ],
          ),

      //  ),
      ),
      showCloseButton: false,
      footer: Container());
}
