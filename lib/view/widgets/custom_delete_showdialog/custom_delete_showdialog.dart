import 'package:flutter/material.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/widgets/blue_Container_widget/blue_Container_widget.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';

customDeleteShowDialog({
  required BuildContext context,
  void Function()? onTap,
}) {
  return showDialog(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      title: const Text(
        "Delete",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      content: Text(
        "Are you sure do you want to delete?",
        style:
            TextStyle(fontSize: ResponsiveWebSite.isMobile(context) ? 12 : 15),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: BlueContainerWidget(
                    title: "No",
                    fontSize: 12,
                    color: adminePrimayColor,
                    width: ResponsiveWebSite.isMobile(context) ? 80 : 100)),
            GestureDetector(
                onTap: onTap,
                
                child: BlueContainerWidget(
                    title: "Yes",
                    fontSize: 12,
                    color: adminePrimayColor,
                    width: ResponsiveWebSite.isMobile(context) ? 80 : 100)),
          ],
        ),
      ],
    ),
  );
}
