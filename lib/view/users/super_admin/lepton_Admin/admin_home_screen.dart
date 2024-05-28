import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vidyaveechi_website/view/users/super_admin/id_cards/card_registration.dart';

import '../widgets/buttonContainer.dart';

class LeptonHomePage extends StatelessWidget {
  const LeptonHomePage({super.key});
  static const String route = '/homePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                 Get.to(() =>  CardRegistration());
               // Get.to(() => const SchoolsListScreen());
              },
              child: ButtonContainerWidget(
                curving: 30,
                
                colorindex: 0,
                height: 200,
                width: 400,
                child: Center(
                    child: Text(
                  'ID Cards',
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                )),
              ),
            ),
            // GestureDetector(
            //   onTap: () {
            //     Get.to(() => RequestedSchoolsListScreen());
            //     // Navigator.pushNamed(context, RequestedSchoolsListScreen.route);
            //   },
            //   child: ButtonContainerWidget(
            //     curving: 30,
            //     colorindex: 6,
            //     height: 200,
            //     width: 400,
            //     child: Center(
            //         child: Text(
            //       'Requested List',
            //       style: GoogleFonts.montserrat(
            //           color: Colors.white,
            //           fontSize: 18,
            //           fontWeight: FontWeight.bold),
            //     )),
            //   ),
            // ),
          ],
        ),
      )),
    );
  }
}
