import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/achievements_controller/achievements.dart';
import 'package:vidyaveechi_website/model/achievement_model/achievement_model.dart';
import 'package:vidyaveechi_website/view/constant/constant.validate.dart';
import 'package:vidyaveechi_website/view/fonts/google_poppins_widget.dart';
import 'package:vidyaveechi_website/view/widgets/custom_showdialouge/custom_showdialouge.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';
import 'package:vidyaveechi_website/view/widgets/textformFiledContainer/textformFiledBlueContainer.dart';

editFunctionOfAchievements(BuildContext context, AchievementModel data) {
  final AchievementsController achievementsController =
      Get.put(AchievementsController());
  customShowDilogBox(
      context: context,
      title: 'Edit',
      children: [
        Form(
          key: achievementsController.formKey,
          child: Column(children: [
          TextFormFiledHeightnoColor(
             validator: checkFieldEmpty,
            controller: achievementsController.editstudentNameController,
              hintText: data.studentName, title: 'Student Name'),
          TextFormFiledHeightnoColor(
             validator: checkFieldEmpty,
            controller: achievementsController.editadmissionNumberController,
              hintText: data.admissionNumber, title: 'Admission Number'),
          TextFormFiledHeightnoColor(
            onTap: () {
              achievementsController.selectDate(context, achievementsController.editdateController);
            },
             validator: checkFieldEmpty,
            controller: achievementsController.editdateController,
              hintText: data.dateofAchievement, title: 'Date'),
          TextFormFiledHeightnoColor(
             validator: checkFieldEmpty,
            controller: achievementsController.editachievementController,
              hintText: data.achievementHead, title: 'Achievement'),
              ],),
        )
      ],
      
      doyouwantActionButton: true,
      actiononTapfuction: () {
      if(achievementsController  .formKey.currentState! .validate()) {
        achievementsController.updateAchievement(
          data.studentName,data.achievementHead,data.dateofAchievement,data.admissionNumber,
          data.uid,context);
      }
      },
      actiontext: 'Update');
}

deleteFunctionOfAchievement(BuildContext context, AchievementModel data) {
    final AchievementsController achievementsController =
      Get.put(AchievementsController());
  customShowDilogBox(
      context: context,
      title: 'Delete',
      children: [
        GooglePoppinsWidgets(
            text: 'Are you sure to want delete',
            fontsize: ResponsiveWebSite.isMobile(context) ? 12 : 15)
      ],
      actiononTapfuction: () {
        print(data.uid);
       achievementsController.deleteAchievements(data.uid,context);
       Navigator.pop(context);
      },
      doyouwantActionButton: true);
}
