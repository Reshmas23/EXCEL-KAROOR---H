import 'package:flutter/material.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';

class StudentCategoryTileContainer extends StatelessWidget {
  final String title;
  final String subTitle;
  final Color color;
  const StudentCategoryTileContainer({
    super.key,
    required this.title,
    required this.subTitle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        // color: Colors.amber,
        height: 150,
        // width: 300,
        child: Card(
          shape: const RoundedRectangleBorder(),
          color: cWhite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFontWidget(
                  text: title,
                  fontsize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Center(
                  child: TextFontWidget(
                    text: subTitle,
                    fontsize: ResponsiveWebSite.isMobile(context)? 20 : 30,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
