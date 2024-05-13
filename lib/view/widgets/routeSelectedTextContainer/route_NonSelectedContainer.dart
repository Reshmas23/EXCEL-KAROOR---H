import 'package:flutter/widgets.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';

class RouteNonSelectedTextContainer extends StatelessWidget {
  final String title;
  final int? width;
  const RouteNonSelectedTextContainer({
    super.key,
    required this.title,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: cWhite, border: Border.all(color: themeColorBlue.withOpacity(0.2))),
      height: 30,
      width: 120,
      child: Center(
        child: TextFontWidget(
          text: title,
          fontsize: 14,
          fontWeight: FontWeight.w500,
          color: cBlack,
        ),
      ),
    );
  }
}
