// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/google_poppins_widget.dart';
import 'package:vidyaveechi_website/view/web_DashBoard/Login_dashBoard/side_menuBar/widget/costecDujologo.dart';

class WebSideBaeWidget extends StatelessWidget {
  int index;

  WebSideBaeWidget({
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            color: const Color.fromARGB(255, 26, 47, 90),
            child: ListView(
              children: [
                const CostechDujoLogoWidget(),
                SideBarMenuItemsWidget(
                  selectedIndex: index,
                  onTap: (index) {},
                )
              ],
            ),
          ),
        ),
        Expanded(
          flex: 6,
          child: Container(),
        )
      ],
    );
  }
}

class SideBarMenuItemsWidget extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;
  const SideBarMenuItemsWidget({
    required this.selectedIndex,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 26, 47, 90),
      height: 800,
      child: ListView.separated(
          itemBuilder: (context, index) {
            return ColoredBox(
              color:
                  selectedIndex == index ? themeColorBlue : Colors.transparent,
              child: ListTile(
                contentPadding: const EdgeInsets.only(
                  left: 10,
                ),

                onTap: () {
                  onTap.call(index);
                },
                iconColor: cWhite.withOpacity(0.6),
                leading: Icon(
                  sideMenuICons[index],
                  size: 13.2,
                ),
                title: GooglePoppinsWidgets(
                  text: sideMenu[index],
                  fontsize: 12.5,
                  color: cWhite.withOpacity(0.6),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 00,
            );
          },
          itemCount: sideMenu.length),
    );
  }
}

List<String> sideMenu = [
  'Staff Management',
 // 'Client Management',
  //'Video Management',
  'Article Management',
  // 'Visitors Pass',
  // 'Students Manage',
  // 'Students Payment',
  // 'Employee Manage',
  // 'Bill Manage',
  // 'Notice Board',
  // 'Settings',
  // 'Rules',
];
List<IconData> sideMenuICons = [
  Icons.people,
 // Icons.people,
 // Icons.video_settings,
  Icons.art_track_rounded,
  // Icons.confirmation_number_outlined,
  // Icons.people,
  // Icons.attach_money_outlined,
  // Icons.people,
  // Icons.receipt_long,
  // Icons.keyboard_alt_outlined,
  // Icons.settings,
  // Icons.gavel,
];
