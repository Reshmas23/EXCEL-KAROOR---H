import 'package:flutter/material.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/google_poppins_widget.dart';
import 'package:vidyaveechi_website/view/widgets/back_button/back_button_widget.dart';

customShowDilogBox2(
    {required BuildContext context,
    required String title,
    required List<Widget> children,
    String? actiontext,
    Widget? headerchild,
    required bool doyouwantActionButton,
    void Function()? actiononTapfuction}) {
  return showDialog(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
          backgroundColor: cWhite,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              headerchild ?? const SizedBox(),
              GooglePoppinsWidgets(
                  text: title, fontsize: 13, fontWeight: FontWeight.w600),
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: BackButtonContainerWidget(),
              )
            ],
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: children,
            ),
          ),
          actions: doyouwantActionButton == true
              ? <Widget>[
                  GestureDetector(
                    onTap: actiononTapfuction,
                    child: Container(
                      height: 40,
                      width: 250,
                      decoration: const BoxDecoration(
                        color: themeColorBlue,
                      ),
                      child: Center(
                        child: GooglePoppinsWidgets(
                            text: actiontext ?? 'Ok',
                            color: cWhite,
                            fontsize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      height: 40,
                      width: 250,
                      decoration: const BoxDecoration(
                        color: themeColorBlue,
                      ),
                      child: Center(
                        child: GooglePoppinsWidgets(
                            text: actiontext ?? 'Cancel',
                            color: cWhite,
                            fontsize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  )
                ]
              : null);
    },
  );
}
