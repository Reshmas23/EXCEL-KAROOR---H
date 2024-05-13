// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/admin_repo_controller/admin_controller.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/constant/constant.validate.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';

class TotalMembersSection extends StatelessWidget {
  final controller = Get.put(AdminGraphController());
  TotalMembersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: FutureBuilder(
          future: Future.wait([
            controller.getSchoolAllStudentsCount(),
            controller.getSchoolAllTeachersCount(),
            controller.getSchoolAllParentsCount(),
            controller.getSchoolAllStaffsCount(),
            controller.getSchoolAttendacne()
          ]),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      //  addAttendance(context);
                    },
                    child: TotalMemberContainerWidget(
                        imageradius: 20,
                        imagepath: 'webassets/png/student.png',
                        imageColor: const Color.fromARGB(255, 60, 184, 120),
                        color: const Color.fromARGB(255, 209, 243, 224),
                        count: (snapshot.data![0] as Map<String, dynamic>)["total"],
                        title: 'Students'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TotalMemberContainerWidget(
                        imageradius: 18,
                        imagepath: 'webassets/png/teacher.png',
                        imageColor: const Color.fromARGB(255, 63, 122, 252),
                        color: const Color.fromARGB(255, 225, 241, 255),
                        count: (snapshot.data?[1] as int),
                        title: 'Teachers'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TotalMemberContainerWidget(
                        imageradius: 18,
                        imagepath: 'webassets/png/parent.png',
                        imageColor: const Color.fromARGB(255, 255, 160, 1),
                        color: const Color.fromARGB(255, 255, 242, 216),
                        count: (snapshot.data?[2] as int),
                        title: 'Parents'),
                  ),
                ],
              );
            } else {
              return circularProgressIndicator;
            }
          }),
    );
  }
}

class TotalMemberContainerWidget extends StatelessWidget {
  double? h;
  double? w;
  String imagepath;
  String title;
  int count;
  Color color;
  Color imageColor;
  double imageradius;

  TotalMemberContainerWidget({
    this.h,
    this.w,
    required this.imagepath,
    required this.imageColor,
    required this.imageradius,
    required this.color,
    required this.count,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: h ?? 85,
      width: w ?? 250,
      decoration: BoxDecoration(color: cWhite, border: Border.all(color: cBlack.withOpacity(0.1))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: CircleAvatar(
              radius: 33,
              backgroundColor: color,
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: imageradius,
                child: Image.asset(
                  imagepath,
                  color: imageColor,
                ),
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFontWidget(
                  text: title,
                  fontsize: 14,
                  color: cBlack.withOpacity(0.4),
                  fontWeight: FontWeight.w700,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFontWidget(
                  text: count.toString(),
                  fontsize: 17,
                  fontWeight: FontWeight.w800,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
