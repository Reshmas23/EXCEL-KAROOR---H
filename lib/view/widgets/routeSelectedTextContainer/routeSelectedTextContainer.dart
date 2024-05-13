import 'package:flutter/material.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';

class RouteSelectedTextContainer extends StatelessWidget {
  final double? width;
  final String title;
  final Color? color;
  final int? fontSize;

  const RouteSelectedTextContainer({
    Key? key,
    required this.title,
    this.width,
    this.color,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color ?? themeColorBlue,
        border: Border.all(color: cWhite.withOpacity(0.2)),
      ),
      constraints: const BoxConstraints(
        minHeight: 30, // Set minimum height
        minWidth: 120, // Set minimum width
      ),
      width: width, // Set provided width if available
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.center,
            child: TextFontWidgetRouter(
              text: title,
              fontsize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
