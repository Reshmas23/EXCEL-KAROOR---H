import 'package:flutter/material.dart';
import 'package:vidyaveechi_website/constants/colors/app_colors.dart';
import 'package:vidyaveechi_website/constants/sizedboxes/app_sizedboxes.dart';
import 'package:vidyaveechi_website/constants/textstyles/app_text_styles.dart';
import 'package:vidyaveechi_website/view/widgets/textfromfield.dart';

class CreateTeacherProfile extends StatelessWidget {
  const CreateTeacherProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 500,
        width: 700,
        color: const Color.fromARGB(255, 228, 228, 228),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Teacher Name",
                style: AppTextStyles.text(
                  color: AppColors.blackColor,
                  fontSize: 16,
                ),
              ),
              AppSizedBoxes.sizedboxH10,
              const TextFormFieldWidget(
                hintText: "Enter Email or Mob No",
                obscureText: false,
                autoFocus: false,
                // controller: ,
                // validator: ,
              ),
              AppSizedBoxes.sizedboxH20,
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Phone Number",
                          style: AppTextStyles.text(
                            color: AppColors.blackColor,
                            fontSize: 16,
                          ),
                        ),
                        AppSizedBoxes.sizedboxH10,
                        const TextFormFieldWidget(
                          hintText: "Phone Number",
                          obscureText: false,
                          autoFocus: false,
                          // controller: ,
                          // validator: ,
                        ),
                      ],
                    ),
                  ),
                  AppSizedBoxes.sizedboxW10,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Employee Id",
                          style: AppTextStyles.text(
                            color: AppColors.blackColor,
                            fontSize: 16,
                          ),
                        ),
                        AppSizedBoxes.sizedboxH10,
                        const TextFormFieldWidget(
                          hintText: "Employee Id",
                          obscureText: false,
                          autoFocus: false,
                          // controller: ,
                          // validator: ,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              AppSizedBoxes.sizedboxH20,
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Subject",
                          style: AppTextStyles.text(
                            color: AppColors.blackColor,
                            fontSize: 16,
                          ),
                        ),
                        AppSizedBoxes.sizedboxH10,
                        const TextFormFieldWidget(
                          hintText: "Subject",
                          obscureText: false,
                          autoFocus: false,
                          // controller: ,
                          // validator: ,
                        ),
                      ],
                    ),
                  ),
                  AppSizedBoxes.sizedboxW10,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Age",
                          style: AppTextStyles.text(
                            color: AppColors.blackColor,
                            fontSize: 16,
                          ),
                        ),
                        AppSizedBoxes.sizedboxH10,
                        const TextFormFieldWidget(
                          hintText: "Age",
                          obscureText: false,
                          autoFocus: false,
                          // controller: ,
                          // validator: ,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              AppSizedBoxes.sizedboxH60,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: CustomButton(
                      text: "Add Teacher",
                      onPressed: () {},
                      height: 40,
                      backgroundColor: AppColors.blackColor,
                      textColor: AppColors.loghtGreyColor,
                    ),
                  ),
                  AppSizedBoxes.sizedboxW10,
                  Expanded(
                    child: CustomButton(
                      text: "Upload Data from Excel",
                      height: 40,
                      onPressed: () {},
                      backgroundColor: AppColors.blackColor,
                      textColor: AppColors.loghtGreyColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final double? height;
  final double? width;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    this.height,
    this.width,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: textColor,
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
