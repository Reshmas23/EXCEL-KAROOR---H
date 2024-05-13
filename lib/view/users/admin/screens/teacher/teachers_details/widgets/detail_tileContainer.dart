import 'package:flutter/material.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';

class TeacherDetailTileContainer extends StatelessWidget {
  final int flex;
  final String title;
  final String subtitle;

  const TeacherDetailTileContainer({
    super.key,
    required this.flex,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: SizedBox(
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFontWidget(
              text: title,
              fontsize: 10,
              fontWeight: FontWeight.w500,
            ),
            TextFontWidget(
              text: subtitle,
              fontsize: 12,
              fontWeight: FontWeight.w700,
            )
          ],
        ),
      ),
    );
  }
}
