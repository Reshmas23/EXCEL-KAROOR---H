// ignore_for_file: prefer__fields, must_be_immutable, prefer_final_fields, prefer_const_constructors

import 'package:adaptive_ui_layout/flutter_responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:seo_renderer/renderers/image_renderer/image_renderer_vm.dart';
// import 'package:seo_renderer/renderers/text_renderer/text_renderer_vm.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/google_monstre.dart';
import 'package:vidyaveechi_website/view/home/screens/_drawer.dart';
import 'package:vidyaveechi_website/view/home/screens/create_school/create_school.dart';
import 'package:vidyaveechi_website/view/home/screens/feature_tile.dart';
import 'package:vidyaveechi_website/view/home/screens/footer/mob_footer.dart';
import 'package:vidyaveechi_website/view/home/screens/footer/widgets/footerhomep.dart';
import 'package:vidyaveechi_website/view/login_section/user_loginpage.dart';
import 'package:vidyaveechi_website/view/widgets/drop_DownList/schoolDropDownList.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';

class HomePageImages extends StatelessWidget {
  HomePageImages({super.key});

  // final String _imageUrl =
  //     "https://firebasestorage.googleapis.com/v0/b/dujo-kerala-schools-1a6c5.appspot.com/o/dujocolleges.jpeg?alt=media&token=0c3fa202-c59f-47bd-b997-88f3128e6871";

  String _description = "Any schools from Kerala can register on\n"
      "Lepton VIDYAVEECHI. Lepton VIDYAVEECHI is a mobile application\n"
      "with student login,  parent login, teacher login";

  Uri _faceBookUrl =
      Uri.parse('https://www.facebook.com/profile.php?id=100091062978371');
  Uri _twitterUrl = Uri.parse('https://twitter.com/LeptonDujo');
  Uri _instaUrl = Uri.parse('https://www.instagram.com/leptondujo/');
  Uri _utubeUrl = Uri.parse('https://www.youtube.com/@LEPTONDUJO/featured');
  Uri _leptonUrl = Uri.parse('http://www.leptoncommunications.com');

  Future<void> _launchFacebookUrl() async {
    if (!await launchUrl(_faceBookUrl)) {
      throw 'Could not launch $_faceBookUrl';
    }
  }

  Future<void> _launchTwitterUrl() async {
    if (!await launchUrl(_twitterUrl)) {
      throw 'Could not launch $_twitterUrl';
    }
  }

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

  Future<void> _launchleptonUrl() async {
    if (!await launchUrl(_leptonUrl)) {
      throw 'Could not launch $_leptonUrl';
    }
  }

  List<String> containerNames = [
    'DuJo Schools',
    'DuJo Colleges',
    'DuJo Institution ',
    'DuJo Professional',
  ];

