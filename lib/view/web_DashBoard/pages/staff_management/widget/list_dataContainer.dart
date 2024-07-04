
// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:vidyaveechi_website/view/fonts/google_poppins_widget.dart';

class ListDataContainerWidget extends StatelessWidget {
  String text;
  double height;
  double width;
   ListDataContainerWidget({
     required this.text,
    required this.height,
        required this.width,
   
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.pink.withOpacity(0.2),
      height: height,
      width: width,
      child: Center(
        child: GooglePoppinsWidgets(
          text: text,
          fontsize: 12,
        ),
      ),
    );
  }
}