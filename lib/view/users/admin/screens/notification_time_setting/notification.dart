import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/attendance_notification/attendance_notification.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/constant/constant.validate.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';

void showPopupMenu(BuildContext context) async {
await showMenu(
  context: context,
  position: const RelativeRect.fromLTRB(150, 50, 115, 10),
  items: [
     PopupMenuItem(
      child: TextFontWidget(text: "Settings",
       fontsize: 14,fontWeight: FontWeight.w500,),
      onTap: () {
        notificationFunction(context);
      },
    ),
  ],
  elevation: 1.0,
);
}

notificationFunction( BuildContext context){
  final AttendanceNotification attendanceNotification = Get.put(AttendanceNotification());
  showDialog(context: context, builder: (context) {
    return AlertDialog(
      backgroundColor: cWhite,
      title:  Row(
        mainAxisAlignment: MainAxisAlignment.start  ,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back)),
         // BackButton(),
           TextFontWidget(text: "  Attendance Notification", 
          fontsize: 17,fontWeight: FontWeight.bold,)
        ],
      ),
      content: Form(
        key: attendanceNotification.formKey,
        child: SizedBox(
          height: 160,
          width: 250,
          child: Column(
            children: [ 
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                    height: 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          TextFontWidget(
                          text: "Attendance Notification Time *", fontsize: 12.5),
                      const SizedBox(
                        height: 05,
                      ),
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1),
                            borderRadius: const BorderRadius.all(Radius.circular(5))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: attendanceNotification.timeController,
                              validator: checkFieldEmpty,
                              //textAlign: TextAlign.center, 
                            decoration: const InputDecoration(
                              hintText: "Enter Mintues",
                              hintStyle: TextStyle(fontSize: 13,),
                              border: InputBorder.none),),
                          )),
                      ],
                    ),
                  ),
              ), 
            //  TextFormFiledBlueContainerWidget(hintText: "Enter Mintues", title: "Attendance Notification Time"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                onTap: () {
                  if (attendanceNotification. formKey.currentState!.validate()) {}
                  attendanceNotification.addTimeToFirebase();
                  Navigator.pop(context);
                },
                child: Container(
                  height: 40,
                  width: 150,
                  decoration: BoxDecoration(
                      color: themeColorBlue,
                      border: Border.all(color: themeColorBlue),
                      borderRadius: BorderRadius.circular(05)),
                  child: const Center(
                    child: TextFontWidgetRouter(
                      text: "Set",
                      fontsize: 14,
                      // fontWeight: FontWeight.w600,
                      color: cWhite,
                    ),
                  ),
                ),
                          ),
              ),
            ],
          ),
        ),
      ),
    );
  },);
}