  List<String> assetsimages = [
    "webassets/images/attitude_girl.png",
    "webassets/images/college.png",
    "webassets/images/intitute.png",
    "webassets/images/professional.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: const Color(0xFF17BDB5),
      backgroundColor: cWhite,
      body: ResponsiveWebSite.isMobile(context)
          ? SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        color: const Color(0xFF17BDB5),
                        width: double.infinity,
                        height: 70.h,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 15.h,
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ExploreDrawer(),
                                    ));
                              },
                              icon: const Icon(Icons.menu),
                            ),
                            //
                            SizedBox(
                              width: 20.h,
                            ),
                            Image.asset(
                              "webassets/images/leptdujo.png",
                              height: 130.h,
                              width: 100.h,
                            ),
                          ],
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 95.h),
                          child: Image.asset(
                            "webassets/images/dujo_schools_image.png",
                            fit: BoxFit.cover,
                          )),
                      FeatureTile(
                        iconImageUrl: "boy.png",
                        title: _description,
                        topMargin: 350.0.h,
                      ),
                      FeatureTile(
                          topMargin: 475.0.h,
                          iconImageUrl: "web_port.png",
                          title:
                              "A web portal is therefore adding the school infra"),
                      FeatureTile(
                          topMargin: 600.h,
                          iconImageUrl: "women1.png",
                          title: "Add Teacher Add classes Create and publish\n"
                              "notice Create and share events info"),

                      FeatureTile(
                          topMargin: 725.0.h,
                          iconImageUrl: "admin_login.png",
                          title: "Admin Login -   Add Teacher, Add classes,\n "
                              "Create and Publish Notices, Add Pta Members\n"
                              "Create and share events info, Mannage Meetings\n"
                              "Manage Recorded and Live Classes\n"),
                      FeatureTile(
                          topMargin: 850.0.h,
                          iconImageUrl: "class_teacher.png",
                          title: "ClassTeacher Login - Manage Student list, \n"
                              "Manage Subject, Manage Parent's list,\n"
                              "Manage Teacher's list,Upload progress reports \n"
                              "Create and upload timetable,Chat with parents\n"
                              "Online classes, Upload recorded classes\n"),
                      FeatureTile(
                          topMargin: 975.0.h,
                          iconImageUrl: "record.png",
                          title:
                              "Teacher Login -Manage Timetable, Manage Classes\n"
                              "Create Teaching Notes, Share Exam results\n"
                              "Upload Study Materials, Upload recorded classes\n"
                              "Schedule and conduct Online Classes"),
                      FeatureTile(
                          topMargin: 1105.0.h,
                          iconImageUrl: "students.png",
                          title: "Student Login - View assigned homework\n"
                              "View Schedule exam and test results, View notice\n"
                              "View Bus route on google Maps, View timetable \n"
                              "View Schedule events, View Progress report\n"
                              "Attent Live and view recorded class"),
                      FeatureTile(
                          topMargin: 1230.0.h,
                          iconImageUrl: "parents.png",
                          title:
                              "Parent login - Live Attendance, Progress Report\n"
                              "Live School bus tracking, Leave letter\n"
                              "Exam Result, Events and notice , Chat with teachers"),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 195.h, top: 285.h),
                            child: Text(
                              "Watch and Guide,\n"
                              "Let them study!",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 13.h,
                                  color: cBlack),
                            ),
                          )
                        ],
                      ),

                      ///
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: GoogleMonstserratWidgets(
                                text: 'Login in desktop or laptop',
                                fontsize: 16.h,
                                fontWeight: FontWeight.w600),
                            content: Container(
                                child: GoogleMonstserratWidgets(
                                    text: 'To get better Experience ',
                                    fontsize: 14.h,
                                    fontWeight: FontWeight.w600)),
                            actions: <Widget>[
                              TextButton(
                                child: GoogleMonstserratWidgets(
                                    text: 'Close',
                                    fontsize: 16.h,
                                    fontWeight: FontWeight.w600),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: cBlue,
                          borderRadius: BorderRadius.all(Radius.circular(8.h))),
                      height: 50.h,
                      width: 260.h,
                      child: Center(
                          child: GoogleMonstserratWidgets(
                        text: 'Register Schools',
                        fontsize: 20.h,
                        color: cWhite,
                        fontWeight: FontWeight.w600,
                      )),
                    ),
                  ),

                  SizedBox(
                    height: 30,
                  ),

                  ////////////////////////////////////////
                  ///

                  Stack(
                    children: [
                      SizedBox(
                          // margin: EdgeInsets.only(top: 50.h),
                          height: 300.h,
                          width: double.infinity,
                          // color: cBlue,

                          child: Image.asset(
                            'webassets/images/dujo_colleges_image.png',
                            fit: BoxFit.fill,
                          )),

                      ///////////////

                      FeatureTile(
                        iconImageUrl: "record.png",
                        topMargin: 325.0.h,
                        title:
                            "All the collages affiliated to any university in kerala \n"
                            "can register in DuJo colleges.",
                      ),
                      FeatureTile(
                        topMargin: 450.h,
                        iconImageUrl: "record.png",
                        title: "Live classes and recorded classes ",
                      ),

                      FeatureTile(
                          topMargin: 575.h,
                          iconImageUrl: "class_teacher.png",
                          title:
                              "Add Teacher, Add classes, Create and publish\n"
                              "notice Create and share events info"),

                      FeatureTile(
                          topMargin: 700.h,
                          iconImageUrl: "chatgpt.png",
                          title:
                              "Intergrated CHAT GPT will help students to prepare\n"
                              " assigenments and project"),

                      FeatureTile(
                          topMargin: 825.h,
                          iconImageUrl: "study_material.png",
                          title: "Study material upload."),

                      FeatureTile(
                          topMargin: 955.h,
                          iconImageUrl: "live.png",
                          title: "Live doubt clearing."),
                      //
                    ],
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: GoogleMonstserratWidgets(
                                text: 'Login in desktop or laptop',
                                fontsize: 16.h,
                                fontWeight: FontWeight.w600),
                            content: Container(
                                child: GoogleMonstserratWidgets(
                                    text: 'To get better Experience ',
                                    fontsize: 14.h,
                                    fontWeight: FontWeight.w600)),
                            actions: <Widget>[
                              TextButton(
                                child: GoogleMonstserratWidgets(
                                    text: 'Close',
                                    fontsize: 16.h,
                                    fontWeight: FontWeight.w600),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: cBlue,
                          borderRadius: BorderRadius.all(Radius.circular(8.h))),
                      height: 50.h,
                      width: 260.h,
                      child: Center(
                          child: GoogleMonstserratWidgets(
                        text: 'Register Colleges',
                        fontsize: 20.h,
                        color: cWhite,
                        fontWeight: FontWeight.w600,
                      )),
                    ),
                  ),

                  SizedBox(
                    height: 30,
                  ),

                  ////////////////////////////////////

                  Stack(
                    children: [
                      SizedBox(
                          height: 300.h,
                          width: double.infinity,
                          child: Container(
                              color: cred,
                              child: Image.asset(
                                'webassets/images/dujo_institutions_image.png',
                                fit: BoxFit.fill,
                              ))),
                      FeatureTile(
                        iconImageUrl: "boy.png",
                        topMargin: 325.0,
                        title: " Dujo is designed for coaching center \n"
                            "and finishing schools",
                      ),
                      FeatureTile(
                          topMargin: 450.0.h,
                          iconImageUrl: "teacher.jpg",
                          title: "Add Teacher Add classes Create and publish \n"
                              "notice Create and share events info"),
                      FeatureTile(
                          topMargin: 575.h,
                          iconImageUrl: "live.png",
                          title: "Live doubt clearing"),
                      FeatureTile(
                          topMargin: 700.h,
                          iconImageUrl: "live.png",
                          title: "Live mock tests"),
                      FeatureTile(
                          topMargin: 825.h,
                          iconImageUrl: "record.png",
                          title: "Hybrid courses"),
                      FeatureTile(
                          topMargin: 955.h,
                          iconImageUrl: "record.png",
                          title: "Recorded courses"),
                      FeatureTile(
                          topMargin: 1080.h,
                          iconImageUrl: "live.png",
                          title: "Live courses"),

                      ///
                    ],
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: GoogleMonstserratWidgets(
                                text: 'Login in desktop or laptop',
                                fontsize: 16.h,
                                fontWeight: FontWeight.w600),
                            content: Container(
                                child: GoogleMonstserratWidgets(
                                    text: 'To get better Experience ',
                                    fontsize: 14.h,
                                    fontWeight: FontWeight.w600)),
                            actions: <Widget>[
                              TextButton(
                                child: GoogleMonstserratWidgets(
                                    text: 'Close',
                                    fontsize: 16.h,
                                    fontWeight: FontWeight.w600),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: cBlue,
                          borderRadius: BorderRadius.all(Radius.circular(8.h))),
                      height: 50.h,
                      width: 260.h,
                      child: Center(
                          child: GoogleMonstserratWidgets(
                        text: 'Register Institutions',
                        fontsize: 12.h,
                        color: cWhite,
                        fontWeight: FontWeight.w600,
                      )),
                    ),
                  ),

                  SizedBox(
                    height: 30,
                  ),

                  ////////////////////////////////////////////

                  Stack(
                    children: [
                      SizedBox(
                          height: 300.h,
                          width: double.infinity,
                          child: Image.asset(
                              "webassets/images/dujo_professional_image.png",
                              fit: BoxFit.fill)),
                      FeatureTile(
                        iconImageUrl: "professional.png",
                        topMargin: 325.0.h,
                        title:
                            "Any educationals profitionals can register their\n"
                            " profile DuJo profitonails",
                      ),
                      FeatureTile(
                          topMargin: 450.h,
                          iconImageUrl: "teacher.jpg",
                          title: "Add Teacher Add classes Create and publish \n"
                              "notice Create and share events info"),
                      FeatureTile(
                          topMargin: 575.h,
                          iconImageUrl: "professional.png",
                          title:
                              "Professionals can invites their students to \n"
                              "join the app"),
                      FeatureTile(
                          topMargin: 695,
                          iconImageUrl: "live.png",
                          title: "Live doubt clearing"),
                      FeatureTile(
                          topMargin: 720,
                          iconImageUrl: "mock_test.png",
                          title: "Live mock tests"),
                      FeatureTile(
                          topMargin: 845,
                          iconImageUrl: "record.png",
                          title: "Hybrid courses"),
                      FeatureTile(
                          topMargin: 970,
                          iconImageUrl: "record.png",
                          title: "Recorded courses"),
                      FeatureTile(
                          topMargin: 1095,
                          iconImageUrl: "live.png",
                          title: "Live courses"),
                      ///////////////
                    ],
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: GoogleMonstserratWidgets(
                                text: 'Login in desktop or laptop',
                                fontsize: 16.h,
                                fontWeight: FontWeight.w600),
                            content: Container(
                                child: GoogleMonstserratWidgets(
                                    text: 'To get better Experience ',
                                    fontsize: 14.h,
                                    fontWeight: FontWeight.w600)),
                            actions: <Widget>[
                              TextButton(
                                child: GoogleMonstserratWidgets(
                                    text: 'Close',
                                    fontsize: 16.h,
                                    fontWeight: FontWeight.w600),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: cBlue,
                          borderRadius: BorderRadius.all(Radius.circular(8.h))),
                      height: 50.h,
                      width: 260.h,
                      child: Center(
                          child: GoogleMonstserratWidgets(
                        text: 'Register Professionals',
                        fontsize: 12.h,
                        color: cWhite,
                        fontWeight: FontWeight.w600,
                      )),
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  // const Divider(
                  //   color: cBlack,
                  // ),
                  SizedBox(
                    height: 20,
                  ),
                  FooterMob()
                ],
              ),
            )
          : ListView(children: [
              Container(
                color: Color(0xFFCE230C),
                //Color.fromARGB(255, 240, 240, 240),
                height: 60.h,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      //color: ,
                      width: 470.w,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10.w),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.phone,
                                  size: 20.w,
                                  color: cWhite,
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  '+91 8891436651',
                                  style: GoogleFonts.poppins(
                                      color: cWhite,
                                      //Color(0xFF17BDB5),
                                      fontSize: 16.w,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 20.h),
                          Row(
                            children: [
                              Icon(
                                Icons.mail,
                                size: 20.w,
                                color: cWhite,
                              ),
                              SizedBox(
                                width: 5.h,
                              ),
                              Text(
                                'info@leptondujo.com',
                                style: GoogleFonts.poppins(
                                    // adminePrimayColor,
                                    color: cWhite,
                                    fontSize: 16.w,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 90.w,
                    ),
                    SizedBox(
                      width: 500.w,
                      // color: cred,
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ///
                          SizedBox(
                            width: 10.w,
                          ),

                          ///
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 60.w),
                      child: SizedBox(
                        height: 30.h,
                        width: 100.w,
                        //  color: cBlue,
                        child: InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                barrierDismissible:
                                    false, // user must tap button!
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Enter Your School ID'),
                                    content: SingleChildScrollView(
                                      child: ListBody(
                                        children: const <Widget>[
                                          GetSchoolListDropDownButton()
                                        ],
                                      ),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        child: const Text('Ok'),
                                        onPressed: () async {
                                          if (schoolListValue['docid'] ==
                                              null) {
                                            return showDialog(
                                              context: context,
                                              barrierDismissible:
                                                  false, // user must tap button!
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: const Text('Alert'),
                                                  content:
                                                      SingleChildScrollView(
                                                    child: ListBody(
                                                      children: const <Widget>[
                                                        Text(
                                                            'Sorry you have no access to delete')
                                                      ],
                                                    ),
                                                  ),
                                                  actions: <Widget>[
                                                    TextButton(
                                                      child: const Text('Ok'),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
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
                                                return
                                                    //LoginScreen();
                                                    UserLoginPageScreen();
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
                              );
                            },
                            child: Container(
                                height: 25.h,
                                width: 65.w,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.w)),
                                    color: cWhite,
                                    border: Border.all(color: cred)),
                                child: Center(
                                  child: GoogleMonstserratWidgets(
                                    text: "Login",
                                    fontsize: 14.w,
                                    fontWeight: FontWeight.w600,
                                    color: cred,
                                  ),
                                ))
                            //Image.asset('webassets/images/login-button.png')

                            // Text(
                            //   'Login',
                            //   style: GoogleFonts.poppins(
                            //       fontSize: 18.w,
                            //       fontWeight: FontWeight.bold,
                            //       color: cred),
                            // ),
                            ),
                      ),
                    ),
                    SizedBox(
                      width: 95.w,
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 45.w),
                      //  width: MediaQuery.of(context).size.hidth / 4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              _launchFacebookUrl();
                            },
                            child: Image.asset(
                              'webassets/images/frdd.png',
                              height: 25.h,
                              width: 38.w,
                              color: adminePrimayColor,
                              //Color(0xFF17BDB5),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          InkWell(
                            onTap: () {
                              _launchInstaUrl();
                            },
                            child: Image.asset(
                              'webassets/images/instag.png',
                              height: 40.h,
                              width: 40.w,
                              color: adminePrimayColor,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          InkWell(
                            onTap: () {
                              _launchTwitterUrl();
                            },
                            child: Image.asset(
                              'webassets/images/twitt.png',
                              height: 29.h,
                              width: 30.w,
                              color: adminePrimayColor,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          InkWell(
                            onTap: () {
                              _launchyouTubeUrl();
                            },
                            child: Image.asset(
                              'webassets/images/utube.png',
                              height: 28.h,
                              width: 28.w,
                              color: adminePrimayColor,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Stack(children: [
                SizedBox(
                    height: 900.h,
                    width: double.infinity,
                    child: Image.asset(
                      'webassets/images/websiteHomepage.jpg',
                      fit: BoxFit.fill,
                    )),
                Padding(
                  padding: EdgeInsets.only(left: 1125.w, top: 30.h),
                  child: SizedBox(
                      //height: 150.h,
                      width: 450.w,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GoogleMonstserratWidgets(
                              text: 'Customer support',
                              fontsize: 15,
                              color: adminePrimayColor,
                              fontWeight: FontWeight.w500),
                          // SizedBox(
                          //     height: 85,
                          //     width: 270,
                          //     // color: cred                ,
                          //     child: Center(
                          //         child: Image.asset(
                          //       "webassets/images/COSTECH_bg.png",
                          //       fit: BoxFit.cover,
                          //     ))),
                          //sizedBoxH5,
                          GoogleMonstserratWidgets(
                            text: '10.00 AM to 06.00 PM, Mon-Fri',
                            fontWeight: FontWeight.w500,
                            fontsize: 15.sp,
                            color: adminePrimayColor,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          GoogleMonstserratWidgets(
                              text: '080 696 21 222',
                              fontsize: 25.w,
                              fontWeight: FontWeight.w700,
                              color: cred),
                        ],
                      )),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(right: 80.0.w, left: 80.w, top: 25.h),
                  child: SizedBox(
                    // color: cWhite,
                    width: MediaQuery.of(context).size.width,
                    height: 600.h, //const Color(0xFF17BDB5),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 10.w),
                                    // color: cBlue,
                                    width: 230.w,
                                    height: 50.h,

                                    child: Text(
                                      "V I D Y A V E E C H I",
                                      style: GoogleFonts.marvel(
                                        fontSize: 42.w,
                                        fontWeight: FontWeight.bold,
                                        // letterSpacing: 1.5,
                                        color: adminePrimayColor,
                                      ),
                                    ),
                                    // Image.asset(
                                    //   //"https://firebasestorage.googleapis.com/v0/b/leptonscipro-31792.appspot.com/o/files%2Fimages%2FLepton-removebg-preview.png?alt=media&token=cb2cbd20-7630-4681-8857-f8b245018453",
                                    //   "webassets/images/lepton2.png",

                                    //   width: 150.w,
                                    //   height: 150.h,
                                    // ),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(top: 60.h, left: 0.w),
                                    // color: cBlue,
                                    width: 210.w,
                                    height: 50.h,

                                    child: Image.asset(
                                      'webassets/images/dujon.png',
                                      width: 180.h,
                                      height: 170.h,
                                    ),
                                  ),
                                  // Image.asset(
                                  //   //"https://firebasestorage.googleapis.com/v0/b/leptonscipro-31792.appspot.com/o/files%2Fimages%2FLepton-removebg-preview.png?alt=media&token=cb2cbd20-7630-4681-8857-f8b245018453",
                                  //   "webassets/images/lepton2.png",

                                  //   width: 150.w,
                                  //   height: 150.h,
                                  // ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 85.h),
                                child: Container(
                                  // color: cred,

                                  child: Text(
                                    "Watch And Guide,\n" "Let Them Study !",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 40.w,
                                      fontWeight: FontWeight.bold,
                                      color: adminePrimayColor,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              // SizedBox(
                              // height: 20,),
                              MaterialButton(
                                //padding: EdgeInsets.all(20),
                                height: 60.h,
                                minWidth: 250.w,
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, SchoolProfile.route);
                                },
                                color: adminePrimayColor,
                                child: Center(
                                  child: Text(
                                    'Create Tution Center Profile',
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 16.w,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ]),
                  ),
                ),
              ]),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                          height: 800.h,
                          width: double.infinity,
                          child: Image(
                            image: AssetImage(
                              'webassets/images/dujo_schools_image.png',
                            ),
                            fit: BoxFit.fill,
                          )),
                      Container(
                        margin: EdgeInsets.only(left: 650, top: 155),
                        height: 800.h,
                        width: 1100.w,
                        // color: cBlue,
                        child: Center(
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GoogleMonstserratWidgets(
                                  color: cBlack,
                                  fontWeight: FontWeight.w500,
                                  fontsize: 14.sp,
                                  text:
                                      "The 'Lepton VIDYAVEECHI The Tution App' is a collaborative effort between Lepton Communications and \n"
                                      "\n"
                                      "Lepton, designed to serve as a comprehensive mobile application for efficiently managing various \n"
                                      "\n"
                                      "aspects of tution center infrastructure in the state of Kerala, India. The app offers a range of features and \n"
                                      "\n"
                                      "functionalities catering to different stakeholders within the educational ecosystem."),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      GoogleMonstserratWidgets(
                                          color: cBlack,
                                          fontsize: 14.sp,
                                          fontWeight: FontWeight.w700,
                                          text: "* Admin Login\n"),
                                      GoogleMonstserratWidgets(
                                          color: cBlack,
                                          fontsize: 14.sp,
                                          fontWeight: FontWeight.w700,
                                          text: "* Class Teacher Login\n"),
                                      GoogleMonstserratWidgets(
                                          color: cBlack,
                                          fontsize: 14.sp,
                                          fontWeight: FontWeight.w700,
                                          text: "* Parent Login\n"),
                                      GoogleMonstserratWidgets(
                                          color: cBlack,
                                          fontsize: 14.sp,
                                          fontWeight: FontWeight.w700,
                                          text: "* Student Login\n"),
                                      GoogleMonstserratWidgets(
                                          color: cBlack,
                                          fontsize: 14.sp,
                                          fontWeight: FontWeight.w700,
                                          text: "* Guardian Login \n"),
                                      GoogleMonstserratWidgets(
                                          color: cBlack,
                                          fontsize: 14.sp,
                                          fontWeight: FontWeight.w700,
                                          text: "* Online Classes \n"),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      GoogleMonstserratWidgets(
                                          color: cBlack,
                                          fontsize: 14.sp,
                                          fontWeight: FontWeight.w700,
                                          text: "* Recorded Sessions\n"),
                                      GoogleMonstserratWidgets(
                                          color: cBlack,
                                          fontsize: 14.sp,
                                          fontWeight: FontWeight.w700,
                                          text: "* Study Materials \n"),
                                      GoogleMonstserratWidgets(
                                          color: cBlack,
                                          fontsize: 14.sp,
                                          fontWeight: FontWeight.w700,
                                          text: "* Notices and Events \n"),
                                      GoogleMonstserratWidgets(
                                          color: cBlack,
                                          fontsize: 14.sp,
                                          fontWeight: FontWeight.w700,
                                          text: "* Attendance Updates \n"),
                                      GoogleMonstserratWidgets(
                                          color: cBlack,
                                          fontsize: 14.sp,
                                          fontWeight: FontWeight.w700,
                                          text:
                                              "* Notifications and Alerts \n"),
                                      GoogleMonstserratWidgets(
                                          color: cBlack,
                                          fontsize: 14.sp,
                                          fontWeight: FontWeight.w700,
                                          text: "* Chat Functionality \n"),
                                    ],
                                  ),
                                ],
                              ),

                              //   SizedBox(
                              // height: 30,),
                              GoogleMonstserratWidgets(
                                color: cBlack,
                                fontsize: 14.sp,
                                fontWeight: FontWeight.w500,
                                text: "\n"
                                    "'Lepton VIDYAVEECHI The Tution App' aims to revolutionize the way schools in Kerala manage\n"
                                    "\n"
                                    "their infrastructure and interact with their stakeholders. By providing a centralized platform\n"
                                    "\n"
                                    "for communication,learning, and administration, the app enhances the educational experience\n"
                                    "\n"
                                    "for students,simplifies administrative tasks,and fosters a more connected and engaged \n"
                                    "\n"
                                    "educational community.",
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  ////
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Divider(color: adminScreencolor
                  // Color(0xFFCE230C),
                  ),
              SizedBox(
                height: 20,
              ),
              FooterHomeP()
            ]),
    );
  }
}

class ContainerDecrationTabs extends StatelessWidget {
  ContainerDecrationTabs({
    required this.text,
    super.key,
  });
  String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, right: 10.w),
      child: Container(
          decoration: BoxDecoration(
              color: Color.fromARGB(252, 18, 71, 170),
              borderRadius: BorderRadius.all(Radius.circular(2.w))),
          height: 25.h,
          width: 95.w,
          child: Center(
              child: GoogleMonstserratWidgets(
            text: text,
            fontsize: 13.w,
            color: cWhite,
          ))),
    );
  }
}

