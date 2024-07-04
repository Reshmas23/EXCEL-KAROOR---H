import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:vidyaveechi_website/controller/exam_notification/exam_notification.dart';
import 'package:vidyaveechi_website/model/exam_notification/exam_notification.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/constant/constant.validate.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/widgets/textformFiledContainer/textformFiledBlueContainer.dart';

editFunctionOfExam(BuildContext context, ExamNotificationModel data) {
  ExamNotificationController getExamNotificationCtr = ExamNotificationController();
  final GlobalKey<FormState> fkey = GlobalKey<FormState>();
  getExamNotificationCtr.examNameCtr.text = data.examName;
  getExamNotificationCtr.startDateCtr.text = dateConvert(DateTime.parse(data.startDate));
  getExamNotificationCtr.endDateCtr.text = dateConvert(DateTime.parse(data.endDate));
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: cWhite,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BackButton(),
            TextFontWidget(
              text: "  Edit Exam",
              fontsize: 15,
              fontWeight: FontWeight.bold,
            )
          ],
        ),
        content: SizedBox(
          height: 350,
          child: Form(
            key: fkey,
            child: Column(
              children: [
                SizedBox(
                  height: 80,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFontWidget(text: ' Exam Name *', fontsize: 12.5),
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
                              controller: getExamNotificationCtr.examNameCtr,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Enter Exam Name',
                                  hintStyle: TextStyle(
                                    fontSize: 13,
                                  )),
                            ),
                          )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 05,
                ),
                GestureDetector(
                  onTap: () {
                    getExamNotificationCtr.setStartDate(context);
                  },
                  child: AbsorbPointer(
                    absorbing: true,
                    child: TextFormFiledBlueContainerWidgetWithOutColor(
                      hintText: "  Start Date",
                      title: 'Starting Date🗓️ ',
                      validator: checkFieldEmpty,
                      readOnly: true,
                      controller: getExamNotificationCtr.startDateCtr,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 05,
                ),
                GestureDetector(
                  onTap: () {
                    getExamNotificationCtr.setEndDate(context);
                  },
                  child: AbsorbPointer(
                    absorbing: true,
                    child: TextFormFiledBlueContainerWidgetWithOutColor(
                      hintText: "  End Date",
                      title: 'End Date🗓️ ',
                      validator: checkFieldEmpty,
                      readOnly: true,
                      controller: getExamNotificationCtr.endDateCtr,
                    ),
                  ),
                  // => showDatePicker(
                  //   context: context,
                  //   initialDate: DateTime.now(),
                  //   firstDate: DateTime(2018),
                  //   lastDate: DateTime(2030),
                  //   helpText: 'Select a date',
                  //   cancelText: 'Cancel',
                  //   confirmText: 'OK',
                  //   builder: (BuildContext context, Widget? child) {
                  //     return Theme(
                  //       data: ThemeData.light().copyWith(
                  //         primaryColor: const Color(
                  //             0xFF2296F3), // Header background color
                  //         // accentColor: Colors.white, // Selection color
                  //         colorScheme: const ColorScheme.light(
                  //             primary: Color(0xFF2296F3)),
                  //         buttonTheme: const ButtonThemeData(
                  //           textTheme: ButtonTextTheme.primary,
                  //         ),
                  //       ),
                  //       child: child!,
                  //     );
                  //   },
                  // ),
                  // child: Container(
                  //   height: 40,
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(05),
                  //       color: screenContainerbackgroundColor,
                  //       border: Border.all(color: cBlack.withOpacity(0.4))),
                  //   width: double.infinity,
                  //   child: Padding(
                  //     padding: EdgeInsets.all(8.0),
                  //     child:
                  //   ),
                  // ),
                ),
                // SizedBox(
                //   height: 80,
                //   // color: cWhite,
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       const TextFontWidget(
                //           text: 'Ending Date🗓️ *', fontsize: 12.5),
                //       const SizedBox(
                //         height: 05,
                //       ),
                //       GestureDetector(
                //         onTap: () => showDatePicker(
                //           context: context,
                //           initialDate: DateTime.now(),
                //           firstDate: DateTime(2018),
                //           lastDate: DateTime(2030),
                //           helpText: 'Select a date',
                //           cancelText: 'Cancel',
                //           confirmText: 'OK',
                //           builder: (BuildContext context, Widget? child) {
                //             return Theme(
                //               data: ThemeData.light().copyWith(
                //                 primaryColor: const Color(
                //                     0xFF2296F3), // Header background color
                //                 // accentColor: Colors.white, // Selection color
                //                 colorScheme: const ColorScheme.light(
                //                     primary: Color(0xFF2296F3)),
                //                 buttonTheme: const ButtonThemeData(
                //                   textTheme: ButtonTextTheme.primary,
                //                 ),
                //               ),
                //               child: child!,
                //             );
                //           },
                //         ),
                //         child: Container(
                //           height: 40,
                //           decoration: BoxDecoration(
                //               borderRadius: BorderRadius.circular(05),
                //               color: screenContainerbackgroundColor,
                //               border: Border.all(color: cBlack.withOpacity(0.4))),
                //           width: double.infinity,
                //           child: const Padding(
                //             padding: EdgeInsets.all(8.0),
                //             child: TextFontWidget(
                //                 text: 'DD/MM/YYYY *', fontsize: 12.5),
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                GestureDetector(
                  onTap: () {
                    if (fkey.currentState!.validate()) {
                      // DateTime date = DateTime.parse(
                      //     getExamNotificationCtr.startDateCtr.text);
                      print('start');
                      print(getExamNotificationCtr.startDateCtr.text);
                      DateTime dateTime =
                          DateFormat("dd-MM-yyyy").parse(getExamNotificationCtr.startDateCtr.text);
                      print(dateTime);
                      getExamNotificationCtr.editExamNotification(
                          examName: getExamNotificationCtr.examNameCtr.text,
                          startDate: DateFormat("dd-MM-yyyy")
                              .parse(getExamNotificationCtr.startDateCtr.text)
                              .toString(),
                          endDate: DateFormat("dd-MM-yyyy")
                              .parse(getExamNotificationCtr.endDateCtr.text)
                              .toString(),
                          docId: data.docId);
                    }
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 40,
                    width: 150,
                    decoration: BoxDecoration(
                        color: themeColorBlue,
                        border: Border.all(color: themeColorBlue),
                        borderRadius: BorderRadius.circular(05)),
                    child: Center(
                      child: TextFontWidget(
                        text: "Edit",
                        fontsize: 14,
                        // fontWeight: FontWeight.w600,
                        color: cWhite,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
