import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vidyaveechi_website/view/home/screens/footer/widgets/alertDilogueBox.dart';
import 'package:vidyaveechi_website/view/login_section/user_loginpage.dart';
import 'package:vidyaveechi_website/view/widgets/drop_DownList/schoolDropDownList.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';

class HomePageDesign extends StatelessWidget {
  const HomePageDesign({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      width: ResponsiveWebSite.isDesktop(context)
          ? screenSize.width / 2.9
          : ResponsiveWebSite.isMobile(context)
              ? 200
              : screenSize.width / 2.5,
      height: ResponsiveWebSite.isDesktop(context)
          ? screenSize.width / 2.9
          : ResponsiveWebSite.isMobile(context)
              ? 200
              : screenSize.width / 2.5,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [
                0.1,
                0.4,
                0.6,
              ],
              colors: [
                Color.fromARGB(255, 6, 152, 225),
                Color.fromARGB(248, 3, 201, 231),
                Color.fromARGB(255, 124, 196, 232),
              ]),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(300),
              bottomLeft: Radius.circular(300),
              bottomRight: Radius.circular(300))),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: 15, right: ResponsiveWebSite.isTablet(context) ? 15 : 0),
            child: Container(
                height: ResponsiveWebSite.isDesktop(context)
                    ? screenSize.width / 3.1
                    : 405,
                width: ResponsiveWebSite.isDesktop(context)
                    ? screenSize.width / 3.1
                    : 380,

                // child: Image.asset("webassets/images/bg.pn g"),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("webassets/images/bg.png"))),
                child: Padding(
                  padding: EdgeInsets.only(
                      top: ResponsiveWebSite.isDesktop(context)
                          ? screenSize.width / 3.4
                          : screenSize.width / 2.9,
                      left: ResponsiveWebSite.isDesktop(context)
                          ? screenSize.width / 9
                          : screenSize.width / 7.5,
                      bottom: ResponsiveWebSite.isTablet(context) ? 5 : 0),
                  child: Text(
                    "വിദ്യാവീചി",
                    style: GoogleFonts.poppins(
                        fontSize: ResponsiveWebSite.isDesktop(context)
                            ? screenSize.width / 47
                            : screenSize.width / 45,
                        fontWeight: FontWeight.w700),
                  ),
                )),
          ),
          // Positioned(
          //     top: screenSize.width / 5,
          //     right: screenSize.width / 15,
          //     child: Text(
          //       "വിദ്യാവീചി",
          //       style: GoogleFonts.poppins(
          //           fontSize: screenSize.width / 40,
          //           fontWeight: FontWeight.w700),
          //     )),
          Positioned(
            top: screenSize.width / 60,
            right: screenSize.width / 50,
            child: SizedBox(
              height: ResponsiveWebSite.isDesktop(context)
                  ? screenSize.width / 60
                  : 20,
              width: ResponsiveWebSite.isDesktop(context)
                  ? screenSize.width / 12
                  : 100,
              child: ElevatedButton(
                  onPressed: () {
                    ResponsiveWebSite.isDesktop(context)
                        ? showDialog(
                            context: context,
                            barrierDismissible: false, // user must tap button!
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Enter Your School ID'),
                                content: const SingleChildScrollView(
                                  child: ListBody(
                                    children: <Widget>[
                                      GetSchoolListDropDownButton()
                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    child: const Text('Ok'),
                                    onPressed: () async {
                                      if (schoolListValue['docid'] == null) {
                                        return showDialog(
                                          context: context,
                                          barrierDismissible:
                                              false, // user must tap button!
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text('Alert'),
                                              content:
                                                  const SingleChildScrollView(
                                                child: ListBody(
                                                  children: <Widget>[
                                                    Text(
                                                        'Sorry you have no access to delete')
                                                  ],
                                                ),
                                              ),
                                              actions: <Widget>[
                                                TextButton(
                                                  child: const Text('Ok'),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      } else {
                                        await Navigator.push(context,
                                            MaterialPageRoute(
                                          builder: (context) {
                                            return const UserLoginPageScreen();
                                          },
                                        ));
                                      }
                                    },
                                  ),
                                  TextButton(
                                    child: const Text('Cancel'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          )
                        : mobileandTabAlert(context);
                  },
                  child: Text(
                    'LOGIN',
                    style: GoogleFonts.poppins(
                        fontSize: ResponsiveWebSite.isDesktop(context)
                            ? screenSize.width / 90
                            : 14,
                        fontWeight: FontWeight.bold),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
