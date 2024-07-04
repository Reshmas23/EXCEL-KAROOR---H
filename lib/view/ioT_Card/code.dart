import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

final server = FirebaseFirestore.instance;
Stream<DocumentSnapshot> getAttendanceStream() {
  final a = server
      .collection('Attendance')
      .doc('MsRK8bvGM7hvpoXAvtbVo3KsB6H2')
      .snapshots();
  Stream<DocumentSnapshot> getAttendanceStream() {
    return server
        .collection('Attendance')
        .doc('MsRK8bvGM7hvpoXAvtbVo3KsB6H2')
        .snapshots()
        .transform(
      StreamTransformer.fromHandlers(
        handleData: (cardSnapshot, sink) {
          if (cardSnapshot.data()?['CardID'] != '') {
            sink.add(cardSnapshot);
          }
        },
      ),
    );
  }

  return a;
}

Future<void> swipeCard() async {
  await server
      .collection('Attendance')
      .doc('MsRK8bvGM7hvpoXAvtbVo3KsB6H2')
      .get()
      .then((value) async {
    var cardID = value.data()?['CardID'];
    if (cardID != '') {
      await fetchCardDataStudents(cardID: cardID);
    }
  });
}

Future<void> streamCard() async {
  print("calling");
  await server
      .collection('Attendance')
      .doc('MsRK8bvGM7hvpoXAvtbVo3KsB6H2')
      .get()
      .then((cardvalue) async {
    await fetchCardDataStudents(cardID: cardvalue.data()?['CardID']);
  });
}

Future<void> fetchCardDataStudents({required String cardID}) async {
  await server
      .collection('SchoolListCollection')
      .doc('MsRK8bvGM7hvpoXAvtbVo3KsB6H2')
      .collection('AllStudents')
      .get()
      .then((studentvalue) async {
    for (var i = 0; i < studentvalue.docs.length; i++) {
      if (studentvalue.docs[i].data()['cardID'] == cardID) {
        await fetchParents(
          parentID: studentvalue.docs[i].data()['parentId'],
          studentName: studentvalue.docs[i].data()['studentName'],
        );
      }
    }
  });
}

Future<void> fetchParents(
    {required String parentID, required String studentName}) async {
  await server
      .collection('SchoolListCollection')
      .doc('MsRK8bvGM7hvpoXAvtbVo3KsB6H2')
      .collection('AllUsersDeviceID')
      .doc(parentID)
      .get()
      .then((value) async {
    await sendPushMessage(
      value.data()?['devideID'],
      'Sir/Madam, your child $studentName was present on ${dateConvert(DateTime.now())} \n സർ/മാഡം, ${dateConvert(DateTime.now())} തീയതി ${timeConvert(DateTime.now())} നിങ്ങളുടെ കുട്ടി ഹാജരായി',
      'Attendence Notification from Lepton Schools',
    ).then((cardvalue) async {
      await server
          .collection('Attendance')
          .doc('MsRK8bvGM7hvpoXAvtbVo3KsB6H2')
          .update({'CardID': ''});
    });
  });
}

Future<void> sendPushMessage(String token, String body, String title) async {
  try {
    final reponse = await http.post(
      Uri.parse('https://fcm.googleapis.com/fcm/send'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization':
            'key=AAAAT5j1j9A:APA91bEDY97KTVTB5CH_4YTnLZEol4Z5fxF0fmO654V7YJO6dL9TV_PyIfv64-pVDx477rONsIl8d63VjxT793_Tj4zuGg32JTy_wUNQ4OhGNbr0KOS2i4z7JaG-ZtENTBpYnEGh-ZLg'
      },
      body: jsonEncode(
        <String, dynamic>{
          'priority': 'high',
          'data': <String, dynamic>{
            'click_action': 'FLUTTER_NOTIFICATION_CLICK',
            'status': 'done',
            'body': body,
            'title': title,
          },
          "notification": <String, dynamic>{
            'title': title,
            'body': body,
            'android_channel_id': 'high_importance_channel'
          },
          'to': token,
        },
      ),
    );
    log(reponse.body.toString());
  } catch (e) {
    if (kDebugMode) {
      log("error push Notification");
    }
  }
}

String dateConvert(DateTime dateTime) {
  String formattedDate = DateFormat('dd-MM-yyyy').format(dateTime);
  return formattedDate;
}

String timeConvert(DateTime date) {
  try {
    String formattedTime = DateFormat('hh:mm:a').format(date);
    return formattedTime;
  } catch (e) {
    // Handle any potential errors
    if (kDebugMode) {
      print('Error converting time: $e');
    }
  }
  return '';
}
