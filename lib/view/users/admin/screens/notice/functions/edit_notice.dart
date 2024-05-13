import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/notice_controller/notice_controller.dart';
import 'package:vidyaveechi_website/model/notice_model/notice_model.dart';
import 'package:vidyaveechi_website/view/constantvalidate.dart';
import 'package:vidyaveechi_website/view/widgets/custom_showdialouge/custom_showdialouge.dart';
import 'package:vidyaveechi_website/view/widgets/textformFiledContainer/textformFiledBlueContainer.dart';

editFunctionOfNotice(BuildContext context, NoticeModel data) {
  final NoticeController noticeController = Get.put(NoticeController());
  customShowDilogBox(
      context: context,
      title: 'Edit',
      children: [
        Form(
          key: noticeController.formKey,
          child: Column(children: [
          TextFormFiledHeightnoColor(
            validator: checkFieldEmpty,
            controller: noticeController.noticeHeadingController,
              hintText: data.heading, title: 'Heading'),
          TextFormFiledHeightnoColor(
            onTap: () {
              noticeController.selectDate(context, noticeController.editnoticePublishedDateController,);
            }, validator: checkFieldEmpty,
            controller: noticeController.editnoticePublishedDateController,
              hintText: data.publishedDate, title: 'Published Date'),
          TextFormFiledHeightnoColor(
             validator: checkFieldEmpty,
             controller: noticeController.noticeSubjectController,
              hintText: data.subject, title: 'Subject'),
          TextFormFiledHeightnoColor(
             validator: checkFieldEmpty,
             onTap: () {
              noticeController.selectDate(context, noticeController.editnoticeDateofoccationController,);
            },
            controller: noticeController.editnoticeDateofoccationController,
              hintText: data.dateofoccation, title: 'Date Of Occation'),
          TextFormFiledHeightnoColor(
             validator: checkFieldEmpty,
             controller: noticeController.noticevenueController,
              hintText: data.venue, title: 'Venue'),
          TextFormFiledHeightnoColor(
             validator: checkFieldEmpty,
             onTap: () {
              noticeController.selectDate(context, noticeController.editnoticeDateofSubmissionController,);
            },
            controller: noticeController.editnoticeDateofSubmissionController,
              hintText: data.dateOfSubmission, title: 'Date Of Submission'),
          TextFormFiledHeightnoColor(
             validator: checkFieldEmpty,
             controller: noticeController.noticeGuestController,
              hintText: data.chiefGuest, title: 'Cheif guest'),
          TextFormFiledHeightnoColor(
             validator: checkFieldEmpty,
             controller: noticeController.noticeSignedByController,
              hintText: data.signedBy, title: 'Signed by'),
              ],),
        ),
      ],
      doyouwantActionButton: true,
      actiononTapfuction: () {
        if(noticeController.formKey.currentState!
                                    .validate()){
        noticeController.updateNotice(
          data.noticeId,
          context,
        );
                                    }
      },
      actiontext: 'Update');
}
