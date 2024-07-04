// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:vidyaveechi_website/info/info.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/google_poppins_widget.dart';

class CostechDujoLogoWidget extends StatelessWidget {
  const CostechDujoLogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 16, 36, 77),
      height: 130,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const SizedBox(
                  height: 80,
                  width: 60,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        const BackButton(color: cWhite,),
                        const SizedBox(width: 20,),
                        GooglePoppinsWidgets(
                          text: separate,
                          fontsize: 15,
                          color: cWhite,
                          fontWeight: FontWeight.w600,
                        ),
                        GooglePoppinsWidgets(
                          text: separatetwo,
                          fontsize: 15,
                          color: cred,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                    // GooglePoppinsWidgets(
                    //   text: "Advocates",
                    //   fontsize: 10,
                    //   color: cWhite.withOpacity(0.5),
                    // ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(
            height: 1,
            color: Color.fromARGB(255, 26, 47, 90),
          ),
          SizedBox(
            height: 48,
            child: Center(
              child: GooglePoppinsWidgets(
                text: "Admin Panel",
                fontsize: 11,
                color: const Color.fromARGB(255, 117, 200, 236),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
