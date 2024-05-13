import 'package:flutter/material.dart';
import 'package:vidyaveechi_website/constants/colors/app_colors.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    required this.obscureText,
    this.controller,
    this.decoration,
    this.hintText,
    // this.iconData,
    this.validator,
    this.suffixicon,
    this.autoFocus,
  });

  final bool obscureText;
  final TextEditingController? controller;
  final String? hintText;
  // final IconData? iconData;
  final InputDecoration? decoration;
  final String? Function(String?)? validator;
  final Widget? suffixicon;
  final bool? autoFocus;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        // margin: const EdgeInsets.all(15),
        child: TextFormField(
          obscureText: obscureText,
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            suffixIcon: suffixicon,
            fillColor: AppColors.whiteColor,
            filled: true,
            // prefixIcon: Icon(iconData),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.blackColor),
            ),
            hintText: hintText,
          ),
          // hintText: hintText,
          // iconData: iconData,
        ),
      ),
    );
  }
}
