import 'package:flutter/material.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/students/student_details/widgets/category_tableHeader.dart';
import 'package:vidyaveechi_website/view/widgets/data_list_widgets/data_container.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';

class TeacherSubjectPriceTable extends StatelessWidget {
  const TeacherSubjectPriceTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ResponsiveWebSite.isMobile(context)
            ? Container(
                height: 40,
                width: 1200,
                color: Colors.blue.withOpacity(0.1),
                child:  Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFontWidget(
                    text: 'Subject',
                    fontsize: 16,
                    fontWeight: FontWeight.bold,
                    color: cBlue,
                  ),
                ),
              )
            : const SizedBox(
                height: 1,
              ),
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: ResponsiveWebSite.isMobile(context)
                    ? const EdgeInsets.all(0)
                    : const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Container(
                  color: cWhite,
                  height: 40,
                  child: const Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: CatrgoryTableHeaderColorWidget(
                              color: adminePrimayColor,
                              textcolor: cWhite,
                              headerTitle: 'No')),
                      SizedBox(
                        width: 02,
                      ),
                      Expanded(
                          flex: 5,
                          child: CatrgoryTableHeaderColorWidget(
                              color: adminePrimayColor,
                              textcolor: cWhite,
                              headerTitle: 'Subjects')),
                      SizedBox(
                        width: 02,
                      ),
                      Expanded(
                          flex: 1,
                          child: CatrgoryTableHeaderColorWidget(
                              color: adminePrimayColor,
                              textcolor: cWhite,
                              headerTitle: 'Price')),
                      SizedBox(
                        width: 02,
                      ),
                      Expanded(
                          flex: 1,
                          child: CatrgoryTableHeaderColorWidget(
                              color: adminePrimayColor,
                              textcolor: cWhite,
                              headerTitle: 'Remove')),
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
                              child:
                                  TeacherSubjectDataListContainer(index: index),
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

class TeacherSubjectDataListContainer extends StatelessWidget {
  final int index;
  const TeacherSubjectDataListContainer({
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: DataContainerWidget(
                rowMainAccess: MainAxisAlignment.center,
                color: cWhite,
                // width: 150,
                index: index,
                headerTitle: '${index + 1}'), //....................No
          ),

          const SizedBox(
            width: 02,
          ),
          Expanded(
            flex: 5,
            child: Container(
              color: index % 2 == 0
                  ? const Color.fromARGB(255, 246, 246, 246)
                  : Colors.blue[50],
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: cBlack.withOpacity(0.2))),
                      width: 50,
                      child:  Center(
                        child: TextFontWidget(
                          text: " English",
                          fontsize: 10,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 03,
                    );
                  },
                  itemCount: 08),
            ),
          ), //........................................... Subjects
          const SizedBox(
            width: 02,
          ),
          Expanded(
            flex: 1,
            child: DataContainerWidget(
                rowMainAccess: MainAxisAlignment.center,
                color: cWhite,
                index: index,
                headerTitle: "5"),
          ), // ................................... Fees /price
          const SizedBox(
            width: 02,
          ),
          Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  deleteFunctionOfTeacherSubject(context);
                },
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    color: index % 2 == 0
                        ? const Color.fromARGB(255, 246, 246, 246)
                        : Colors.blue[50],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.delete_outline,
                        color: cBlack.withOpacity(0.7),
                      )
                      // Image.asset("webassets/stickers/delete.png",height: 25,)
                    ],
                  ),
                ),
              )), //....................................... delete
          const SizedBox(
            width: 02,
          ),
        ],
      ),
    );
  }
}

deleteFunctionOfTeacherSubject(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title:  Row(
          children: [BackButton(), TextFontWidget(text: "Alert", fontsize: 15)],
        ),
        content:  TextFontWidget(
            text: "Do you want to delete this subject", fontsize: 14),
        actions: [
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    height: 30,
                    color: Colors.grey.withOpacity(0.5),
                    alignment: Alignment.center,
                    child:  TextFontWidget(
                      text: "Yes",
                      fontsize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  )),
              const Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: 30,
                  )),
              Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.grey.withOpacity(0.5),
                    height: 30,
                    alignment: Alignment.center,
                    child:  TextFontWidget(
                      text: "Cancel",
                      fontsize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ))
            ],
          )
        ],
      );
    },
  );
}
