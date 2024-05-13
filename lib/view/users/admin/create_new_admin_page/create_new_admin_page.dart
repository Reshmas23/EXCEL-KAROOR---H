// import 'package:dropdown_search/dropdown_search.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';
// import 'package:vidyaveechi_website/controller/admin_section/student_controller/student_controller.dart';
// import 'package:vidyaveechi_website/view/colors/colors.dart';
// import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
// import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';
// import 'package:vidyaveechi_website/view/widgets/routeSelectedTextContainer/routeSelectedTextContainer.dart';
// import 'package:vidyaveechi_website/view/widgets/routeSelectedTextContainer/route_NonSelectedContainer.dart';
// import 'package:vidyaveechi_website/view/widgets/textformFiledContainer/textformFiledBlueContainer.dart';

// class AddNewAdminPage extends StatelessWidget {
//   final StudentController studentController = Get.put(StudentController());
//   AddNewAdminPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: screenContainerbackgroundColor,
//       // height: 800,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Padding(
//             padding: EdgeInsets.only(left: 25, top: 25),
//             child: TextFontWidget(
//               text: 'Create A New Admin',
//               fontsize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const Padding(
//             padding: EdgeInsets.only(top: 10),
//             child: Row(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.only(
//                     left: 08,
//                     right: 05,
//                   ),
//                   child: RouteNonSelectedTextContainer(title: 'Home'),
//                 ),
//                 RouteSelectedTextContainer(
//                     width: 140, title: 'Create A New Admin'),
//               ],
//             ),
//           ),
//           ResponsiveWebSite.isMobile(context)
//               ? Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: SingleChildScrollView(
//                     child: Container(
//                       color: cWhite,
//                       // height: 600,
//                       width: double.infinity,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Padding(
//                             padding: EdgeInsets.only(left: 20, top: 15),
//                             child: TextFontWidget(
//                               text: 'Add A New Admin ',
//                               fontsize: 18,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(top: 10),
//                             child: Column(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(
//                                       right: 20, left: 10, top: 10),
//                                   child: TextFormFiledBlueContainerWidget(
//                                     hintText: "Enter Admin Name",
//                                     title: 'Admin Name',
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.only(
//                                     right: 20,
//                                     left: 10,
//                                   ),
//                                   child: Obx(() => studentController
//                                               .automaticmail.value ==
//                                           false
//                                       ? TextFormFiledBlueContainerWidget(
//                                           hintText: "Enter Admin Email",
//                                           title: 'Admin Email',
//                                           widget: Row(
//                                             children: [
//                                               const TextFontWidget(
//                                                   text:
//                                                       'Admin have no email ID?',
//                                                   fontsize: 10.5),
//                                               SizedBox(
//                                                 height: 05,
//                                                 child: Checkbox(
//                                                   activeColor: cgreen,
//                                                   value: studentController
//                                                       .automaticmail.value,
//                                                   onChanged: (value) {
//                                                     value = studentController
//                                                         .automaticmail
//                                                         .value = true;
//                                                   },
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         )
//                                       : SizedBox(
//                                           height: 100,
//                                           child: Column(
//                                             children: [
//                                               Row(
//                                                 children: [
//                                                   const TextFontWidget(
//                                                       text:
//                                                           '  Admin have no email ID?',
//                                                       fontsize: 10.5),
//                                                   SizedBox(
//                                                     height: 10,
//                                                     child: Checkbox(
//                                                       activeColor: cgreen,
//                                                       value: studentController
//                                                           .automaticmail.value,
//                                                       onChanged: (value) {
//                                                         value =
//                                                             studentController
//                                                                 .automaticmail
//                                                                 .value = false;
//                                                       },
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                               const SizedBox(
//                                                 height: 05,
//                                               ),
//                                               Container(
//                                                 height: 40,
//                                                 decoration: BoxDecoration(
//                                                   color: themeColorBlue,
//                                                   border: Border.all(
//                                                       color: cBlack
//                                                           .withOpacity(0.4)),
//                                                 ),
//                                                 child: const Center(
//                                                   child: TextFontWidget(
//                                                     text: "Auto - Creation",
//                                                     fontsize: 12.5,
//                                                     color: cWhite,
//                                                   ),
//                                                 ),
//                                               )
//                                             ],
//                                           ),
//                                         )),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.only(
//                                       right: 20, left: 10, top: 10),
//                                   child: TextFormFiledBlueContainerWidget(
//                                     hintText: "Enter Admin Phone",
//                                     title: 'Phone Number',
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Column(
//                             children: [
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.only(left: 20, right: 20),
//                                 child: Container(
//                                   height: 80,
//                                   color: cWhite,
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       const TextFontWidget(
//                                           text: 'Gender *', fontsize: 12.5),
//                                       const SizedBox(
//                                         height: 05,
//                                       ),
//                                       SizedBox(
//                                         height: 40,
//                                         child: DropdownSearch(
//                                           items: const ['Male', 'Female'],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.only(left: 20, right: 20),
//                                 child: Container(
//                                   height: 80,
//                                   color: cWhite,
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       const TextFontWidget(
//                                           text: 'Date of birth 🗓️ *',
//                                           fontsize: 12.5),
//                                       const SizedBox(
//                                         height: 05,
//                                       ),
//                                       GestureDetector(
//                                         onTap: () => showDatePicker(
//                                           context: context,
//                                           initialDate: DateTime.now(),
//                                           firstDate: DateTime(2018),
//                                           lastDate: DateTime(2030),
//                                           helpText: 'Select a date',
//                                           cancelText: 'Cancel',
//                                           confirmText: 'OK',
//                                           builder: (BuildContext context,
//                                               Widget? child) {
//                                             return Theme(
//                                               data: ThemeData.light().copyWith(
//                                                 primaryColor: const Color(
//                                                     0xFF2296F3), // Header background color
//                                                 // accentColor: Colors.white, // Selection color
//                                                 colorScheme:
//                                                     const ColorScheme.light(
//                                                         primary:
//                                                             Color(0xFF2296F3)),
//                                                 buttonTheme:
//                                                     const ButtonThemeData(
//                                                   textTheme:
//                                                       ButtonTextTheme.primary,
//                                                 ),
//                                               ),
//                                               child: child!,
//                                             );
//                                           },
//                                         ),
//                                         child: Container(
//                                           height: 40,
//                                           decoration: BoxDecoration(
//                                               borderRadius:
//                                                   BorderRadius.circular(05),
//                                               color:
//                                                   screenContainerbackgroundColor,
//                                               border: Border.all(
//                                                   color:
//                                                       cBlack.withOpacity(0.4))),
//                                           width: double.infinity,
//                                           child: const Padding(
//                                             padding: EdgeInsets.all(8.0),
//                                             child: TextFontWidget(
//                                                 text: 'DD/MM/YYYY *',
//                                                 fontsize: 12.5),
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(
//                                     right: 20, left: 20, top: 10),
//                                 child: TextFormFiledBlueContainerWidget(
//                                   hintText: "Enter Admin User Name",
//                                   title: 'User Name',
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(
//                                     right: 20, left: 20, top: 10),
//                                 child: TextFormFiledBlueContainerWidget(
//                                   hintText: "Enter User Password",
//                                   title: 'User Password',
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(
//                                     right: 20, left: 20, top: 10),
//                                 child: TextFormFiledBlueContainerWidget(
//                                   hintText: "Confirm User Password ",
//                                   title: 'Confirm Password',
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(
//                                     top: 20, left: 20, bottom: 20),
//                                 child: Container(
//                                   height: 40,
//                                   width: 200,
//                                   decoration: BoxDecoration(
//                                       color: themeColorBlue,
//                                       border: Border.all(color: themeColorBlue),
//                                       borderRadius: BorderRadius.circular(05)),
//                                   child: const Center(
//                                     child: TextFontWidget(
//                                       text: "Create A New Admin",
//                                       fontsize: 14,
//                                       // fontWeight: FontWeight.w600,
//                                       color: cWhite,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           // Container()
//                         ],
//                       ),
//                     ),
//                   ),
//                 )
//               : Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     color: cWhite,
//                     height: 500,
//                     width: double.infinity,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Padding(
//                           padding: EdgeInsets.only(left: 20, top: 15),
//                           child: TextFontWidget(
//                             text: 'Add New Admin',
//                             fontsize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 10),
//                           child: Row(
//                             children: [
//                               Expanded(
//                                 flex: 1,
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(
//                                       right: 20, left: 10, top: 20),
//                                   child: TextFormFiledBlueContainerWidget(
//                                     hintText: "Enter Admin Name",
//                                     title: 'Admin Name',
//                                   ),
//                                 ),
//                               ),
//                               Expanded(
//                                 flex: 1,
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(
//                                     right: 20,
//                                     left: 10,
//                                   ),
//                                   child: Obx(() => studentController
//                                               .automaticmail.value ==
//                                           false
//                                       ? TextFormFiledBlueContainerWidget(
//                                           hintText: "Enter Admin Email",
//                                           title: 'Admin Email',
//                                           widget: Row(
//                                             children: [
//                                               const TextFontWidget(
//                                                   text:
//                                                       'Admin have no email ID?',
//                                                   fontsize: 10.5),
//                                               SizedBox(
//                                                 height: 05,
//                                                 child: Checkbox(
//                                                   activeColor: cgreen,
//                                                   value: studentController
//                                                       .automaticmail.value,
//                                                   onChanged: (value) {
//                                                     value = studentController
//                                                         .automaticmail
//                                                         .value = true;
//                                                   },
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         )
//                                       : SizedBox(
//                                           height: 100,
//                                           child: Column(
//                                             children: [
//                                               Row(
//                                                 children: [
//                                                   const TextFontWidget(
//                                                       text:
//                                                           '  Admin have no email ID?',
//                                                       fontsize: 10.5),
//                                                   SizedBox(
//                                                     height: 10,
//                                                     child: Checkbox(
//                                                       activeColor: cgreen,
//                                                       value: studentController
//                                                           .automaticmail.value,
//                                                       onChanged: (value) {
//                                                         value =
//                                                             studentController
//                                                                 .automaticmail
//                                                                 .value = false;
//                                                       },
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                               const SizedBox(
//                                                 height: 05,
//                                               ),
//                                               Container(
//                                                 height: 40,
//                                                 decoration: BoxDecoration(
//                                                   color: themeColorBlue,
//                                                   border: Border.all(
//                                                       color: cBlack
//                                                           .withOpacity(0.4)),
//                                                 ),
//                                                 child: const Center(
//                                                   child: TextFontWidget(
//                                                     text: "Auto - Creation",
//                                                     fontsize: 12.5,
//                                                     color: cWhite,
//                                                   ),
//                                                 ),
//                                               )
//                                             ],
//                                           ),
//                                         )),
//                                 ),
//                               ),
//                               Expanded(
//                                 flex: 1,
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(
//                                       right: 20, left: 10, top: 20),
//                                   child: TextFormFiledBlueContainerWidget(
//                                     hintText: "Enter Admin Phone",
//                                     title: 'Phone Number',
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Row(
//                           children: [
//                             Expanded(
//                                 flex: 1,
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(
//                                       left: 10, right: 20),
//                                   child: Container(
//                                     height: 100,
//                                     color: cWhite,
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         const TextFontWidget(
//                                             text: 'Gender *', fontsize: 12.5),
//                                         const SizedBox(
//                                           height: 05,
//                                         ),
//                                         SizedBox(
//                                           height: 40,
//                                           child: DropdownSearch(
//                                             items: const ['Male', 'Female'],
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 )),
//                             Expanded(
//                                 flex: 1,
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(
//                                       left: 10, right: 20),
//                                   child: Container(
//                                     height: 100,
//                                     color: cWhite,
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         const TextFontWidget(
//                                             text: 'Date of birth 🗓️ *',
//                                             fontsize: 12.5),
//                                         const SizedBox(
//                                           height: 05,
//                                         ),
//                                         GestureDetector(
//                                           onTap: () => showDatePicker(
//                                             context: context,
//                                             initialDate: DateTime.now(),
//                                             firstDate: DateTime(2018),
//                                             lastDate: DateTime(2030),
//                                             helpText: 'Select a date',
//                                             cancelText: 'Cancel',
//                                             confirmText: 'OK',
//                                             builder: (BuildContext context,
//                                                 Widget? child) {
//                                               return Theme(
//                                                 data:
//                                                     ThemeData.light().copyWith(
//                                                   primaryColor: const Color(
//                                                       0xFF2296F3), // Header background color
//                                                   // accentColor: Colors.white, // Selection color
//                                                   colorScheme:
//                                                       const ColorScheme.light(
//                                                           primary: Color(
//                                                               0xFF2296F3)),
//                                                   buttonTheme:
//                                                       const ButtonThemeData(
//                                                     textTheme:
//                                                         ButtonTextTheme.primary,
//                                                   ),
//                                                 ),
//                                                 child: child!,
//                                               );
//                                             },
//                                           ),
//                                           child: Container(
//                                             height: 40,
//                                             decoration: BoxDecoration(
//                                                 borderRadius:
//                                                     BorderRadius.circular(05),
//                                                 color:
//                                                     screenContainerbackgroundColor,
//                                                 border: Border.all(
//                                                     color: cBlack
//                                                         .withOpacity(0.4))),
//                                             width: double.infinity,
//                                             child: const Padding(
//                                               padding: EdgeInsets.all(8.0),
//                                               child: TextFontWidget(
//                                                   text: 'DD/MM/YYYY *',
//                                                   fontsize: 12.5),
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 )),
//                           ],
//                         ),
//                         Row(
//                           children: [
//                             Expanded(
//                               flex: 1,
//                               child: Padding(
//                                 padding: const EdgeInsets.only(
//                                     right: 20, left: 10, ),
//                                 child: TextFormFiledBlueContainerWidget(
//                                   hintText: "Enter User Name",
//                                   title: ' User Name',
//                                 ),
//                               ),
//                             ),
//                             Expanded(
//                               flex: 1,
//                               child: Padding(
//                                 padding: const EdgeInsets.only(
//                                     right: 20, left: 10, ),
//                                 child: TextFormFiledBlueContainerWidget(
//                                   hintText: "Enter User Password",
//                                   title: 'User Password',
//                                 ),
//                               ),
//                             ),
//                             Expanded(
//                               flex: 1,
//                               child: Padding(
//                                 padding: const EdgeInsets.only(
//                                     right: 20, left: 10, ),
//                                 child: TextFormFiledBlueContainerWidget(
//                                   hintText: "Confirm Password",
//                                   title: 'Confirm Password',
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only( left: 20),
//                           child: Container(
//                             height: 40,
//                             width: 200,
//                             decoration: BoxDecoration(
//                                 color: themeColorBlue,
//                                 border: Border.all(color: themeColorBlue),
//                                 borderRadius: BorderRadius.circular(05)),
//                             child: const Center(
//                               child: TextFontWidget(
//                                 text: "Create",
//                                 fontsize: 14,
//                                 // fontWeight: FontWeight.w600,
//                                 color: cWhite,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 )
//         ],
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('TextFormField Validation Error Alignment'),
//         ),
//         body: MyForm(),
//       ),
//     );
//   }
// }

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _textController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Enter text',
                contentPadding: EdgeInsets.only(top: 20.0), // Adjust top padding
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Form is valid, handle submission
                  // For example, you can print the entered text
                  print('Entered text: ${_textController.text}');
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