class ImageContainerWidget extends StatelessWidget {
  final String imagename;
  const ImageContainerWidget({
    required this.imagename,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 460.h,
      width: 550.w,
      decoration: BoxDecoration(
          //  border: Border.all(),
          // color: cWhite,
          borderRadius: BorderRadius.all(Radius.circular(10.w))),
      child: Image.asset('webassets/images/$imagename', fit: BoxFit.fill),
    );
  }
}

class TextContainerWidget extends StatelessWidget {
  String text;
  String text1;
  String text2;
  String text3;
  String text4;
  String text5;
  String text6;
  String text7;
  String text8;

  TextContainerWidget({
    required this.text,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
    required this.text5,
    required this.text6,
    required this.text7,
    required this.text8,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25.w),
      height: 550.h,
      width: 550.w,
      decoration: BoxDecoration(
          //  border: Border.all(),
          // color: cWhite,
          borderRadius: BorderRadius.all(Radius.circular(10.w))),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
            GoogleMonstserratWidgets(
                text: text,
                fontsize: 18.sp,
                fontWeight: FontWeight.w900,
                color: cWhite),
            SizedBox(
              height: 10,
            ),
            GoogleMonstserratWidgets(
                text: text1,
                fontsize: 15.sp,
                fontWeight: FontWeight.w600,
                color: cWhite),
            SizedBox(
              height: 10,
            ),
            GoogleMonstserratWidgets(
                text: text2,
                fontsize: 15.sp,
                fontWeight: FontWeight.w600,
                color: cWhite),
            SizedBox(
              height: 10,
            ),
            GoogleMonstserratWidgets(
                text: text3,
                fontsize: 15.sp,
                fontWeight: FontWeight.w600,
                color: cWhite),
            SizedBox(
              height: 10,
            ),
            GoogleMonstserratWidgets(
                text: text4,
                fontsize: 15.sp,
                fontWeight: FontWeight.w600,
                color: cWhite),
            SizedBox(
              height: 10,
            ),
            GoogleMonstserratWidgets(
                text: text5,
                fontsize: 15.sp,
                fontWeight: FontWeight.w600,
                color: cWhite),
            SizedBox(
              height: 10,
            ),
            GoogleMonstserratWidgets(
                text: text6,
                fontsize: 15.sp,
                fontWeight: FontWeight.w600,
                color: cWhite),
            SizedBox(
              height: 10,
            ),
            GoogleMonstserratWidgets(
                text: text7,
                fontsize: 15.sp,
                fontWeight: FontWeight.w600,
                color: cWhite),
            SizedBox(
              height: 10,
            ),
            GoogleMonstserratWidgets(
                text: text8,
                fontsize: 15.sp,
                fontWeight: FontWeight.w600,
                color: cWhite),
          ]),
    );
  }
}
