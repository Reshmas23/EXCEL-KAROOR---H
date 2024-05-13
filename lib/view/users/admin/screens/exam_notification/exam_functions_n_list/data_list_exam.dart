import 'package:flutter/material.dart';
import 'package:vidyaveechi_website/model/exam_notification/exam_notification.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/constant/constant.validate.dart';
import 'package:vidyaveechi_website/view/widgets/data_list_widgets/data_container.dart';

class ExamNotificationDataListWidget extends StatelessWidget {
  final ExamNotificationModel data;
  final int index;
  const ExamNotificationDataListWidget({
    required this.index,
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
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
            flex: 4,
            child: DataContainerWidget(
                rowMainAccess: MainAxisAlignment.start,
                color: cWhite,
                index: index,
                headerTitle: data.examName),
          ),
          const SizedBox(
            width: 01,
          ),
          Expanded(
            flex: 2,
            child: DataContainerWidget(
                rowMainAccess: MainAxisAlignment.center,
                color: cWhite,
                // width: 150,
                index: index,
                headerTitle: data.totalDays.toString()),
          ), // ...................................Total Number
          const SizedBox(
            width: 01,
          ),
          Expanded(
            flex: 3,
            child: DataContainerWidget(
                rowMainAccess: MainAxisAlignment.center,
                color: cWhite,
                // width: 150,
                index: index,
                headerTitle: stringTimeToDateConvert(data.startDate)),
          ), //....................................... starting
          const SizedBox(
            width: 01,
          ),
          Expanded(
            flex: 1,
            child: DataContainerWidget(
                rowMainAccess: MainAxisAlignment.center,
                color: cWhite,
                // width: 150,
                index: index,
                headerTitle: stringTimeToDateConvert(data.endDate)),
          ), /////////////...............................ending
        ],
      ),
    );
  }
}
