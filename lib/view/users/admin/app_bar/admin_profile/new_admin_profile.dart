import 'package:awesome_side_sheet/Enums/sheet_position.dart';
import 'package:awesome_side_sheet/side_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';

@override
adminProfileshowlist(BuildContext context) {
  final adminprofilesListWidget = [
    Stack(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: CircleAvatar(
              child: Image.asset('assets/png/avathar.png'),
              radius: ResponsiveWebSite.isMobile(context) ? 50 : 70,
              backgroundColor: cred,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: ResponsiveWebSite.isMobile(context) ? 40 : 60,
            left: ResponsiveWebSite.isMobile(context) ? 90 : 125,
          ),
          child: Center(
            child: CircleAvatar(
              radius: ResponsiveWebSite.isMobile(context) ? 12 : 15,
              backgroundColor: Colors.cyanAccent,
            ),
          ),
        ),
        Center(
            child: Padding(
          padding: EdgeInsets.only(
            top: ResponsiveWebSite.isMobile(context) ? 45 : 65,
            left: ResponsiveWebSite.isMobile(context) ? 90 : 125,
          ),
          child: Icon(
            Icons.edit_square,
            size: ResponsiveWebSite.isMobile(context) ? 15 : 18,
          ),
        )),
      ],
    ),
    ////////////////////////////////........................0
    Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Center(
          child: Text(
        'Name',
        style: TextStyle(
            fontSize: ResponsiveWebSite.isMobile(context) ? 15 : 18,
            fontWeight: FontWeight.bold),
      )),
    ), ///////////////////////////////............1
    Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Center(
          child: Text(
        'Designation',
        style: TextStyle(
            fontSize: ResponsiveWebSite.isMobile(context) ? 14 : 16,
            fontWeight: FontWeight.bold),
      )),
    ), /////////////////////////..............2

    Padding(
      padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
      child: Text(
        "About",
        style: TextStyle(
            fontSize: ResponsiveWebSite.isMobile(context) ? 14 : 17,
            fontWeight: FontWeight.bold),
      ),
    ), /////////////////////////.....................3
    Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Text(
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        style: TextStyle(
            fontSize: ResponsiveWebSite.isMobile(context) ? 12 : 15,
            fontWeight: FontWeight.w500),
      ),
    ),
    ////////////////////////..................4
    Padding(
      padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
      child: Text(
        "Contacts",
        style: TextStyle(
            fontSize: ResponsiveWebSite.isMobile(context) ? 14 : 16,
            fontWeight: FontWeight.bold),
      ),
    ),
    //////////////////////////////................5
    Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Icon(
              Icons.phone_iphone,
              size: ResponsiveWebSite.isMobile(context) ? 14 : 18,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Text(
              '46545645665465',
              style: TextStyle(
                  fontSize: ResponsiveWebSite.isMobile(context) ? 13 : 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Icon(
            Icons.edit,
            size: ResponsiveWebSite.isMobile(context) ? 14 : 16,
            color: cgreen,
          )
        ],
      ),
    ), ///////////////////////////////............................6
    Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Icon(
              Icons.email,
              size: ResponsiveWebSite.isMobile(context) ? 14 : 18,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Text(
              'lepton@gmail.com',
              style: TextStyle(
                  fontSize: ResponsiveWebSite.isMobile(context) ? 13 : 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Icon(
            Icons.edit,
            size: ResponsiveWebSite.isMobile(context) ? 14 : 16,
            color: cgreen,
          )
        ],
      ),
    ), ////////////////////////////////////////.............................7
    Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
            ),
            child: Icon(
              Icons.person,
              size: ResponsiveWebSite.isMobile(context) ? 14 : 18,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Text(
              'Gender',
              style: TextStyle(
                  fontSize: ResponsiveWebSite.isMobile(context) ? 13 : 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Icon(
            Icons.edit,
            size: ResponsiveWebSite.isMobile(context) ? 14 : 16,
            color: cgreen,
          )
        ],
      ),
    ), /////////////////////////////////..................................8
  ];

  aweSideSheet(
    context: context,
    sheetPosition: SheetPosition.right,
    backgroundColor: cWhite,
    header: Container(),
    showActions: false,
    footer: Container(),
    body: ResponsiveWebSite.isMobile(context)
        ? SingleChildScrollView(
            child: SafeArea(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BackButton(),
                    TextFontWidget(
                      text: "Profile",
                      fontsize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(Icons.logout),
                    )
                  ],
                ),
                adminprofilesListWidget[0],
                adminprofilesListWidget[1],
                adminprofilesListWidget[2],
                const Divider(
                  color: Colors.grey,
                ),
                adminprofilesListWidget[3],
                adminprofilesListWidget[4],
                const Divider(
                  color: Colors.grey,
                ),
                adminprofilesListWidget[5],
                adminprofilesListWidget[6],
                adminprofilesListWidget[7],
                adminprofilesListWidget[8],
              ],
            )),
          )
        : SingleChildScrollView(
            child: SafeArea(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BackButton(),
                    TextFontWidget(
                      text: "Profile",
                      fontsize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(Icons.logout),
                    )
                  ],
                ),
                adminprofilesListWidget[0],
                adminprofilesListWidget[1],
                adminprofilesListWidget[2],
                const Divider(
                  color: Colors.grey,
                ),
                adminprofilesListWidget[3],
                adminprofilesListWidget[4],
                const Divider(
                  color: Colors.grey,
                ),
                adminprofilesListWidget[5],
                adminprofilesListWidget[6],
                adminprofilesListWidget[7],
                adminprofilesListWidget[8],
              ],
            )),
          ),
  );
}
