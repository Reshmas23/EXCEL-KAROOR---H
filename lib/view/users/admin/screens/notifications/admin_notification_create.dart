import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/notification_controller/notification_Controller.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/constant/constant.validate.dart';
import 'package:vidyaveechi_website/view/drop_down/select_class.dart';
import 'package:vidyaveechi_website/view/widgets/blue_Container_widget/blue_Container_widget.dart';
import 'package:vidyaveechi_website/view/widgets/progess_button/progress_button.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';

class AdminNotificationCreate extends StatelessWidget {
  final NotificationController notificationCntrl =
      Get.put(NotificationController());
  AdminNotificationCreate({super.key});

  @override
  Widget build(BuildContext context) {
    final adminSendNotificationWidgets = [
      Text(
        "Send Notifications",
        style: TextStyle(
            fontSize: ResponsiveWebSite.isMobile(context) ? 15 : 17,
            fontWeight: FontWeight.bold),
      ), ////////////////////////////..................0
      SizedBox(
          width: ResponsiveWebSite.isMobile(context) ? 60 : 80,
          child: Text(
            "Category",
            style: TextStyle(
                fontSize: ResponsiveWebSite.isMobile(context) ? 13 : 15,
                fontWeight: FontWeight.bold),
          )), //////////////////////////......................1
      Obx(() => Row(
            children: [
              BlueContainerWidget(
                  title: "Students",
                  fontSize: 12,
                  color: themeColorBlue,
                  width: 150),
              notificationCntrl.selectStudent.value == false
                  ? Checkbox(
                      value: notificationCntrl.selectStudent.value,
                      onChanged: (value) {
                        notificationCntrl.selectStudent.value = true;
                      },
                      checkColor: cWhite,
                      activeColor: cgreen,
                    )
                  : Checkbox(
                      value: notificationCntrl.selectStudent.value,
                      onChanged: (value) {
                        notificationCntrl.selectStudent.value = false;
                      },
                      checkColor: cWhite,
                      activeColor: cgreen,
                    ),
              BlueContainerWidget(
                  title: "Parent",
                  fontSize: 12,
                  color: themeColorBlue,
                  width: 150),
              notificationCntrl.selectParent.value == false
                  ? Checkbox(
                      value: notificationCntrl.selectParent.value,
                      onChanged: (value) {
                        notificationCntrl.selectParent.value = true;
                      },
                      checkColor: cWhite,
                      activeColor: cgreen,
                    )
                  : Checkbox(
                      value: notificationCntrl.selectParent.value,
                      onChanged: (value) {
                        notificationCntrl.selectParent.value = false;
                      },
                      checkColor: cWhite,
                      activeColor: cgreen,
                    ),
              BlueContainerWidget(
                  title: "Teachers",
                  fontSize: 12,
                  color: themeColorBlue,
                  width: 150),
              notificationCntrl.selectTeacher.value == false
                  ? Checkbox(
                      value: notificationCntrl.selectTeacher.value,
                      onChanged: (value) {
                        notificationCntrl.selectTeacher.value = true;
                      },
                      checkColor: cWhite,
                      activeColor: cgreen,
                    )
                  : Checkbox(
                      value: notificationCntrl.selectTeacher.value,
                      onChanged: (value) {
                        notificationCntrl.selectTeacher.value = false;
                      },
                      checkColor: cWhite,
                      activeColor: cgreen,
                    )
            ],
          )), ///////////////////////////////////////..........................2

      SizedBox(
        width: ResponsiveWebSite.isMobile(context) ? 60 : 80,
        child: Text(
          "Heading",
          style: TextStyle(
              fontSize: ResponsiveWebSite.isMobile(context) ? 13 : 15,
              fontWeight: FontWeight.bold),
        ),
      ), ////////////////////..................3
      SizedBox(
        width: ResponsiveWebSite.isMobile(context) ? 80 : 150,
        child: TextFormField(
          validator: checkFieldEmpty,
          controller: notificationCntrl.headingController,
          maxLines: 1,
          style: const TextStyle(fontSize: 14),
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: ' Enter Messages',
            contentPadding: EdgeInsets.only(top: 5, bottom: 5),
          ),
        ),
      ), //////////////////////................4
      SizedBox(
        width: ResponsiveWebSite.isMobile(context) ? 60 : 80,
        child: Text(
          "Content",
          style: TextStyle(
              fontSize: ResponsiveWebSite.isMobile(context) ? 13 : 15,
              fontWeight: FontWeight.bold),
        ),
      ), ////////////////////..................5
      SizedBox(
        width: ResponsiveWebSite.isMobile(context) ? 80 : 150,
        child: TextFormField(
          validator: checkFieldEmpty,
          controller: notificationCntrl.messageController,
          maxLines: 10,
          style: const TextStyle(fontSize: 14),
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: ' Enter Messages',
            contentPadding: EdgeInsets.only(top: 5, bottom: 5),
          ),
        ),
      ), ////////////////////..................6
      SizedBox(
        // color: Colors.amber,
        height: 40,
        width: 180,
        child: Obx(() => ProgressButtonWidget(
            function: () async {
              if (notificationCntrl.formKey.currentState!.validate()) {
                notificationCntrl
                    .sendMessageSelectedUSers()
                    .then((value) async {
                  await notificationCntrl.sendNotificationSelectedUsers(
                      icon: Icons.warning_rounded,
                      whiteshadeColor: InfoNotification().whiteshadeColor,
                      containerColor: InfoNotification().containerColor);
                });
              }
              // notificationCntrl.sendMessageSelectedUSers().then((value) async {
              //   await notificationCntrl.sendNotificationSelectedUsers(
              //       icon: Icons.warning_rounded,
              //       whiteshadeColor: InfoNotification().whiteshadeColor,
              //       containerColor: InfoNotification().containerColor);
              // });
            },
            buttonstate: notificationCntrl.buttonstate.value,
            text: 'Send Message')),
      ), //////////////////////////////////............................7
      Obx(() => SizedBox(
            height: 40,
            width: 250,
            child: notificationCntrl.selectClass.value == false
                ? Row(
                    children: [
                      BlueContainerWidget(
                          title: 'Send Class-wise Message',
                          fontSize: 11,
                          color: themeColorBlue,
                          width: 200),
                      SizedBox(
                        width: 50,
                        child: Checkbox(
                          value: notificationCntrl.selectClass.value,
                          onChanged: (value) {
                            notificationCntrl.selectClass.value = true;
                          },
                          checkColor: cWhite,
                          activeColor: cgreen,
                        ),
                      )
                    ],
                  )
                : Row(
                    children: [
                      SizedBox(width: 200, child: SelectClassDropDown()),
                      SizedBox(
                        width: 50,
                        child: Checkbox(
                          value: notificationCntrl.selectClass.value,
                          onChanged: (value) {
                            notificationCntrl.selectClass.value = false;
                          },
                          checkColor: cWhite,
                          activeColor: cgreen,
                        ),
                      )
                    ],
                  ),
          )), ///////////////////////////////////////..........................8
      Obx(() => Column(
            children: [
              Row(
                children: [
                  BlueContainerWidget(
                      title: "Students",
                      fontSize: 12,
                      color: themeColorBlue,
                      width: 150),
                  notificationCntrl.selectStudent.value == false
                      ? Checkbox(
                          value: notificationCntrl.selectStudent.value,
                          onChanged: (value) {
                            notificationCntrl.selectStudent.value = true;
                          },
                          checkColor: cWhite,
                          activeColor: cgreen,
                        )
                      : Checkbox(
                          value: notificationCntrl.selectStudent.value,
                          onChanged: (value) {
                            notificationCntrl.selectStudent.value = false;
                          },
                          checkColor: cWhite,
                          activeColor: cgreen,
                        ),
                ],
              ),
              const SizedBox(height: 2),
              Row(
                children: [
                  BlueContainerWidget(
                      title: "Parent",
                      fontSize: 12,
                      color: themeColorBlue,
                      width: 150),
                  notificationCntrl.selectParent.value == false
                      ? Checkbox(
                          value: notificationCntrl.selectParent.value,
                          onChanged: (value) {
                            notificationCntrl.selectParent.value = true;
                          },
                          checkColor: cWhite,
                          activeColor: cgreen,
                        )
                      : Checkbox(
                          value: notificationCntrl.selectParent.value,
                          onChanged: (value) {
                            notificationCntrl.selectParent.value = false;
                          },
                          checkColor: cWhite,
                          activeColor: cgreen,
                        ),
                ],
              ),
              const SizedBox(height: 2),
              Row(
                children: [
                  BlueContainerWidget(
                      title: "Teachers",
                      fontSize: 12,
                      color: themeColorBlue,
                      width: 150),
                  notificationCntrl.selectTeacher.value == false
                      ? Checkbox(
                          value: notificationCntrl.selectTeacher.value,
                          onChanged: (value) {
                            notificationCntrl.selectTeacher.value = true;
                          },
                          checkColor: cWhite,
                          activeColor: cgreen,
                        )
                      : Checkbox(
                          value: notificationCntrl.selectTeacher.value,
                          onChanged: (value) {
                            notificationCntrl.selectTeacher.value = false;
                          },
                          checkColor: cWhite,
                          activeColor: cgreen,
                        ),
                ],
              )
            ],
          )), ///////////////////////////////////////..........................9 category mobile view
    ];

    return SafeArea(
        child: SingleChildScrollView(
      child: ResponsiveWebSite.isMobile(context)
          ? Form(
              key: notificationCntrl.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: double.infinity,
                      height: 50,
                      color: screenContainerbackgroundColor,
                      child: Padding(
                          padding: const EdgeInsets.only(top: 10, left: 20),
                          child: adminSendNotificationWidgets[
                              0] ///////////////////....................Send Notifications
                          )),
                  Padding(
                    padding: const EdgeInsets.only(top: 05, left: 10),
                    child: adminSendNotificationWidgets[8],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(
                                bottom: 20, left: 20, right: 10),
                            child: adminSendNotificationWidgets[
                                1] ////////////////............category
                            ),
                        Expanded(
                          child: Container(
                              // width: 200,
                              padding: const EdgeInsets.only(right: 10),
                              color: cWhite,
                              child: adminSendNotificationWidgets[
                                  9] ///////////////////////...............category select
                              ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: cWhite,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 20, bottom: 20, left: 20, right: 10),
                                child: adminSendNotificationWidgets[
                                    3], /////////////////.....................heading
                              ),
                              Expanded(
                                child: Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: adminSendNotificationWidgets[
                                        4] ///////////////////.....................heading type
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: cWhite,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 20, bottom: 20, left: 20, right: 10),
                                child: adminSendNotificationWidgets[
                                    5], /////////////////.....................Content
                              ),
                              Expanded(
                                child: Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: adminSendNotificationWidgets[
                                        6] ///////////////////.....................Content type
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 15, top: 25),
                      child: Center(
                        child: adminSendNotificationWidgets[7],
                      ) ///////////////////////.................submit button
                      ),
                ],
              ),
            )
          : ////////////////////////////////////////////////////............................................mobile view

          Form(
              key: notificationCntrl.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 29),
                    child: Container(
                        width: double.infinity,
                        height: 48,
                        color: screenContainerbackgroundColor,
                        child: Padding(
                            padding: const EdgeInsets.only(top: 10, left: 25),
                            child: adminSendNotificationWidgets[
                                0] ///////////////////....................Send Notifications
                            )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 05, left: 10),
                    child: adminSendNotificationWidgets[8],
                  ), ///////////////////................... choose class wise message
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 20, left: 20, right: 10),
                            child: adminSendNotificationWidgets[
                                1] ////////////////............Category
                            ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Container(
                                width: 200,
                                color: cWhite,
                                child: adminSendNotificationWidgets[
                                    2] ///////////////////////...............Category select
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: cWhite,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 20, bottom: 20, left: 20, right: 10),
                                child: adminSendNotificationWidgets[
                                    3], /////////////////.....................heading
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: adminSendNotificationWidgets[
                                        4] ///////////////////..................heading Text
                                    ),
                              ),
                              Expanded(flex: 1, child: Container()),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: cWhite,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 20, bottom: 20, left: 20, right: 10),
                                child: adminSendNotificationWidgets[
                                    5], /////////////////.....................Content
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: adminSendNotificationWidgets[
                                        6] ///////////////////..................Content Text
                                    ),
                              ),
                              Expanded(flex: 1, child: Container()),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                      padding:
                          const EdgeInsets.only(left: 20, bottom: 15, top: 30),
                      child: Container(
                        child: adminSendNotificationWidgets[7],
                      ) ///////////////////////.................submit button
                      ),
                ],
              ),
            ),
    ) /////////////////////////////////////////////////////////.......................................web view

        );
  }
}
