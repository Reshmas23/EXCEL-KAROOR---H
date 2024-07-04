// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/widgets.dart';
import 'package:vidyaveechi_website/view/fonts/google_poppins_widget.dart';

class HeaderRowTextWidget extends StatelessWidget {
  String title;

  HeaderRowTextWidget({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Center(
          child: GooglePoppinsWidgets(
        text: title,
        fontsize: 12,
        fontWeight: FontWeight.w600,
      )),
    );
  }
}