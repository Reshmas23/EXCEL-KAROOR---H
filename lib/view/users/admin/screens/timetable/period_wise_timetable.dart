import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/class_controller/class_controller.dart';
import 'package:vidyaveechi_website/controller/timetable_controller/timetable_controller.dart';
import 'package:vidyaveechi_website/model/timetable_model/timetable_model.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/constant/constant.validate.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/result/widget/data_container_marks.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/students/student_details/widgets/category_tableHeader.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';
import 'package:vidyaveechi_website/view/widgets/custom_delete_showdialog/custom_delete_showdialog.dart';
import 'package:vidyaveechi_website/view/widgets/custom_showdialouge/custom_showdialouge.dart';
import 'package:vidyaveechi_website/view/widgets/loading_widget/loading_widget.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';
import 'package:vidyaveechi_website/view/widgets/textformFiledContainer/textformFiledBlueContainer.dart';

class PeriodWiseTimeTable extends StatelessWidget {
  final dynamic data;
  final String docid;
  final TimeTableController timeTableController =
      Get.put(TimeTableController());

  final String subjectID;
  PeriodWiseTimeTable({
    required this.data,
    required this.docid,
    super.key,
    required this.subjectID,
  });
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: SizedBox(
        height: 450,
        width: ResponsiveWebSite.isMobile(context) ? double.infinity : 1300,
        // width: ResponsiveWebSite.isMobile(context)?500: ResponsiveWebSite.isTablet(context)?800: 1200,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                const Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: CatrgoryTableHeaderWidget(headerTitle: 'No')),
                    SizedBox(
                      width: 1,
                    ),
                    Expanded(
                        flex: 1,
                        child:
                            CatrgoryTableHeaderWidget(headerTitle: "Period ")),
                    SizedBox(
                      width: 1,
                    ),
                    Expanded(
                        flex: 3,
                        child:
                            CatrgoryTableHeaderWidget(headerTitle: "Subject")),
                    SizedBox(
                      width: 1,
                    ),
                    Expanded(
                        flex: 3,
                        child: CatrgoryTableHeaderWidget(headerTitle: "Time")),
                    SizedBox(
                      width: 1,
                    ),
                    Expanded(
                        flex: 2,
                        child: CatrgoryTableHeaderWidget(headerTitle: "Edit")),
                    SizedBox(
                      width: 1,
                    ),
                    Expanded(
                        flex: 2,
                        child:
                            CatrgoryTableHeaderWidget(headerTitle: "Delete")),
                    SizedBox(
                      width: 1,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 500,
                  child: StreamBuilder(
                      stream: server
                          .collection('SchoolListCollection')
                          .doc(UserCredentialsController.schoolId)
                          .collection(UserCredentialsController.batchId!)
                          .doc(UserCredentialsController.batchId!)
                          .collection('classes')
                          .doc(Get.find<ClassController>().classDocID.value)
                          .collection('timetables')
                          .doc(docid)
                          .collection('Subjects')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return snapshot.data!.docs.isEmpty
                              ? const Text(
                                  'Please select Class in Right Top DropDown List 😊')
                              : ListView.separated(
                                  itemBuilder: (context, index) {
                                    final data = TimeTableModel.fromMap(
                                        snapshot.data!.docs[index].data());
                                    return GestureDetector(
                                      onTap: () {},
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: DataContainerMarksWidget(
                                                color: data.selectColor,
                                                wantColor: false,
                                                rowMainAccess:
                                                    MainAxisAlignment.center,
                                                index: index,
                                                headerTitle: "${index + 1}"),
                                          ),
                                          const SizedBox(
                                            width: 1,
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: DataContainerMarksWidget(
                                                color: data.selectColor,
                                                rowMainAccess:
                                                    MainAxisAlignment.center,
                                                index: index,
                                                headerTitle:
                                                    " ${data.periodNumber}"),
                                          ),
                                          const SizedBox(
                                            width: 1,
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: DataContainerMarksWidget(
                                                color: data.selectColor,
                                                rowMainAccess:
                                                    MainAxisAlignment.start,
                                                index: index,
                                                headerTitle:
                                                    "   ${data.subjectName}"),
                                          ),
                                          const SizedBox(
                                            width: 1,
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: DataContainerMarksWidget(
                                                color: data.selectColor,
                                                rowMainAccess:
                                                    MainAxisAlignment.start,
                                                index: index,
                                                headerTitle:
                                                    " ${data.startTime} - ${data.endTime}"),
                                          ),
                                          const SizedBox(
                                            width: 1,
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: GestureDetector(
                                              onTap: () {
                                                customShowDilogBox(
                                                    context: context,
                                                    title: 'Edit',
                                                    children: [
                                                      SizedBox(
                                                        width: 400,
                                                        height: 500,
                                                        child: Form(
                                                          key: formKey,
                                                          child:
                                                              SingleChildScrollView(
                                                            child: Column(
                                                              children: [
                                                                TextFormFiledBlueContainerWidgetWithOutColor(
                                                                  validator:
                                                                      checkFieldEmpty,
                                                                  hintText:
                                                                      ' ${data.periodNumber}',
                                                                  title:
                                                                      'Period Number',
                                                                  controller:
                                                                      timeTableController
                                                                          .periodController,
                                                                ),
                                                                const SizedBox(
                                                                  height: 20,
                                                                ),
                                                                TextFormFiledBlueContainerWidgetWithOutColor(
                                                                  validator:
                                                                      checkFieldEmpty,
                                                                  hintText:
                                                                      ' ${data.subjectName}',
                                                                  title:
                                                                      'Subject Name',
                                                                  controller:
                                                                      timeTableController
                                                                          .subjectNamecontroller,
                                                                ),
                                                                const SizedBox(
                                                                  height: 10,
                                                                ),
                                                                TextFormFiledBlueContainerWidgetWithOutColor(
                                                                  validator:
                                                                      checkFieldEmpty,
                                                                  onTap:
                                                                      () async {
                                                                    await timeTableController.selectTimesec(
                                                                        context,
                                                                        timeTableController
                                                                            .startTimeviewController);
                                                                  },
                                                                  hintText:
                                                                      ' ${data.startTime}',
                                                                  title:
                                                                      'Start Time',
                                                                  controller:
                                                                      timeTableController
                                                                          .startTimeviewController,
                                                                ),
                                                                const SizedBox(
                                                                  height: 10,
                                                                ),
                                                                TextFormFiledBlueContainerWidgetWithOutColor(
                                                                  validator:
                                                                      checkFieldEmpty,
                                                                  onTap:
                                                                      () async {
                                                                    await timeTableController.selectTimesec(
                                                                        context,
                                                                        timeTableController
                                                                            .endTimeviewController);
                                                                  },
                                                                  hintText:
                                                                      ' ${data.endTime}',
                                                                  title:
                                                                      'End Time',
                                                                  controller:
                                                                      timeTableController
                                                                          .endTimeviewController,
                                                                ),
                                                                const SizedBox(
                                                                  height: 10,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                    doyouwantActionButton: true,
                                                    actiontext: 'Update',
                                                    actiononTapfuction: () {
                                                      if (formKey.currentState!
                                                          .validate()) {
                                                        timeTableController
                                                            .enableUpdate(
                                                                data.docid,
                                                                data.dayName!);
                                                        Navigator.of(context)
                                                            .pop();
                                                      }
                                                    });
                                              },
                                              child: DataContainerMarksWidget(
                                                  color: data.selectColor,
                                                  rowMainAccess:
                                                      MainAxisAlignment.center,
                                                  index: index,
                                                  headerTitle: '  Edit'),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 1,
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: GestureDetector(
                                              onTap: () {
                                                customDeleteShowDialog(
                                                  context: context,
                                                  onTap: () {
                                                    timeTableController
                                                        .enableDelete(
                                                            data.docid,
                                                            data.dayName!);
                                                    Navigator.of(context).pop();
                                                  },
                                                );
                                              },
                                              child: DataContainerMarksWidget(
                                                  color: data.selectColor,
                                                  rowMainAccess:
                                                      MainAxisAlignment.center,
                                                  index: index,
                                                  headerTitle: '  Delete'),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  itemCount: snapshot.data!.docs.length,
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                    height: 1,
                                  ),
                                );
                        } else if (snapshot.data == null) {
                          return Center(
                            child: TextFontWidget(
                                text: "No result found", fontsize: 12),
                          );
                        } else {
                          return const LoadingWidget();
                        }
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class TextFormFiledBlueContainerWidget3 extends StatelessWidget {
  TextEditingController? controller = TextEditingController();
  final String title;
  final String labeltext;
  final Widget? widget;
  final double? width;
  final Color? color;
  Function(String)? onChanged;
  Iterable<String>? autofillHints;
  String? Function(String?)? validator;
  bool? readOnly;
  Function()? onTap;
  TextInputType? keyboardType;
  TextFormFiledBlueContainerWidget3({
    this.width,
    this.widget,
    this.color,
    required this.labeltext,
    required this.title,
    this.keyboardType,
    this.controller,
    this.autofillHints,
    this.onChanged,
    this.validator,
    this.onTap,
    this.readOnly,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ResponsiveWebSite.isMobile(context) ? 80 : 80,
      color: color ?? cWhite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFontWidget(text: '$title *', fontsize: 12.5),
              widget == null ? const SizedBox() : widget!,
            ],
          ),
          const SizedBox(
            height: 05,
          ),
          Container(
            // height: 40,
            width: width,
            color: screenContainerbackgroundColor,
            child: Center(
              child: TextFormField(
                readOnly: readOnly ?? false,
                onChanged: onChanged,
                autofillHints: autofillHints,
                onTap: onTap,
                validator: validator,
                keyboardType: keyboardType,
                controller: controller,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 01, horizontal: 01),
                  errorBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0)),
                      borderSide: BorderSide(
                        width: 1,
                        style: BorderStyle.none,
                        color: Colors.red,
                      )),
                  focusedErrorBorder: const OutlineInputBorder(
                    // borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(
                      width: 1,
                      style: BorderStyle.none,
                      color: Colors.red,
                    ),
                  ),
                  // contentPadding: const EdgeInsets.all(8.0),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(width: 0.4)),
                  hintStyle: const TextStyle(fontSize: 13),
                  labelText: labeltext,
                  focusedBorder: const OutlineInputBorder(
                    //<-- SEE HERE
                    borderSide: BorderSide(width: 1, color: Colors.green),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
