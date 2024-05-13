import 'package:flutter/material.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/students/student_details/widgets/category_tableHeader.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/students/student_details/widgets/category_tile_container.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/teacher/teachers_details/widgets/tr_attendence_dataList.dart';

class PerTeacherAttendenceHistory extends StatelessWidget {
  const PerTeacherAttendenceHistory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40,
          width: 1200,
          color: adminePrimayColor.withOpacity(0.1),
          child:  Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFontWidget(
              text: 'Attendence Section',
              fontsize: 16,
              fontWeight: FontWeight.bold,
              color: adminePrimayColor,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              StudentCategoryTileContainer(
                  title: 'No.of Present',
                  subTitle: '1500 ',
                  color: Color.fromARGB(255, 121, 240, 125)),
              StudentCategoryTileContainer(
                  title: 'No.of Absent',
                  subTitle: '1000',
                  color: Color.fromARGB(255, 234, 102, 92)),
              StudentCategoryTileContainer(
                  title: 'Working Days',
                  subTitle: '2500 ',
                  color: Color.fromARGB(255, 121, 123, 240))
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
                child: Container(
                  color: cWhite,
                  height: 40,
                  child: const Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: CatrgoryTableHeaderColorWidget(color: adminePrimayColor,textcolor: cWhite,headerTitle: 'No')),
                      SizedBox(
                        width: 02,
                      ),
                      Expanded(
                          flex: 1,
                          child:
                              CatrgoryTableHeaderColorWidget(color: adminePrimayColor,textcolor: cWhite,headerTitle: 'Days')),
                      SizedBox(
                        width: 02,
                      ),
                      Expanded(
                          flex: 5,
                          child: CatrgoryTableHeaderColorWidget(color: adminePrimayColor,textcolor: cWhite,
                              headerTitle: 'Subjects')),
                      SizedBox(
                        width: 02,
                      ),
                      Expanded(
                          flex: 1,
                          child: CatrgoryTableHeaderColorWidget(color: adminePrimayColor,textcolor: cWhite,
                              headerTitle: 'Attended Class')),
                      SizedBox(
                        width: 02,
                      ),
                      Expanded(
                          flex: 1,
                          child: CatrgoryTableHeaderColorWidget(color: adminePrimayColor,textcolor: cWhite,
                              headerTitle: 'Missed Classes')),
                      SizedBox(
                        width: 02,
                      ),
                      Expanded(
                          flex: 1,
                          child: CatrgoryTableHeaderColorWidget(color: adminePrimayColor,textcolor: cWhite,
                              headerTitle: 'Total Classes')),
                      SizedBox(
                        width: 02,
                      ),
                      Expanded(
                          flex: 1,
                          child: CatrgoryTableHeaderColorWidget(color: adminePrimayColor,textcolor: cWhite,
                              headerTitle: 'Presnet/Absent')),
                      SizedBox(
                        width: 02,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: SizedBox(
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: TeacherAttendenceDataListContainer(index: index),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 02,
                            );
                          },
                          itemCount: 100)))
            ],
          ),
        )
      ],
    );
  }
}
