import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:intl/intl.dart';
import 'package:vidyaveechi_website/controller/admin_section/student_controller/student_controller.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/constant/const.dart';
import 'package:vidyaveechi_website/view/constantvalidate.dart';
import 'package:vidyaveechi_website/view/fonts/google_poppins_widget.dart';
import 'package:vidyaveechi_website/view/users/super_admin/id_cards/assigning_process.dart';
import 'package:vidyaveechi_website/view/users/super_admin/id_cards/table.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';
import 'package:vidyaveechi_website/view/widgets/drop_DownList/schoolDropDownList.dart';

import '../../../../../controller/notification_controller/notification_Controller.dart';
import '../../../../controller/card_controller.dart';
import '../../../widgets/notification_color/notification_color_widget.dart';


class CardRegistration extends StatefulWidget {
  final StudentController cntrl = Get.put(StudentController());
    final NotificationController noticntrl = Get.put(NotificationController());
   
  CardRegistration({super.key});

  @override
  State<CardRegistration> createState() => _CardRegistrationState();
}

class _CardRegistrationState extends State<CardRegistration> {
  final String cardID = "";
  final String deviceID = "";
  final int timeStamp = 0;
  String studentId = '';

  late DatabaseReference databaseReference;
  late final dref = FirebaseDatabase.instance;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    databaseReference = dref.ref().child("test");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Card Registration"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //Text(cardID),
              //Text(deviceID),
              //Text(timeStamp.toString()),
          
              StreamBuilder(
                stream: FirebaseDatabase.instance.ref().child("json/uid").onValue,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final data = snapshot.data?.snapshot.value as Map?;
                    print(data);
                    if (data == null) {
                      return const Text('No data');
                    }
          
                    final cardId = data['cardId'];
                    final timestamp = data['ts'];
                    final deviceId = data['deviceId'];
          
                    var dt = DateTime.fromMillisecondsSinceEpoch(timestamp);
                    var input = DateFormat('hh:mm a').format(dt);
                    var time = DateFormat.yMMMMEEEEd().format(dt);
          
                    // device = deviceId;
                    // card = cardId;
                    // timeNow = time;
                    // NewPage(cardId: cardId, time: time, deviceId: deviceId);
          
                    //addDataToFirebase(cardId, deviceId, time);
          
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Expanded(
                        //   child: Padding(
                        //     padding: const EdgeInsets.only(right: 30),
                        //     child: Container(
                        //       child: const Column(
                        //         children: [
                        //           // ListTile(
                        //           //     leading: const Icon(Icons.circle),
                        //           //     title: GooglePoppinsWidgets(
                        //           //         text: 'Card Id', fontsize: 12),
                        //           //     subtitle: GooglePoppinsWidgets(
                        //           //         text: 'Card ID: $cardId',
                        //           //         fontsize: 18)),
                        //           // ListTile(
                        //           //     leading: const Icon(Icons.circle),
                        //           //     title: GooglePoppinsWidgets(
                        //           //         text: 'Time', fontsize: 12),
                        //           //     subtitle: GooglePoppinsWidgets(
                        //           //         text: 'TIME : $time \n $input',
                        //           //         fontsize: 18)),
                        //           // ListTile(
                        //           //     leading: const Icon(Icons.circle),
                        //           //     title: GooglePoppinsWidgets(
                        //           //         text: 'DeviceID', fontsize: 12),
                        //           //     subtitle: GooglePoppinsWidgets(
                        //           //         text: 'DeviceID: $deviceId',
                        //           //         fontsize: 18)),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        GestureDetector(
                          child: Container(height: 410,width: 350,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(width: 0.4),color: Colors.blue[100]),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GooglePoppinsWidgets(
                                      text: 'Assign cards for each students',
                                      fontsize: 14),
                                ),
                                sh10,
                                 Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GooglePoppinsWidgets(
                                      text: 'Select school',
                                      fontsize: 14),
                                ),
                                const GetSchoolListDropDownButton(),
                                sh10,

