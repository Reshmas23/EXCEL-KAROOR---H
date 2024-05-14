import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/meeting_controller/meeting_controller.dart';
import 'package:vidyaveechi_website/model/meeting_model/meeting_model.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/meeting/edit_delete/functions.dart';
import 'package:vidyaveechi_website/view/widgets/data_list_widgets/data_container.dart';

class AllMeetingsDataList extends StatelessWidget {
  final int index;
  final MeetingModel data;
  const AllMeetingsDataList({
    required this.index,
    required this.data,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final MeetingController meetingController = Get.put(MeetingController());
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
          // Expanded(
          //   flex: 2,
          //   child: DataContainerWidget(
          //       rowMainAccess: MainAxisAlignment.center,
          //       color: cWhite,
          //       index: index,
          //       headerTitle: "99578"),
          // ), //................................................. Parent ID
          // const SizedBox(
          //   width: 01,
          // ),
          Expanded(
            flex: 4,
            child: GestureDetector(
              onTap: () {
                allviewFunctionOfMeeting(context, data);
              },
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                    child: Center(
                      child: Image.asset(
                        'webassets/flact_png/icons8-parent-100.png',
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextFontWidget(
                      text: data.topic,
                      fontsize: 12,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ), //...........................................  topic
          const SizedBox(
            width: 01,
          ),
          Expanded(
            flex: 3,
            child: GestureDetector(
              onTap: () {
                allviewFunctionOfMeeting(context, data);
              },
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                    child: Center(
                      child: Image.asset(
                        'webassets/png/login.png',
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextFontWidget(
                      text: data.date,
                      fontsize: 12,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ), //////////////////////////////////date
          const SizedBox(
            width: 01,
          ),
          Expanded(
            flex: 3,
            child: GestureDetector(
              onTap: () {
                allviewFunctionOfMeeting(context, data);
              },
              child: Row(
                children: [
                  SizedBox(
                    width: 15,
                    child: Center(
                      child: Image.asset(
                        'webassets/stickers/icons8-student-100 (1).png',
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextFontWidget(
                      text: data.time,
                      fontsize: 12,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ), // ................................... time
          const SizedBox(
            width: 01,
          ),
          Expanded(
            flex: 4,
            child: GestureDetector(
              onTap: () {
                allviewFunctionOfMeeting(context, data);
              },
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                    child: Center(
                      child: Image.asset(
                        'webassets/png/login.png',
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextFontWidget(
                      text: data.venue,
                      fontsize: 12,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ), //.......................................
          const SizedBox(
            width: 01,
          ),
          Expanded(
            flex: 3,
            child: GestureDetector(
                onTap: () {
                  meetingController.edittopicController.text = data.topic;
                  meetingController.editdateController.text = data.date;
                  meetingController.edittimeController.text = data.time;
                  meetingController.editcategoryController.text = data.category;
                  meetingController.editvenueController.text = data.venue;
                  meetingController.editmemberController.text = data.members;
                  meetingController.editspecialguestController.text =
                      data.specialGuest;
                  editFunctionOfMeeting(context, data);
                },
                child: DataContainerWidget(
                    rowMainAccess: MainAxisAlignment.center,
                    color: cWhite,
                    // width: 150,
                    index: index,
                    headerTitle: ' Update 🖋️')),
          ), //............................. Student Class

          const SizedBox(
            width: 01,
          ),
          Expanded(
            flex: 3,
            child: GestureDetector(
              onTap: () {
                deleteFunctionOfMeetings(context, data);
              },
              child: DataContainerWidget(
                  rowMainAccess: MainAxisAlignment.center,
                  color: cWhite,
                  // width: 150,
                  index: index,
                  headerTitle: ' Remove 🗑️'),
            ),
          ), //............................. Status [Active or DeActivate]
        ],
      ),
    );
  }
}
