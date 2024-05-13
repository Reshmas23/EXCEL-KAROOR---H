import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vidyaveechi_website/view/home/screens/create_school/Registration/registrationpage.dart';
import 'package:vidyaveechi_website/view/home/screens/create_school/create_school.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';

class HomePageContents extends StatelessWidget {
  const HomePageContents({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: ResponsiveWebSite.isDesktop(context) ? screenSize.width / 20 : 40,
            top: ResponsiveWebSite.isDesktop(context) ? screenSize.width / 15 : 125,
          ),
          child: Text(
            "VIDYAVEECHI",
            style: GoogleFonts.spectral(
                fontSize: ResponsiveWebSite.isDesktop(context) ? screenSize.width / 37 : 28,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: ResponsiveWebSite.isDesktop(context) ? screenSize.width / 20 : 40),
          child: Text(
            "Smart Pathways to the Parallel World",
            style: GoogleFonts.spectral(
                fontSize: ResponsiveWebSite.isDesktop(context)
                    ? screenSize.width / 50
                    : screenSize.width / 50,
                fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: ResponsiveWebSite.isDesktop(context) ? screenSize.width / 20 : 40,
            top: ResponsiveWebSite.isDesktop(context) ? screenSize.width / 60 : 30,
          ),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(196, 150, 221, 215),
              ),
              onPressed: () {},
              child: Text(
                'What We Provide',
                style: GoogleFonts.spectral(
                    color: Colors.black,
                    fontSize: ResponsiveWebSite.isDesktop(context) ? screenSize.width / 70 : 24,
                    fontWeight: FontWeight.w600),
              )),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: ResponsiveWebSite.isDesktop(context) ? screenSize.width / 20 : 40,
            top: ResponsiveWebSite.isDesktop(context) ? screenSize.width / 60 : 30,
          ),
          child: Text(
            "Tution Center Solutions",
            style: GoogleFonts.robotoSlab(
                fontSize: ResponsiveWebSite.isDesktop(context) ? screenSize.width / 35 : 30,
                fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: ResponsiveWebSite.isDesktop(context) ? screenSize.width / 20 : 40,
            top: ResponsiveWebSite.isDesktop(context) ? screenSize.width / 60 : 30,
          ),
          child: Text(
            "For a demo, please register your school. Our team \nwill contact you to onboard you to the Vidyaveechi app",
            style: GoogleFonts.spectral(
                fontSize: ResponsiveWebSite.isDesktop(context) ? screenSize.width / 70 : 16,
                fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: ResponsiveWebSite.isDesktop(context) ? screenSize.width / 60 : 40,
            left: ResponsiveWebSite.isDesktop(context) ? screenSize.width / 20 : 60,
          ),
          child: Row(
            children: [
              SizedBox(
                height: ResponsiveWebSite.isDesktop(context) ? screenSize.width / 30 : 40,
                width: ResponsiveWebSite.isDesktop(context) ? screenSize.width / 6 : 180,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 75, 131, 252),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return RegisrationPage();
                      },
                    ));
                  },
                  child: Text(
                    'STUDENT REGISTRATION',
                    style: GoogleFonts.poppins(
                        fontSize:
                            ResponsiveWebSite.isDesktop(context) ? screenSize.width / 100 : 10,
                        fontWeight: ResponsiveWebSite.isDesktop(context)
                            ? FontWeight.bold
                            : FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                width: ResponsiveWebSite.isDesktop(context) ? screenSize.width / 40 : 20,
              ),
              SizedBox(
                height: ResponsiveWebSite.isDesktop(context) ? screenSize.width / 30 : 40,
                width: ResponsiveWebSite.isDesktop(context) ? screenSize.width / 6 : 180,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 102, 206, 169),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const SchoolProfile();
                      },
                    ));
                  },
                  child: Text(
                    'SCHOOL REGISTRATION',
                    style: GoogleFonts.poppins(
                        fontSize:
                            ResponsiveWebSite.isDesktop(context) ? screenSize.width / 100 : 10,
                        fontWeight: ResponsiveWebSite.isDesktop(context)
                            ? FontWeight.bold
                            : FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
