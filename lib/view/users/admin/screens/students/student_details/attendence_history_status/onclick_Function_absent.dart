import 'package:adaptive_ui_layout/flutter_responsive_layout.dart';
import 'package:awesome_side_sheet/Enums/sheet_position.dart';
import 'package:awesome_side_sheet/side_sheet.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vidyaveechi_website/controller/admin_section/student_controller/student_controller.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/google_lora.dart';
import 'package:vidyaveechi_website/view/fonts/google_poppins_widget.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';
import 'package:vidyaveechi_website/view/web_DashBoard/pages/video_management/presentation/pages/widgets/video_widgets.dart';

onClickFunctionOfAbsent(BuildContext context) {
  final StudentController studentController = Get.put(StudentController());
  final studentId = studentController.studentModelData.value;
  aweSideSheet(
      context: context,
      sheetPosition: SheetPosition.right,
      header: Container(),
      showCloseButton: false,
      footer: Container(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: Column(
            children: [
              const Row(
                children: [
                  BackButton(),
                  SizedBox(
                    width: 20,
                  ),
                  TextFontWidget(
                    text: 'Absent Days',
                    fontsize: 17,
                    fontWeight: FontWeight.bold,
                  ), 
                ],
              ),
              Container(
                color: adminePrimayColor.withOpacity(0.2),
                //const Color.fromARGB(255, 88, 167, 123).withOpacity(0.3),
                width: 500,
                height: 680,
                child: StreamBuilder(
                    stream: server
                        .collection("SchoolListCollection")
                        .doc(UserCredentialsController.schoolId)
                        .collection(UserCredentialsController.batchId!)
                        .doc(UserCredentialsController.batchId)
                        .collection('classes')
                        .doc(studentId?.classId)
                        .collection('Students')
                        .doc(studentId?.docid)
                        .collection('MyAttendenceList')
                        .where('present', isEqualTo: false)
                        .snapshots(),
                    builder: (context, dayssnaps) {
                      if (dayssnaps.hasData) {

                         List<Map<String, dynamic>> dataList = [];

                    for (var doc in dayssnaps.data?.docs ?? []) {
                      dataList.add({
                        'date': doc['date'],
                        'data': doc,
                      });
                    }

                    dataList.sort((a, b) {
                      DateTime dateA = DateTime.fromMillisecondsSinceEpoch(a['date']);
                      DateTime dateB = DateTime.fromMillisecondsSinceEpoch(b['date']);
                      return dateB.compareTo(dateA);
                    });

                        return ListView.separated(
                          itemBuilder: (context, index) {
                             final data = dataList[index]['data'];
                           // final data = dayssnaps.data?.docs[index];
                                      final dateString = data?['date']??''.toString();
                                      DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(dateString);
                                      String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);

                            return Padding(
                              padding:
                                  EdgeInsets.only(top: 10.sp, bottom: 10.sp),
                              child: Container(
                                height: 45.h,
                                decoration: const BoxDecoration(
                                    boxShadow: [BoxShadow(blurRadius: 1)],
                                    color: cWhite),
                                child: Row(
                                  children: [
                                    Container(
                                      color: cBlue,
                                      height: 45.h,
                                      width: 45.w,
                                      child: Center(
                                          child: GoogleLoraWidgets(
                                        text: '${index + 1}',
                                        fontsize: 13.sp,
                                        color: cWhite,
                                      )),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 10.sp),
                                      child: Center(
                                          child: GooglePoppinsWidgets(
                                            text: formattedDate,
                                              // text: dateConvert(dateString),
                                              fontsize: 14.sp)),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          itemCount: dayssnaps.data?.docs.length ?? 0,
                          separatorBuilder: (context, index) => SizedBox(
                            height: 1.h,
                          ),
                        );
                      } else {
                        return const TextFontWidget(
                            text: "No Data Found", fontsize: 12);
                      }
                    }),
              )
            ],
          ),
        ),
      ));
}
