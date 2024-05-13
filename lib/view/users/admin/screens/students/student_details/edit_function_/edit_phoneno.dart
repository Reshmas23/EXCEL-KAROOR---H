// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:vidyaveechi_website/controller/admin_section/teacher_controller/teacher_controller.dart';
// import 'package:vidyaveechi_website/view/colors/colors.dart';
// import 'package:vidyaveechi_website/view/fonts/text_widget.dart';

// editFunctionOfStudentPhoneNo(BuildContext context){
//     final TeacherController teacherController = Get.put(TeacherController());
//   showDialog(context: context, builder: (context) {
//     return AlertDialog( 
//       title: Row(
//         children: [ 
//           BackButton(),
//           TextFontWidget(text: "Edit Phone Number", fontsize: 16,fontWeight: FontWeight.w700,)
//         ],
//       ),
//        content:  SizedBox(
//         height: 160,
//         width: 250,
//         child: Column(
//           children: [ 
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: SizedBox(
//                   height: 80,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                        const TextFontWidget(
//                         text: "Phone Number *", fontsize: 12.5),
//                     const SizedBox(
//                       height: 05,
//                     ),
//                       Container(
//                         height: 40,
//                         decoration: BoxDecoration(
//                           border: Border.all(width: 1),
//                           borderRadius: const BorderRadius.all(Radius.circular(5))),
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: TextFormField(
//                             controller: teacherController.teacherPhoneNumeber,
//                             //textAlign: TextAlign.center, 
//                           decoration: const InputDecoration(
//                             hintText: "Enter Phone Number",
//                             hintStyle: TextStyle(fontSize: 13,),
//                             border: InputBorder.none),),
//                         )),
//                     ],
//                   ),
//                 ),
//             ), 
//           //  TextFormFiledBlueContainerWidget(hintText: "Enter Mintues", title: "Attendance Notification Time"),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: GestureDetector(
//               onTap: () {
//                 //if (_formKey.currentState!.validate()) {}
//               },
//               child: Container(
//                 height: 40,
//                 width: 150,
//                 decoration: BoxDecoration(
//                     color: themeColorBlue,
//                     border: Border.all(color: themeColorBlue),
//                     borderRadius: BorderRadius.circular(05)),
//                 child: const Center(
//                   child: TextFontWidget(
//                     text: "Update",
//                     fontsize: 14,
//                     // fontWeight: FontWeight.w600,
//                     color: cWhite,
//                   ),
//                 ),
//               ),
//                         ),
//             ),
//           ],
//         ),
//       ),
             

//       //  TextFormFiledBlueContainerWidget(
//       //   controller: teacherController.teacherPhoneNumeber,
//       //   hintText: "Enter Teacher Ph",
//       //   title: 'Phone Number',
//       //   validator: checkFieldPhoneNumberIsValid,
//       // ),
//     );
//   },);
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/admin_section/student_controller/student_controller.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';

class PhoneNumberStdEditWidget extends StatelessWidget {
  final String docid;
  const PhoneNumberStdEditWidget({super.key, required this.docid});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: SizedBox(
            height: 35,
            child: Center(
              child: TextFormField(
                controller: Get.find<StudentController>().phoneNumberStdEditController,
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 01, horizontal: 01),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0)),
                      borderSide: BorderSide(
                        width: 1,
                        style: BorderStyle.none,
                        color: Colors.red,
                      )),
                  focusedErrorBorder: OutlineInputBorder(
                    // borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(
                      width: 1,
                      style: BorderStyle.none,
                      color: Colors.red,
                    ),
                  ),
                  // contentPadding: const EdgeInsets.all(8.0),
                  enabledBorder:
                      OutlineInputBorder(borderSide: BorderSide(width: 0.4)),
                  hintStyle: TextStyle(fontSize: 13),
                  hintText: "  Enter phone number",
                  focusedBorder: OutlineInputBorder(
                    //<-- SEE HERE
                    borderSide: BorderSide(width: 1, color: Colors.green),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 2,
        ),
        Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: () async {
              await Get.find<StudentController>().updatePhoneNumber(docid);
            },
            child: Container(
              height: 35,
              decoration: BoxDecoration(
                  border: Border.all(color: cBlack.withOpacity(0.2))),
              child:  Center(
                child: TextFontWidget(
                  text: '✔️',
                  fontsize: 12,
                  fontWeight: FontWeight.bold,
                  color: cgreen,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 2,
        ),
        Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: () async {
              await Get.find<StudentController>().enableorDisableUpdate(
                docid,
                false,
              );
            },
            child: Container(
              height: 35,
              decoration: BoxDecoration(
                  border: Border.all(color: cBlack.withOpacity(0.2))),
              child: Center(
                child: TextFontWidget(
                  text: '✖️',
                  fontsize: 12,
                  fontWeight: FontWeight.bold,
                  color: cred,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
