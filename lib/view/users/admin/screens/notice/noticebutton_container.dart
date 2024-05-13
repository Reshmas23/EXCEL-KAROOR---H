
import 'package:flutter/widgets.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/google_poppins_widget.dart';


// ignore: must_be_immutable
class NoticeButtonContainerWidget extends StatelessWidget {
  void Function() onTap;
  final String text;
  final double width;
    final double height;
    final double fontSize;
    final Color?  color;




   NoticeButtonContainerWidget( {super.key,required this.text ,required this.width,required this.height,required this. fontSize,required this.onTap,required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration:  BoxDecoration(
        color: color,
          borderRadius:  BorderRadius.circular(5),
        ),
        width: width,
        height: height,
        child: Center(
          child: GooglePoppinsWidgets(
            
            color: cWhite,
            fontWeight: FontWeight.w500,
            text: text,
            fontsize: fontSize,
          ),
        ),
      ),
    );
  }
}
