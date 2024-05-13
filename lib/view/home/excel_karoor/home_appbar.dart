import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/home/excel_karoor/login_button.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';

const String _imageUrl =
    "https://firebasestorage.googleapis.com/v0/b/dujo-kerala-schools-1a6c5.appspot.com/o/dujocolleges.jpeg?alt=media&token=0c3fa202-c59f-47bd-b997-88f3128e6871";

const String _description = "Any schools from Kerala can register on\n"
    "Excel Karoor. Excel Karoor is a mobile application\n"
    "with student login,  parent login, teacher login";

final Uri _faceBookUrl =
    Uri.parse('https://www.facebook.com/groups/325622007563684/');
//final Uri _twitterUrl = Uri.parse('https://twitter.com/LeptonDujo');
final Uri _instaUrl = Uri.parse('https://www.instagram.com/excelkaroorxl/');
final Uri _utubeUrl =
    Uri.parse('https://www.youtube.com/channel/UCSDJa-gA4DYwXzaLxiAbaFw');
//final Uri _leptonUrl = Uri.parse('http://www.leptoncommunications.com');

Future<void> _launchFacebookUrl() async {
  if (!await launchUrl(_faceBookUrl)) {
    throw 'Could not launch $_faceBookUrl';
  }
}

// Future<void> _launchTwitterUrl() async {
//   if (!await launchUrl(_twitterUrl)) {
//     throw 'Could not launch $_twitterUrl';
//   }
// }

Future<void> _launchyouTubeUrl() async {
  if (!await launchUrl(_utubeUrl)) {
    throw 'Could not launch $_utubeUrl';
  }
}

Future<void> _launchInstaUrl() async {
  if (!await launchUrl(_instaUrl)) {
    throw 'Could not launch $_instaUrl';
  }
}

// Future<void> _launchleptonUrl() async {
//   if (!await launchUrl(_leptonUrl)) {
//     throw 'Could not launch $_leptonUrl';
//   }
// }

class ResponsiveMobileAppBar extends StatelessWidget {
  const ResponsiveMobileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    double maxWidthValue;
    return LayoutBuilder(builder: (context, constrain) {
      log(constrain.maxWidth.toString());

      maxWidthValue = constrain.maxWidth;
      return Container(
        color: const Color.fromARGB(255, 3, 9, 75),
        height: 100,
        child: Padding(
          padding:  EdgeInsets.symmetric(vertical: 5, horizontal: ResponsiveWebSite.isMobile(context) ?0: 20),
          child: Row(
            children: [
              SizedBox(
                width: ResponsiveWebSite.isTablet(context) ? 110 : 130,
                child: Image.asset(
                  'webassets/excel_karror/excel_karoor_logo.png',
                  fit: BoxFit.cover,
                  color: Colors.white,
                ),
              ),
              ResponsiveWebSite.isMobile(context)
                  ? const Text("")
                  : Padding(
                      padding: EdgeInsets.only(
                          top: 20,
                          left: ResponsiveWebSite.isDesktop(context) ? 20 : 0),
                      child: Column(
                        children: [
                          Text(
                            'E X C E L  K A R O O R',
                            style: TextStyle(
                                fontSize: ResponsiveWebSite.isDesktop(context)
                                    ? 21
                                    : 15,
                                color: cWhite,
                                fontWeight: FontWeight.w600),
                          ),
                          ResponsiveWebSite.isTablet(context)
                              ? const Padding(
                                  padding: EdgeInsets.only(top: 02),
                                  child: Text(
                                      'Most trusted brand\nfor experienced tutoring',
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: cWhite,
                                      )),
                                )
                              : const Padding(
                                  padding: EdgeInsets.only(top: 02),
                                  child: Text(
                                      'Most trusted brand for experienced tutoring',
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: cWhite,
                                      )),
                                ),
                        ],
                      ),
                    ),
              const Spacer(),
              Column(
                children: [
                  const AppBarPhoneNumber(),
                  Visibility(
                    visible: maxWidthValue > 430,
                    child: Expanded(
                      child: Row(
                        children: [
                          const LoginButton(),
                          ResponsiveWebSite.isMobile(context)
                              ? const SizedBox()
                              : ListView(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  physics: const NeverScrollableScrollPhysics(),
                                  children: socailMediaList
                                      .map((data) => Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: InkWell(
                                                    onTap:
                                                        data.tilteFunExecution,
                                                    child: Image.asset(
                                                      data.imageString!,
                                                      height: 20,
                                                      width: 20,
                                                      color: Colors.white,
                                                    )),
                                              ),
                                            ],
                                          ))
                                      .toList()),
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: maxWidthValue < 430,
                    child: const Row(
                      children: [
                        LoginButton(),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}

class AppBarPhoneNumber extends StatelessWidget {
 // final double maxWidthValue;
  const AppBarPhoneNumber(
   // this.maxWidthValue, 
    { super.key,});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ResponsiveWebSite.isMobile(context)
          ? const Padding(
              padding: EdgeInsets.all(7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MobNumber01(),
                  MobNumber02(),
                ],
              ),
            )
          : const Padding(
              padding: EdgeInsets.all(7),
              child: Row(
                children: [
                  MobNumber01(),
                  MobNumber02(),
                ],
              ),
            ),
    );
  }
}

class MobNumber02 extends StatelessWidget {
  const MobNumber02({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '✉️ pramodoasis1@gmail.com',
      style: GoogleFonts.poppins(
          color: cWhite, fontSize: 12, fontWeight: FontWeight.w400),
    );
  }
}

class MobNumber01 extends StatelessWidget {
  const MobNumber01({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '📞 +91 9846293314    ',
      style: GoogleFonts.poppins(
          color: cWhite,
          //Color(0xFF17BDB5),
          fontSize: 13,
          fontWeight: FontWeight.w500),
    );
  }
}

class SocailMediaModel {
  SocailMediaModel({
    this.title,
    this.iconData,
    this.icon,
    this.assetImage,
    this.imageString,
    this.tilteFunExecution,
    this.iconFunExecution,
  });
  final String? title;
  final IconData? iconData;
  final Icon? icon;
  final Image? assetImage;
  final String? imageString;
  Function()? tilteFunExecution;
  Future<void>? iconFunExecution;
}

List<SocailMediaModel> socailMediaList = <SocailMediaModel>[
  SocailMediaModel(
      iconData: Icons.home,
      assetImage: Image.asset(
        'webassets/excel_karror/frdd.png',
      ),
      imageString: 'webassets/excel_karror/frdd.png',
      tilteFunExecution: _launchFacebookUrl),
  SocailMediaModel(
      iconData: Icons.home,
      assetImage: (Image.asset(
        'webassets/excel_karror/instag.png',
      )),
      imageString: 'webassets/excel_karror/instag.png',
      tilteFunExecution: _launchInstaUrl),
  SocailMediaModel(
      assetImage: (Image.asset(
        'webassets/excel_karror/utube.png',
      )),
      imageString: 'webassets/excel_karror/utube.png',
      tilteFunExecution: _launchyouTubeUrl),
];
