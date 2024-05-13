import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vidyaveechi_website/view/home/screens/appbar_row.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';

class LeptonLogoVidyaveechi extends StatelessWidget {
  const LeptonLogoVidyaveechi({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ResponsiveWebSite.isDesktop(context)
            ? Expanded(
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                          ),
                          child: Container(
                            height: 80,
                            width: 80,
                            color: Colors.transparent,
                            child: Image.asset(
                              "webassets/images/logo5.png",
                            ),
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(
                        //     left: 10,
                        //   ),
                        //   child: Container(
                        //     // height: 80,
                        //     width: 140,
                        //     color: Colors.transparent,
                        //     child: Image.asset(
                        //       "webassets/images/vvl1.png",
                        //     ),
                        //   ),
                        // ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10, left: 20),
                              child: Text(
                                "Lepton",
                                style: GoogleFonts.dmSerifDisplay(
                                    color: const Color.fromARGB(255, 38, 93, 15),
                                    fontSize: screenSize.width / 50,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                "VidyaVeechi",
                                style: GoogleFonts.dmSerifDisplay(
                                    color: const Color.fromARGB(255, 43, 97, 19),
                                    fontSize: screenSize.width / 60,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 60, left: screenSize.width / 20),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 15, right: 15),
                            child: ContentsHomePage1(),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 15),
                            child: ContentsHomePage2(),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 15),
                            child: ContentsHomePage3(),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 15),
                            child: ContentsHomePage4(),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 15),
                            child: ContentsHomePage5(),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 15),
                            child: ContentsHomePage6(),
                          ),
                        ],
                      ),
                    )
                    // ListViewData(screenSize: screenSize),
                  ],
                ),
              )
            : ResponsiveWebSite.isTablet(context)
                ? Expanded(
                    child: Container(
                      color: Colors.white,
                      height: 80,
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.,
                        children: [
                          Container(
                            height: screenSize.width / 10,
                            width: screenSize.width / 4.5,
                            color: Colors.white,
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: screenSize.width / 70,
                                  ),
                                  child: Container(
                                    height: screenSize.width / 15,
                                    width: screenSize.width / 15,
                                    color: Colors.transparent,
                                    child: Image.asset("webassets/images/logo5.png"),
                                  ),
                                ),
                                // Padding(
                                //   padding: EdgeInsets.only(
                                //     left: screenSize.width / 70,
                                //   ),
                                //   child: Container(
                                //     height: screenSize.width / 15,
                                //     width: screenSize.width / 15,
                                //     color: Colors.transparent,
                                //     child: Image.asset(
                                //         "webassets/images/leptonlogo.png"),
                                //   ),
                                // ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: screenSize.width / 70,
                                      ),
                                      child: Text(
                                        "Lepton",
                                        style: GoogleFonts.dmSerifDisplay(
                                            fontSize: 19, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(
                                      "VidyaVeechi",
                                      style: GoogleFonts.dmSerifDisplay(
                                          fontSize: 16, fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                              top: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 8, right: 8),
                                  child: ContentsHomePage1(),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 8),
                                  child: ContentsHomePage2(),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 8),
                                  child: ContentsHomePage3(),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 8),
                                  child: ContentsHomePage4(),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 8),
                                  child: ContentsHomePage5(),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 8),
                                  child: ContentsHomePage6(),
                                ),
                              ],
                            ),
                          )
                          // ListViewData(screenSize: screenSize),
                        ],
                      ),
                    ),
                  )
                : const Column()
      ],
    );
  }
}
