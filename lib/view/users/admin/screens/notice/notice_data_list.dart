import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/notice_controller/notice_controller.dart';
import 'package:vidyaveechi_website/model/notice_model/notice_model.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/notice/functions/edit_notice.dart';
import 'package:vidyaveechi_website/view/widgets/custom_delete_showdialog/custom_delete_showdialog.dart';
import 'package:vidyaveechi_website/view/widgets/data_list_widgets/data_container.dart';

class AllNoticeDataList extends StatelessWidget {
  final NoticeModel data;
  final int index;
  AllNoticeDataList({
    required this.data,
    required this.index,
    super.key,
  });

  final NoticeController noticeController = Get.put(NoticeController());
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
              flex: 3,
              child: TextFontWidget(
                text: '  ${data.heading}',
                fontsize: 12,
                overflow: TextOverflow.ellipsis,
              )), //................................................. heading
          const SizedBox(
            width: 02,
          ),
          Expanded(
            flex: 3,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: TextFontWidget(
                text: '  ${data.subject}',
                fontsize: 12,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ), //........................................... subject
          const SizedBox(
            width: 02,
          ),
          Expanded(
            flex: 2,
            child: TextFontWidget(
              text: '  ${data.dateofoccation}',
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
              text: '  ${data.venue}',
              fontsize: 12,
              overflow: TextOverflow.ellipsis,
            ),
          ), //........................................... venue
          const SizedBox(
            width: 02,
          ),
          Expanded(
            flex: 2,
            child: TextFontWidget(
              text: '  ${data.chiefGuest}',
              fontsize: 12,
              overflow: TextOverflow.ellipsis,
            ),
          ), //........................................... chiefGuest
          const SizedBox(
            width: 02,
          ),
          Expanded(
            flex: 2,
            child: TextFontWidget(
              text: '  ${data.signedBy}',
              fontsize: 12,
              overflow: TextOverflow.ellipsis,
            ),
          ), //........................................... signedBy
          const SizedBox(
            width: 02,
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  noticeController.noticeHeadingController.text = data.heading;
                  noticeController.editnoticePublishedDateController.text =
                      data.publishedDate;
                  noticeController.noticeSubjectController.text = data.subject;
                  noticeController.editnoticeDateofoccationController.text =
                      data.dateofoccation;
                  noticeController.noticevenueController.text = data.venue;
                  noticeController.editnoticeDateofSubmissionController.text =
                      data.dateOfSubmission;
                  noticeController.noticeGuestController.text = data.chiefGuest;
                  noticeController.noticeSignedByController.text =
                      data.signedBy;
                  editFunctionOfNotice(context, data);
                },
                child: DataContainerWidget(
                    rowMainAccess: MainAxisAlignment.center,
                    color: cWhite,
                    // width: 150,
                    index: index,
                    headerTitle: ' Update 🖋️'),
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
                  customDeleteShowDialog(
                    context: context,
                    onTap: () {
                      noticeController.deleteNotice(
                        data.noticeId,
                        context,
                      );
                      Navigator.pop(context);
                    },
                  );
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
