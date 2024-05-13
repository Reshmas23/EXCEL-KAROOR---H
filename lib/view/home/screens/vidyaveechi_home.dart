import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/home/screens/create_school/Registration/registrationpage.dart';
import 'package:vidyaveechi_website/view/home/screens/create_school/create_school.dart';
import 'package:vidyaveechi_website/view/home/screens/home_page_contents%20.dart';
import 'package:vidyaveechi_website/view/home/screens/lepton_logo_appbar.dart';
import 'package:vidyaveechi_website/view/home/screens/tree_part.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';

class VidhyaVeechiHomePageResponsive extends StatelessWidget {
  const VidhyaVeechiHomePageResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: ResponsiveWebSite.isMobile(context)
          ? Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 35, bottom: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 100,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  color: Colors.transparent,
                                  child: Image.asset(
                                    "webassets/images/logo5.png",
                                  ),
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
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Text(
                                      "",
                                      style: GoogleFonts.dmSerifDisplay(
                                          color: const Color.fromARGB(255, 38, 93, 15),
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Text(
                                    "VidyaVeechi",
                                    style: GoogleFonts.dmSerifDisplay(
                                        color: const Color.fromARGB(255, 43, 97, 19),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                          child: SizedBox(
                        height: 50,
                        width: 100,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 70),
                          child: SizedBox(
                            height: 20,

                            width: 90,

                            // child: const HomePageDropDown()),
                            child: DropdownSearch<String>(
                              popupProps: PopupProps.menu(
                                showSelectedItems: true,
                                disabledItemFn: (String s) => s.startsWith('I'),
                              ),
                              items: const [
                                "About",
                                "Schools",
                                "Colleges",
                                "Study Materials",
                                "Carriers",
                                "Contact Us"
                              ],
                              dropdownDecoratorProps: const DropDownDecoratorProps(
                                dropdownSearchDecoration: InputDecoration(
                                    //labelText: "Menu mode",
                                    // hintText: "country in menu mode",
                                    ),
                              ),
                              onChanged: print,
                              selectedItem: "About",
                            ),
                          ),
                        ),
                      ))
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [
                          0.1,
                          0.4,
                          0.8,
                          0.9,
                        ],
                        colors: [
                          Color.fromARGB(255, 6, 152, 225),
                          Color.fromARGB(248, 3, 201, 231),
                          Color.fromARGB(255, 124, 196, 232),
                          Colors.white70
                        ]),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: cWhite,
                                    borderRadius: BorderRadius.all(Radius.circular(10))),
                                height: 30,
                                width: 100,
                                child: Center(
                                  child: Text(
                                    'LOGIN',
                                    style: GoogleFonts.poppins(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.purple),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          top: 5,
                          // top: screenSize.width / 15,
                        ),
                        child: Text(
                          "VIDYAVEECHI",
                          style: GoogleFonts.spectral(
                              fontSize: 35,
                              //fontSize: screenSize.width / 37,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          "Smart Pathways to the Parallel World",
                          style: GoogleFonts.spectral(fontSize: 13, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Center(
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 35),
                              child: Container(
                                height: 200,
                                width: 300,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "webassets/images/book-removebg-preview.png"),
                                        fit: BoxFit.fitWidth)),
                                child: const Align(
                                    alignment: Alignment.center,
                                    child: Text("വിദ്യാവീചി",
                                        style:
                                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 30),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(196, 150, 221, 215),
                            ),
                            onPressed: () {},
                            child: Text(
                              'What We Provide',
                              style: GoogleFonts.spectral(
                                  color: Colors.black, fontSize: 15, fontWeight: FontWeight.w600),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 20),
                        child: Text(
                          "Tution Center Solutions",
                          style: GoogleFonts.robotoSlab(fontSize: 22, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 15),
                        child: Text(
                          "For a demo, please register your school. Our team will contact you to onboard you to the Vidyaveechi app",
                          style: GoogleFonts.spectral(fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50, left: 10, bottom: 40, right: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  print("object");
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return RegisrationPage();
                                    },
                                  ));
                                },
                                child: SizedBox(
                                  height: 40,
                                  width: 130,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromARGB(255, 75, 131, 252),
                                      ),
                                      onPressed: () {},
                                      child: LayoutBuilder(
                                        builder:
                                            (BuildContext context, BoxConstraints constraints) {
                                          double fontSize = constraints.maxWidth > 1528 ? 8 : 11;
                                          return Text(
                                            'STUDENT REGISTRATION',
                                            style: GoogleFonts.poppins(
                                              fontSize: fontSize,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                            ),
                                            // Example of using the constraints to adjust text size
                                            // based on available width
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          );
                                        },
                                      )),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 40,
                                width: 130,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(255, 75, 131, 252),
                                      // backgroundColor: const Color.fromARGB(255, 102, 206, 169),
                                    ),
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (context) {
                                          return const SchoolProfile();
                                        },
                                      ));
                                    },
                                    child: LayoutBuilder(
                                      builder: (BuildContext context, BoxConstraints constraints) {
                                        return Text(
                                          'SCHOOL REGISTRATION',
                                          style: GoogleFonts.poppins(
                                            fontSize: constraints.maxWidth > 1528 ? 8 : 11,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                          ),
                                          // Example of using the constraints to adjust text size
                                          // based on available width
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        );
                                      },
                                    )),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          : Column(
              children: [
                Column(
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: ResponsiveWebSite.isTablet(context)
                                  ? 20
                                  : ResponsiveWebSite.isMobile(context)
                                      ? 10
                                      : 100),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 650,
                                width: screenSize.width,
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      stops: [
                                        0.1,
                                        0.4,
                                        0.6,
                                        0.8,
                                      ],
                                      colors: [
                                        Color.fromARGB(255, 6, 152, 225),
                                        Color.fromARGB(248, 3, 201, 231),
                                        Color.fromARGB(255, 124, 196, 232),
                                        Colors.white70
                                      ]),
                                ),
                                child: const HomePageContents(), ////////////text
                              ),
                            ],
                          ),
                        ),
                        LeptonLogoVidyaveechi(screenSize: screenSize), ///////////appbar
                        Positioned(
                          right: 50,
                          child: HomePageDesign(screenSize: screenSize), /////////////////tree
                        ),
                      ],
                    ),
                    // GridViewNew(screenSize: screenSize),
                    // Container(
                    //   height: screenSize.width / 5,
                    //   width: screenSize.width,
                    //   color: Colors.lightBlueAccent,
                    // ),
                  ],
                )
              ],
            ),
    );
  }
}
