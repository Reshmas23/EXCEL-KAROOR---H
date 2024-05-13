import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vidyaveechi_website/constants/colors/app_colors.dart';
import 'package:vidyaveechi_website/constants/sizedboxes/app_sizedboxes.dart';
import 'package:vidyaveechi_website/constants/textstyles/app_text_styles.dart';

class AllTeachersList extends StatelessWidget {
  const AllTeachersList({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SizedBox(
          height: 860,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Head----------
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.loghtGreyColor,
                  ),
                  color: AppColors.headColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      // flex: 1,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          'ID',
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.boldText(
                            color: AppColors.blackColor,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      // flex: 2,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Image / Name',
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.boldText(
                            color: AppColors.blackColor,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      // flex: 2,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Email',
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.boldText(
                            color: AppColors.blackColor,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      // flex: 2,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Phone',
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.boldText(
                            color: AppColors.blackColor,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      // flex: 1,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Class',
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.boldText(
                            color: AppColors.blackColor,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      // flex: 1,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Status',
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.boldText(
                            color: AppColors.blackColor,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      // flex: 2,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Subject',
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.boldText(
                            color: AppColors.blackColor,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Enable / Disable',
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.boldText(
                            color: AppColors.blackColor,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.loghtGreyColor,
                    ),
                  ),
                  child: ListView.separated(
                    itemCount: 10,
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                alignment: Alignment.center,
                                child: Text(
                                  '${index + 1}',
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontSize: 16.0),
                                ),
                              ),
                            ),
                            Expanded(
                              // flex: 2,
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8.0),
                                    alignment: Alignment.center,
                                    child: SvgPicture.asset(
                                      'webassets/svg/teacher-svgrepo-com.svg',
                                      height: 38,
                                      width: 38,
                                    ),
                                  ),
                                  AppSizedBoxes.sizedboxW5,
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Ajay',
                                        overflow: TextOverflow.ellipsis,
                                        style: AppTextStyles.boldText(
                                          color: AppColors.blackColor,
                                          fontSize: 14,
                                        ),
                                      ),
                                      AppSizedBoxes.sizedboxH5,
                                      Text(
                                        '09-3-2024',
                                        overflow: TextOverflow.ellipsis,
                                        style: AppTextStyles.boldText(
                                          color: AppColors.greyColor,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              // flex: 2,
                              child: Row(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    child: SvgPicture.asset(
                                      'webassets/svg/mail-svgrepo-com.svg',
                                      height: 26,
                                      width: 26,
                                    ),
                                  ),
                                  AppSizedBoxes.sizedboxW10,
                                  Container(
                                    padding: const EdgeInsets.all(8.0),
                                    alignment: Alignment.center,
                                    child: const Text(
                                      'teacher@gmsil.com',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: AppColors.blackColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              // flex: 2,
                              child: Row(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    child: SvgPicture.asset(
                                      'webassets/svg/phone-android-svgrepo-com.svg',
                                      height: 28,
                                      width: 28,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(8.0),
                                    alignment: Alignment.center,
                                    child: const Text(
                                      '9562667869',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: AppColors.blackColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              // flex: 1,
                              child: Row(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    child: SvgPicture.asset(
                                      'webassets/svg/class-svgrepo-com.svg',
                                      height: 28,
                                      width: 28,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(8.0),
                                    alignment: Alignment.centerRight,
                                    child: const Text(
                                      'A-1',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: AppColors.blackColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              // flex: 1,
                              child: Row(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    child: SvgPicture.asset(
                                      'webassets/svg/wrong-delete-remove-trash-minus-cancel-close-svgrepo-com.svg',
                                      height: 28,
                                      width: 28,
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    child: SvgPicture.asset(
                                      'webassets/svg/check-svgrepo-com.svg',
                                      height: 28,
                                      width: 28,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              // flex: 2,
                              child: Row(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    child: SvgPicture.asset(
                                      'webassets/svg/student-beans-svgrepo-com.svg',
                                      height: 28,
                                      width: 28,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(8.0),
                                    alignment: Alignment.center,
                                    child: const Text(
                                      'physics',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: AppColors.blackColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                child: Switch(
                                  activeColor: AppColors.whiteColor,
                                  activeTrackColor: Colors.green,
                                  inactiveThumbColor: AppColors.whiteColor,
                                  inactiveTrackColor: AppColors.redColor,
                                  splashRadius: 50.0,
                                  value: true,
                                  onChanged: (bool value) {},
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
