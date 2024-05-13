import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/achievements_controller/achievements.dart';
import 'package:vidyaveechi_website/model/achievement_model/achievement_model.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/achievements/edit_delete/edit_function.dart';
import 'package:vidyaveechi_website/view/widgets/data_list_widgets/data_container.dart';

class AchievementDataList extends StatelessWidget {
  final AchievementModel data;
  final int index;
  AchievementDataList({
    required this.data,
    required this.index,
    super.key,
  });

  final AchievementsController noticeController =
      Get.put(AchievementsController());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: index % 2 == 0
            ? const Color.fromARGB(255, 246, 246, 246)
            : Colors.blue[50],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: DataContainerWidget(
                rowMainAccess: MainAxisAlignment.center,
                color: cWhite,
                // width: 150,
                index: index,
                headerTitle: '${index + 1}'), //....................No
          ),
          const SizedBox(
            width: 01,
          ),
          Expanded(
              flex: 3,
              child: TextFontWidget(
                text: '  ${data.studentName}',
                fontsize: 12,
                overflow: TextOverflow.ellipsis,
              )), //................................................. studentName
          const SizedBox(
            width: 02,
          ),
          Expanded(
            flex: 2,
            child: TextFontWidget(
              text: '  ${data.admissionNumber}',
              fontsize: 12,
              overflow: TextOverflow.ellipsis,
            ),
          ), //........................................... subject
          const SizedBox(
            width: 02,
          ),
          Expanded(
            flex: 2,
            child: TextFontWidget(
              text: '  ${data.dateofAchievement}',
              fontsize: 12,
              overflow: TextOverflow.ellipsis,
            ),
          ), //........................................... dateofoccation
          const SizedBox(
            width: 02,
          ),
          Expanded(
            flex: 2,
            child: TextFontWidget(
              text: '  ${data.achievementHead}',
              fontsize: 12,
              overflow: TextOverflow.ellipsis,
            ),
          ), //........................................... venue
          const SizedBox(
            width: 02,
          ),

          Expanded(
            flex: 1,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  editFunctionOfAchievements(context, data);
                  // editFunctionOfNotice(context, data);
                },
                child:DataContainerWidget(
                    rowMainAccess: MainAxisAlignment.center,
                    color: cWhite,
                    // width: 150,
                    index: index,
                    headerTitle: 'Update🖋️'),
              ),
            ),
          ), //........................................... edit
          const SizedBox(
            width: 02,
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  deleteFunctionOfAchievement(context, data);
                },
                child: DataContainerWidget(
                    rowMainAccess: MainAxisAlignment.center,
                    color: cWhite,
                    // width: 150,
                    index: index,
                    headerTitle: ' Remove 🗑️'),
              ),
            ),
          ), //........................................... delete
        ],
      ),
    );
  }
}
