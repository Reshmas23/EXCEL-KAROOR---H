import 'package:flutter/material.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/home/excel_karoor/Notice_display_widget.dart';
import 'package:vidyaveechi_website/view/home/excel_karoor/excelkaroor_homepage.dart';
import 'package:vidyaveechi_website/view/home/excel_karoor/home_appbar.dart';
import 'package:vidyaveechi_website/view/home/excel_karoor/our_team.dart';
import 'package:vidyaveechi_website/view/home/screens/footer/footer.dart';
import 'package:vidyaveechi_website/view/home/screens/footer/lepton_footerbar.dart';
import 'package:vidyaveechi_website/view/home/screens/footer/widgets/copyright_widget.dart';

import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor:
          const Color.fromARGB(255, 249, 247, 235).withOpacity(0.4),
      appBar: const PreferredSize(
          preferredSize: Size(double.infinity, 100),
          child: ResponsiveMobileAppBar()),
      body: ResponsiveWebSite.isMobile(context)
          ? ListView(
              children: const [
                ExcelKaroorHOmeScreen(),
                ExcelKaroorNoticedisplay(),
                OurTutionCenterContainer(),
                 Divider(
                  thickness: 01,
                  color: cBlack,
                ),
                FooterSectionScreen(),
                 Divider(
                  thickness: 01,
                  color: cBlack,
                ),
                LeptonFooterBar(),
                CopyRightWidget()
              ],
            )
          : ListView(
              children: const [
                ExcelKaroorHOmeScreen(),
                ExcelKaroorNoticedisplay(),
                OurTutionCenterContainer(),
                 Divider(
                  height: 05,
                  thickness: 01,
                  color: cBlack,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: FooterSectionScreen(),
                ),
                Divider(
                  // height: 05,
                  thickness: 01,
                  color: cBlack,
                ),
                LeptonFooterBar(),
                CopyRightWidget()
              ],
            ),
    );
  }
}
