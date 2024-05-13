import 'package:flutter/material.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/google_poppins_widget.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';


class CopyRightWidget extends StatelessWidget {
  const CopyRightWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlue[700],
      height: 60,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GooglePoppinsWidgets(
            text: 'Copyright ©️ All right reserved | by LeptonCommunications',
            fontsize: ResponsiveWebSite.isMobile(context) ? 8 : 15,
            fontWeight: FontWeight.w500,
            color: cWhite,
          )
        ],
      ),
    );
  }
}