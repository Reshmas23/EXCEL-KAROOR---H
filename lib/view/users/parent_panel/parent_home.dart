// import 'package:dash_board/view/colors/colors.dart';
// import 'package:dash_board/view/constant/constant.dart';
// import 'package:dash_board/view/fonts/google_poppins.dart';
// import 'package:dash_board/view/pages/home/users_panel/admin_panel/admin_appBar/admin_appBar.dart';
// import 'package:dash_board/view/pages/home/users_panel/admin_panel/drawer/drawer_pages.dart';
// import 'package:dash_board/view/pages/home/users_panel/parent_panel/pages/parent_dashboard/parent_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:sidebar_drawer/sidebar_drawer.dart';
import 'package:vidyaveechi_website/info/info.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/constantvalidate.dart';
import 'package:vidyaveechi_website/view/fonts/google_poppins_widget.dart';
// import 'package:vidyaveechi_website/view/users/admin/drawer/drawer_pages.dart';
import 'package:vidyaveechi_website/view/users/parent_panel/pages/parent_dashboard.dart';
import 'package:vidyaveechi_website/view/users/parent_panel/pages/parent_dashboard/parent_drawer/parent_drawer.dart';
import 'package:vidyaveechi_website/view/users/parent_panel/parent_appbar/parent_appBar.dart';

class ParentHomeScreen extends StatefulWidget {
  const ParentHomeScreen({super.key});

  @override
  State<ParentHomeScreen> createState() => _ParentHomeScreenState();
}

class _ParentHomeScreenState extends State<ParentHomeScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhite,
      body: SafeArea(
        child: SidebarDrawer(
            body: ListView(
              children: [
                AppBarParentPanel(),

                pages[selectedIndex],
              ],
            ),
            drawer: Container(
              color: cWhite,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 0, bottom: 550),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 30,
                              child: Image.asset(logoImage,
                                fit: BoxFit.fill,
                              ),
                            ),
                            GooglePoppinsWidgets(
                              text: name,
                              fontsize: 20,
                              fontWeight: FontWeight.w500,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 12),
                        child: Text(
                          "Main Menu",
                          style: TextStyle(
                              color: cBlack.withOpacity(
                                0.4,
                              ),
                              fontSize: 12),
                        ),
                      ),
                      sHeight10,
                      DrawerSelectedPagesSectionOfParent(
                        selectedIndex: selectedIndex,
                        onTap: (index) {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                      )
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}

List<Widget> pages = [
  const ParentDashBoardContainer(),
  Center(
    child: Text(sideMenu[1]),
  ),
  Center(
    child: Text(sideMenu[2]),
  ),
  Center(
    child: Text(sideMenu[3]),
  ),
  Center(
    child: Text(sideMenu[4]),
  ),
  Center(
    child: Text(sideMenu[5]),
  ),
  Center(
    child: Text(sideMenu[6]),
  ),
  Center(
    child: Text(sideMenu[7]),
  ),
  Center(
    child: Text(sideMenu[8]),
  ),
  Center(
    child: Text(sideMenu[9]),
  ),
  Center(
    child: Text(sideMenu[10]),
  ),
  Center(
    child: Text(sideMenu[11]),
  ),
];
List<String> sideMenu = [
  'Attendence',
  'Food Manage',
  'Rooms Manage',
  'Leave Requests',
  'Visitors Pass',
  'Students Manage',
  'Students Payment',
  'Employee Manage',
  'Bill Manage',
  'Notice Board',
  'Settings',
  'Rules',
];