                                AdmissionNumberAssigning(),sh10,
                                 GooglePoppinsWidgets(text:'Card Id: $cardId',fontsize: 15,fontWeight: FontWeight.w600,),sw20,
                                GestureDetector(
                                  onTap: () async {
                                    addDataToFirebase(cardId, deviceId, time,input);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Container(
                                      height: 50,
                                      width: 200,
                                      decoration: BoxDecoration(
                                        color: adminePrimayColor,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child:
                                          const Center(child: Text("Register",style: TextStyle(color: cWhite),)),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Expanded(child: Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: GooglePoppinsWidgets(text: 'Here is the process to assign cards to each students by adding thier ad.no', fontsize: 12),
                                    )),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  }
                  if (snapshot.hasError) {
                    print(snapshot.error.toString());
                    return Text(snapshot.error.toString());
                  }
          



                  return const Text('....');
                },
              ),sh30,ListofCard()
            ],
          ),
        ),
        );
  }

  Future<void> addDataToFirebase(
      String cardId, String deviceId, String time,String input) async {
    final CardController cardController = Get.put(CardController());
    final String adnumber = cardController.admissionController.text;
    print(adnumber);

    await server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection('AllStudents')
        .get()
        .then((value) async {
      for (var i = 0; i < value.docs.length; i++) {
        if (adnumber == value.docs[i].data()['admissionNumber']) {
          print(true);
          server
              .collection('SchoolListCollection')
              .doc(UserCredentialsController.schoolId)
              .collection('AllStudents')
              .doc(value.docs[i].data()['docid'])
              .set({
            'CardId': cardId,
            'DeviceId': deviceId,
            'Time': time+input,
          }, SetOptions(merge: true));
          log(value.docs[i].data()['docid']);
           await saveDataToAllStudentsCollection(value.docs[i].data()['docid'], cardId, deviceId, time, input);

         // .then((value) => 
         
          
                          Get.find<NotificationController>().userparentNotification(
                parentID: value.docs[i].data()['parentId'],
                icon: cardNotifierSetup().icon,
                messageText:
                    'Your child ${value.docs[i].data()['studentName']  } is onboarded at ${time+input} ',
                headerText:
                    "Onboarding",
                whiteshadeColor: cardNotifierSetup().whiteshadeColor,
                containerColor: cardNotifierSetup().containerColor).then((value) => 
               showToast(msg: 'Card Registered'));
                print("${   value.docs[i].data()['parentId']     }");
        } else {
          print(false);
        }
      }
    });


  }

//   Future<void> addDataToFirebase(
//   String cardId, String deviceId, String time, String input) async {
//   final CardController cardController = Get.put(CardController());
//   final String adnumber = '000${cardController.onTapValue.value}';
//   print(adnumber);

//   await server
//       .collection('SchoolListCollection')
//       .doc(UserCredentialsController.schoolId)
//       .collection('AllStudents')
//       .get()
//       .then((value) async {
//     for (var i = 0; i < value.docs.length; i++) {
//       if (adnumber == value.docs[i].data()['admissionNumber']) {
//         await saveDataToAllStudentsCollection(value.docs[i].data(), cardId, deviceId, time, input);
//       } else {
//         print(false);
//       }
//     }
//   });
// }

Future<void> saveDataToAllStudentsCollection(
  String studentData, String cardId, String deviceId, String time, String input,) async {
  await server
      .collection('SchoolListCollection')
      .doc(UserCredentialsController.schoolId)
      .collection('CurrentStudentAttendance')
      .doc(studentData)
      .set({
    'CardId': cardId,
    'DeviceId': deviceId,
    'Time': time + input,
  }, SetOptions(merge: true)).then((value) {
    // Your additional operations here
    showToast(msg: 'Card Registered');
   // print("${studentData['parentId']}");
  });
}


  
}
