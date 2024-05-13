import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/attendence_controller/attendence_controller.dart';
import 'package:vidyaveechi_website/model/student_Attendece_model/student_attendence_model.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/constant/constant.validate.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/attendence/attendence_adding_view.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/students/student_details/widgets/category_tableHeader.dart';
import 'package:vidyaveechi_website/view/widgets/routeSelectedTextContainer/routeSelectedTextContainer.dart';

class TeacherAttendanceDataTile extends StatelessWidget {
  final int index;
  final StudentAttendanceModel studentData;
  const TeacherAttendanceDataTile({
    required this.index,
    super.key,
    required this.studentData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: studentData.present == true
            ? Colors.green.withOpacity(0.1)
            : Colors.red.withOpacity(0.1),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: TextFontWidget(text: '${index + 1}', fontsize: 12),
            ),
          ),
          const SizedBox(
            width: 01,
          ),
           Expanded(
            flex: 2,
            child: Center(
              child: TextFontWidget(text: "0015", fontsize: 12),
            ),
          ),

          const SizedBox(
            width: 01,
          ),
          Expanded(
            flex: 4,
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                  child: Center(
                    child: Image.asset(
                      'webassets/stickers/icons8-student-100 (1).png',
                    ),
                  ),
                ),
                Expanded(
                  child: TextFontWidget(
                    text: "  ${studentData.studentName}",
                    fontsize: 12,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ), //........................................... teacher Name
          const SizedBox(
            width: 01,
          ),

          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 15,
                  child: Image.asset(
                    'webassets/png/active.png',
                  ),
                ),
                studentData.present
                    ?  TextFontWidget(
                        text: "  Present ",
                        fontsize: 12,
                        overflow: TextOverflow.ellipsis,
                      )
                    :  TextFontWidget(
                        text: "  Absent ",
                        fontsize: 12,
                        overflow: TextOverflow.ellipsis,
                      )
              ],
            ),
          ), //............................. Status [Active or DeActivate]
        ],
      ),
    );
  }
}

class TeacherEditAttendanceAddingDialog extends StatelessWidget {
  TeacherEditAttendanceAddingDialog({super.key});

  final GlobalKey<FormState> fkey = GlobalKey<FormState>();

  final AttendenceController attendenceController =
      Get.put(AttendenceController());

  @override
  Widget build(BuildContext context) {
    attendenceController.getEditAttendanceList();
    final size = MediaQuery.of(context).size;
    return AlertDialog(
      contentPadding:
          EdgeInsetsGeometry.lerp(EdgeInsets.zero, EdgeInsets.zero, 0),
      content: Container(
        decoration: const BoxDecoration(color: cWhite),
        width: size.width * 0.3,
        height: size.height * 0.7,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: fkey,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 60,
                  color: screenContainerbackgroundColor,
                  child: Center(
                    child: TextFontWidget(text: 'Add Attendance', fontsize: 25),
                  ),
                ),
                sh10,
                const Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: CatrgoryTableHeaderWidget(headerTitle: 'Name')),
                    Expanded(
                        flex: 1,
                        child: CatrgoryTableHeaderWidget(headerTitle: 'Status'))
                  ],
                ),
                sh10,
                Obx(
                  () => Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          final studentsData = attendenceController
                              // ignore: invalid_use_of_protected_member
                              .allStudentAttenanceList.value[index];
                          return AttendanceListTile(studentData: studentsData);
                        },
                        separatorBuilder: (context, index) {
                          return sh10;
                        },
                        itemCount: attendenceController
                            // ignore: invalid_use_of_protected_member
                            .allStudentAttenanceList.value.length),
                  ),
                ),
                Row(
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child:
                            const RouteSelectedTextContainer(title: 'Cancel')),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        if (fkey.currentState?.validate() ?? false) {
                          attendenceController.editAttendance();

                          Navigator.pop(context);
                        }
                      },
                      child: const RouteSelectedTextContainer(title: 'Submit'),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
