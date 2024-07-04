import 'package:vidyaveechi_website/view/fonts/google_poppins_widget.dart';

import 'video_widgets.dart';


class HeaderRowTextWidgetVideo extends StatelessWidget {
 final String title;

 const HeaderRowTextWidgetVideo({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 200,
      child: Center(
          child: GooglePoppinsWidgets(
        text: title,
        // textAlign: TextAlign.center,
        fontsize: 12,
        fontWeight: FontWeight.w600,
      )),
    );
  }
}