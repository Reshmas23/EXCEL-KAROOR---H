import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/google_monstre.dart';
import 'package:vidyaveechi_website/view/fonts/google_poppins_widget.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/home/screens/create_school/Registration/registrationpage.dart';
import 'package:vidyaveechi_website/view/home/screens/create_school/create_school.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';

class ExcelKaroorHOmeScreen extends StatelessWidget {
  const ExcelKaroorHOmeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ResponsiveWebSite.isMobile(context) ? 402 : 900,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('webassets/excel_karror/tution_center3.jpg'),
            fit: BoxFit.cover),
      ),
      child: Column(
        children: [
          SizedBox(
              height: ResponsiveWebSite.isMobile(context)
                  ? 402
                  : 602, //const Color(0xFF17BDB5),
              child: ResponsiveWebSite.isMobile(
                      context) //--------------------------------> M O B I L E  V I E W
                  ? Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 100, right: 50),
                          child: SizedBox(
                            height: 110,
                            child: Column(
                              children: [
                                const Text(
                                  'EXCEL KAROOR',
                                  style: TextStyle(
                                      fontSize: 21,
                                      color: excelkaroorThemeColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 02),
                                  child: Text(
                                      'Most trusted brand for experienced tutoring',
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: cBlack,
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,MaterialPageRoute(builder: (context) {
                                        return RegisrationPage();
                                      },));
                                    },
                                    child: Container(
                                      width: 100,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          color: excelkaroorThemeColor.withOpacity(0.2),
                                          border: Border.all(color: cBlack),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      alignment: Alignment.center,
                                      child:  const TextFontWidget(
                                        text: "REGISTER",
                                        fontsize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: cBlack,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  : Column(
                      //--------------------------------> W E B  V I E W
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: 190,
                              right: ResponsiveWebSite.isTablet(context)
                                  ? 300
                                  : 300),
                          child: SizedBox(
                            height: 300,

                            ///
                            width: double.infinity,
                            child: Column(
                              children: [
                                Text(
                                  'EXCEL KAROOR',
                                  style: TextStyle(
                                      fontSize:
                                          ResponsiveWebSite.isTablet(context)
                                              ? 36
                                              : 50,
                                      color: excelkaroorThemeColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 02),
                                  child: Text(
                                      'Most trusted brand for experienced tutoring',
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: cBlack,
                                          fontWeight: FontWeight.w600)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 40,
                                        width: 130,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                                side: const BorderSide(
                                                    color: cBlack)),
                                            backgroundColor: Colors.transparent,
                                          ),
                                          onPressed: () {
                                            print("object");
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                              builder: (context) {
                                                return RegisrationPage();
                                              },
                                            ));
                                          },
                                          child: Text(
                                            'REGISTER',
                                            style: GoogleFonts.poppins(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ),
                                      // const SizedBox(
                                      //   width: 50,
                                      // ),
                                      // SizedBox(
                                      //   height: 40,
                                      //   width: 130,
                                      //   child: ElevatedButton(
                                      //     style: ElevatedButton.styleFrom(
                                      //         shape: RoundedRectangleBorder(
                                      //             borderRadius:
                                      //                 BorderRadius.circular(
                                      //                     20.0),
                                      //             side: const BorderSide(
                                      //                 color: cBlack)),
                                      //         backgroundColor:
                                      //             Colors.transparent),
                                      //     onPressed: () {
                                      //       Navigator.push(context,
                                      //           MaterialPageRoute(
                                      //         builder: (context) {
                                      //           return const SchoolProfile();
                                      //         },
                                      //       ));
                                      //     },
                                      //     child: Text(
                                      //       'Create',
                                      //       style: GoogleFonts.poppins(
                                      //           fontSize: 13,
                                      //           fontWeight: FontWeight.bold,
                                      //           color: Colors.black),
                                      //     ),
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class DujoHomeWebSiteDetails extends StatelessWidget {
  DujoHomeWebSiteDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: ResponsiveWebSite.isDesktop(context) ? 900 : 840,
            width: double.infinity,
            decoration: BoxDecoration(
                color: ResponsiveWebSite.isDesktop(context)
                    ? null
                    : const Color.fromARGB(255, 235, 227, 227),
                image: ResponsiveWebSite.isDesktop(context)
                    ? const DecorationImage(
                        image: AssetImage(
                            'webassets/excel_karror/dujo_schools_image.png'),
                        fit: BoxFit.fill)
                    : null),
            child: ResponsiveWebSite.isDesktop(context)
                ? WebSiteDiscriptionWidget(text1: text1, text2: text2)
                : Center(
                    child: WebSiteDiscriptionWidget(text1: text1, text2: text2),
                  )),
      ],
    );
  }

  List<String> text1 = [
    'Admin Login',
    'Class Teacher Login',
    'Parent Login',
    'Student Login',
    'Guardian Login',
    "Online Classes",
  ];
  List<String> text2 = [
    'Recorded Sessions',
    'Study Materials',
    'Notice and Events',
    'Attendance Updates',
    'Notifications and Alerts',
    "Chat Functionality",
  ];
}

class WebSiteDiscriptionWidget extends StatelessWidget {
  const WebSiteDiscriptionWidget({
    super.key,
    required this.text1,
    required this.text2,
  });

  final List<String> text1;
  final List<String> text2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        mainAxisAlignment: ResponsiveWebSite.isDesktop(context)
            ? MainAxisAlignment.end
            : MainAxisAlignment.center,
        crossAxisAlignment: ResponsiveWebSite.isDesktop(context)
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: SizedBox(
              width:
                  ResponsiveWebSite.isDesktop(context) ? 800 : double.infinity,
              height: ResponsiveWebSite.isDesktop(context) ? 200 : 300,
              child: Center(
                child: GooglePoppinsWidgets(
                  text:
                      "The  Excel Karoor The Tution App' is a collaborative effort of ExcelKaroor \n"
                      "\n"
                      "  Excel Karoor , designed to serve as a comprehensive mobile application for efficiently managing various \n"
                      "\n"
                      "aspects of Tution infrastructure in the state of Kerala, India. The app offers a range of features and \n"
                      "\n"
                      "functionalities catering to different stakeholders within the educational ecosystem.",
                  fontsize: 13,

                  // fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          SizedBox(
            height: ResponsiveWebSite.isDesktop(context) ? 300 : 200,
            width: ResponsiveWebSite.isDesktop(context) ? 800 : 300,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: ResponsiveWebSite.isDesktop(context) ? 260 : 160,
                    width: ResponsiveWebSite.isDesktop(context) ? 200 : 150,
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return SizedBox(
                            height:
                                ResponsiveWebSite.isDesktop(context) ? 40 : 27,
                            width:
                                ResponsiveWebSite.isDesktop(context) ? 100 : 80,
                            child: Row(
                              children: [
                                const CircleAvatar(
                                  radius: 04,
                                  backgroundColor: cBlack,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: GoogleMonstserratWidgets(
                                    text: text1[index],
                                    fontsize:
                                        ResponsiveWebSite.isDesktop(context)
                                            ? 13
                                            : 11,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height:
                                ResponsiveWebSite.isDesktop(context) ? 05 : 00,
                          );
                        },
                        itemCount: text1.length),
                  ),
                  SizedBox(
                    height: ResponsiveWebSite.isDesktop(context) ? 260 : 160,
                    width: ResponsiveWebSite.isDesktop(context) ? 200 : 150,
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return SizedBox(
                            height:
                                ResponsiveWebSite.isDesktop(context) ? 40 : 27,
                            width:
                                ResponsiveWebSite.isDesktop(context) ? 100 : 80,
                            child: Row(
                              children: [
                                const CircleAvatar(
                                  radius: 04,
                                  backgroundColor: cBlack,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: GoogleMonstserratWidgets(
                                    text: text2[index],
                                    fontsize:
                                        ResponsiveWebSite.isDesktop(context)
                                            ? 13
                                            : 11,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height:
                                ResponsiveWebSite.isDesktop(context) ? 05 : 00,
                          );
                        },
                        itemCount: text2.length),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: SizedBox(
              width: ResponsiveWebSite.isDesktop(context) ? 800 : 800,
              height: ResponsiveWebSite.isDesktop(context) ? 200 : 300,
              child: Center(
                child: GooglePoppinsWidgets(
                    text:
                        "' Excel Karoor  The Tution App' aims to revolutionize the way schools in Kerala manage\n"
                        "\n"
                        "their infrastructure and interact with their stakeholders. By providing a centralized platform\n"
                        "\n"
                        "for communication,learning, and administration, the app enhances the educational experience\n"
                        "\n"
                        "for students,simplifies administrative tasks,and fosters a more connected and engaged \n"
                        "\n"
                        "educational community.",
                    fontsize: 13,
                    fontWeight: FontWeight.w400),
              ),
            ),
          )
        ],
      ),
    );
  }
}

const containerColor = [
  [Color(0xff6448fe), Color(0xff5fc6ff)],
  [Color(0xFF26A69A), Color(0xFF26A69A)],
  [Color(0xfffe6197), Color(0xffffb463)],
  [Color.fromARGB(255, 30, 196, 30), Color.fromARGB(255, 79, 163, 30)],
  [Color.fromARGB(255, 116, 130, 255), Color.fromARGB(255, 86, 74, 117)],
  [Color.fromARGB(255, 205, 215, 15), Color.fromARGB(255, 224, 173, 22)],
  [Color.fromARGB(255, 208, 104, 105), Color.fromARGB(255, 241, 66, 66)],
  [Color.fromARGB(255, 6, 71, 157), Color.fromARGB(255, 6, 71, 157)],
  [
    Color.fromARGB(248, 54, 0, 79),
    Color.fromARGB(255, 58, 0, 84),
  ],
  [Color(0xFF26A69A), Color(0xFF26A69A)]
];
