import 'package:flutter/material.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/students/student_details/widgets/category_tableHeader.dart';
import 'package:vidyaveechi_website/view/widgets/data_list_widgets/data_container.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';

class SubjectDisplayTable extends StatelessWidget {
  const SubjectDisplayTable({
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
                    : const EdgeInsets.only(left: 10, right: 10, top: 0),
                child: Container(
                  color: cWhite,
                  height: 40,
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: CatrgoryTableHeaderColorWidget(
                            headerTitle: 'No',
                            color: themeColorBlue.withOpacity(0.3),
                            textcolor: cBlack,
                          )),
                      const SizedBox(
                        width: 02,
                      ),
                      Expanded(
                          flex: 4,
                          child: CatrgoryTableHeaderColorWidget(
                            headerTitle: 'Subject',
                            color: themeColorBlue.withOpacity(0.3),
                            textcolor: cBlack,
                          )),
                      const SizedBox(
                        width: 02,
                      ),
                      //    Expanded(
                      //       flex: 1,
                      //       child: CatrgoryTableHeaderColorWidget(headerTitle: 'Edit',
                      //  color: themeColorBlue.withOpacity(0.3),textcolor: cBlack,),
                      //       // child:
                      //       //     CatrgoryTableHeaderWidget(headerTitle: 'Edit')
                      //           ),
                      //   const SizedBox(
                      //     width: 02,
                      //   ),
                      //    Expanded(
                      //       flex: 1,
                      //       child:CatrgoryTableHeaderColorWidget(headerTitle: 'Remove',
                      //  color: themeColorBlue.withOpacity(0.3),textcolor: cBlack,),
                      //           //CatrgoryTableHeaderWidget(headerTitle: 'Remove')
                      //           ),
                      //   const SizedBox(
                      //     width: 02,
                      //   ),
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: Padding(
                padding: ResponsiveWebSite.isMobile(context)
                    ? const EdgeInsets.all(0)
                    : const EdgeInsets.only(left: 10, right: 10, top: 0),
                child: SizedBox(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 0, right: 0),
                            child: SubjectDataListContainer(index: index),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 02,
                          );
                        },
                        itemCount: 100)),
              ))
            ],
          ),
        )
      ],
    );
  }
}

class SubjectDataListContainer extends StatelessWidget {
  final int index;
  const SubjectDataListContainer({
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
            flex: 4,
            child: Container(
              color: index % 2 == 0
                  ? const Color.fromARGB(255, 246, 246, 246)
                  : Colors.blue[50],
              child:
                  //  ListView.separated(
                  //     scrollDirection: Axis.horizontal,
                  //     itemBuilder: (context, index) {
                  //       return
                  Container(
                decoration: BoxDecoration(
                    border: Border.all(color: cBlack.withOpacity(0.2))),
                width: 50,
                child:  Center(
                  child: TextFontWidget(
                    text: " English",
                    fontsize: 13,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              // },
              // separatorBuilder: (context, index) {
              //   return const SizedBox(
              //     width: 03,
              //   );
              // },
              // itemCount: 08),
            ),
          ), //........................................... Subjects
          const SizedBox(
            width: 02,
          ),
          //  Expanded(
          //     flex: 1,
          //     child: Container(
          //       height: 45,
          //       decoration: BoxDecoration(
          //         color: index % 2 == 0
          //             ? const Color.fromARGB(255, 246, 246, 246)
          //             : Colors.blue[50],
          //       ),
          //       child:  const Row(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           Icon(Icons.edit,color: cgreen,size: 18,),
          //           //Image.asset("webassets/stickers/pencil.png",height: 25,color: cgreen, )
          //           ],
          //       ),
          //     )),// ................................... edit
          // const SizedBox(
          //   width: 02,
          // ),
          // Expanded(
          //     flex: 1,
          //     child: Container(
          //       height: 45,
          //       decoration: BoxDecoration(
          //         color: index % 2 == 0
          //             ? const Color.fromARGB(255, 246, 246, 246)
          //             : Colors.blue[50],
          //       ),
          //       child:  const Row(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           Icon(Icons.delete,color: cred,size: 18,)
          //           //Image.asset("webassets/stickers/delete.png",height: 25,color: cred,)
          //         ],
          //       ),
          //     )), //.......................................delete
          // const SizedBox(
          //   width: 02,
          // ),
        ],
      ),
    );
  }
}
