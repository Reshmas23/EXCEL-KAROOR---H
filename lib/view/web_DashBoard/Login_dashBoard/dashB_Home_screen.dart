import 'package:flutter/material.dart';
import 'package:sidebar_drawer/sidebar_drawer.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/web_DashBoard/Login_dashBoard/side_menuBar/is_desktop.dart';
import 'package:vidyaveechi_website/view/web_DashBoard/Login_dashBoard/side_menuBar/widget/costecDujologo.dart';
import 'package:vidyaveechi_website/view/web_DashBoard/pages/article_management/articel_management.dart';
import 'package:vidyaveechi_website/view/web_DashBoard/pages/staff_management/staff_screen.dart';


// ignore: must_be_immutable
class DashBoardHomeScreen extends StatefulWidget {
  const DashBoardHomeScreen({super.key});

  @override
  State<DashBoardHomeScreen> createState() => _DashBoardHomeScreenState();
}

class _DashBoardHomeScreenState extends State<DashBoardHomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SidebarDrawer(
        body: ListView(
          children: [
            AppBar(
              backgroundColor: cWhite,
              leading: const DrawerIcon(),
            ),
            pages[selectedIndex]
          ],
        ),
        drawer: ListView(children: [
          const CostechDujoLogoWidget(),
          SideBarMenuItemsWidget(
            selectedIndex: selectedIndex,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
        ]),
      ),
    );
  }
}

List<Widget> pages = [
  StaffHomeScreen(),
  // const ClientDetailsScreen(),
 // const VideoManageMentHomeScreen(),
  const ArticleScreen()
];
