// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:vidyaveechi_website/view/colors/colors.dart';
// import 'package:vidyaveechi_website/view/fonts/google_poppins_widget.dart';
// import 'package:vidyaveechi_website/view/users/admin/screens/events/events.dart';
// import 'package:vidyaveechi_website/view/widgets/custom_showdialouge/custom_showdialouge.dart';
// import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';

// class Achievementviewwidget extends StatelessWidget {
//   const Achievementviewwidget({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         decoration: BoxDecoration(
//             // image: DecorationImage(image: AssetImage('webassets/images/arrangement-different-olympics-removebg-preview.png'),
//             // fit: BoxFit.fill),
//             borderRadius: BorderRadius.circular(10),
//             color: cWhite),
//         margin: const EdgeInsets.only(top: 10),
//         child: Row(
//           children: [
//             Expanded(
//               flex: ResponsiveWebSite.isMobile(context) ? 1 : 2,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   CircleAvatar(
//                     radius: ResponsiveWebSite.isMobile(context) ? 35 : 55,
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               flex: 4,
//               child: Padding(
//                 padding: const EdgeInsets.only(
//                   left: 20,
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(top: 10),
//                       child: GooglePoppinsWidgets(
//                           text: 'Student Name:Anu v', fontsize: 14),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 10),
//                       child: GooglePoppinsWidgets(
//                           text: 'Adm No:4251', fontsize: 14),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 10),
//                       child: GooglePoppinsWidgets(
//                           text: 'Date:10/00/0000', fontsize: 14),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 10, bottom: 10),
//                       child: GooglePoppinsWidgets(
//                           text: 'Achievement:10/00/0000', fontsize: 14),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(
//                           top: 10, left: 10, bottom: 10, right: 10),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         children: [
//                           Expanded(
//                               child: MaterialButton(
//                             onPressed: () {
//                               customShowDilogBox(
//                                   context: context,
//                                   title: 'Edit',
//                                   children: [
//                                     TextFormFiledBlueContainerWidgetEvent(
//                                         hintText: 'Enter Name',
//                                         title: 'Enter Name'),
//                                     TextFormFiledBlueContainerWidgetEvent(
//                                         hintText: 'Admission No.',
//                                         title: 'Admission No.'),
//                                     TextFormFiledBlueContainerWidgetEvent(
//                                         hintText: 'Date', title: 'Date'),
//                                     TextFormFiledBlueContainerWidgetEvent(
//                                         hintText: 'Achievment',
//                                         title: 'Achievment')
//                                   ],
//                                   doyouwantActionButton: true,
//                                   actiontext: 'Update');
//                             },
//                             color: adminePrimayColor,
//                             child: Text(
//                               'Edit',
//                               style: GoogleFonts.poppins(color: Colors.white),
//                             ),
//                           )),
//                           const SizedBox(
//                             width: 20,
//                           ),
//                           Expanded(
//                               child: MaterialButton(
//                             onPressed: () {
//                               customShowDilogBox(
//                                   context: context,
//                                   title: 'Delete',
//                                   children: [
//                                     GooglePoppinsWidgets(
//                                         text: 'Are you sure to want delete',
//                                         fontsize:
//                                             ResponsiveWebSite.isMobile(context)
//                                                 ? 12
//                                                 : 15)
//                                   ],
//                                   doyouwantActionButton: true);
//                             },
//                             color: Colors.red,
//                             child: Text(
//                               'Delete',
//                               style: GoogleFonts.poppins(color: Colors.white),
//                             ),
//                           ))
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ));
//   }
// }
