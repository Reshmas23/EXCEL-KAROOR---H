import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:vidyaveechi_website/model/class_model/class_model.dart';
import 'package:vidyaveechi_website/model/student_model/student_model.dart';
import 'package:vidyaveechi_website/view/constant/const.dart';
import 'package:vidyaveechi_website/view/ioT_Card/model/cardStudentModel.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';

class IoTCardController extends GetxController {
  Rx<ButtonState> buttonstate = ButtonState.idle.obs;
  RxString className = ''.obs;
  RxString classId = ''.obs;
  RxString classDocID = 'dd'.obs;
  RxString studentName = ''.obs;
  RxString studentDocID = ''.obs;
  RxString schoolDocID = 'dd'.obs;
  RxString batchDocID = ''.obs;
  RxString cardID = ''.obs;

  RxInt classStudentCount = 0.obs;
  RxBool classTaped = false.obs;
  RxBool dataFetchFinished = false.obs;
  List<StudentModel> registudentList = [];
  List<StudentModel> classStudentList = [];
  Future<void> registerCardForStudent() async {
    try {
      print("Started >>>>>>>>");
      await server
          .collection('StudentRegistration')
          .doc('CardData')
          .get()
          .then((cardvalue) async {
        cardList.add(cardvalue.data()?['CardID']);
        comapareDuplicateCards().then((value) async {
          final StudentModel student = classStudentList[0];
          print('Student $student');
          server
              .collection('SchoolListCollection')
              .doc(schoolDocID.value)
              .collection('AllStudents')
              .doc(student.docid)
              .set({'cardID': cardList[0], 'cardTaken': true},
                  SetOptions(merge: true)).then((value) async {
            classStudentList[0].cardID = cardList[0];
            await server
                .collection('SchoolListCollection')
                .doc(schoolDocID.value)
                .collection(batchDocID.value)
                .doc(batchDocID.value)
                .collection('classes')
                .doc(classDocID.value)
                .collection('Students')
                .doc(student.docid)
                .set({'cardID': cardList[0], 'cardTaken': true},
                    SetOptions(merge: true)).then((value) async {
              await server
                  .collection('StudentRegistration')
                  .doc('CardData')
                  .update({'CardID': ''}).then((value) async {
                registudentList.add(student);

                classStudentList.clear();
                cardList.clear();
                fetchClassAllStudents();
                buttonstate.value = ButtonState.success;
                await Future.delayed(const Duration(seconds: 2)).then((vazlue) {
                  buttonstate.value = ButtonState.idle;
                });
              });
            });
          });
        });
      });
    } catch (e) {
      showToast(msg: 'Somthing went wrong please try again');
      buttonstate.value = ButtonState.fail;
      await Future.delayed(const Duration(seconds: 2)).then((value) {
        buttonstate.value = ButtonState.idle;
      });
      if (kDebugMode) {
        log(e.toString());
      }
    }
  }

  Stream<List<StudentModel>> fetchClassAllStudents() async* {
    dataFetchFinished.value = false;

    try {
      await server
          .collection('SchoolListCollection')
          .doc(schoolDocID.value)
          .collection(batchDocID.value)
          .doc(batchDocID.value)
          .collection('classes')
          .doc(classDocID.value)
          .collection('Students')
          .get()
          .then((value) async {
        for (var i = 0; i < value.docs.length; i++) {
          if (value.docs[i].data()['cardID'] == '') {
            final StudentModel student =
                StudentModel.fromMap(value.docs[i].data());
            classStudentList.add(student);
          }
        }
        classTaped.value = false;
        dataFetchFinished.value = true;
      });

      yield classStudentList;
    } catch (error) {
      print('Error fetching students: $error');
    }

    // Close the stream controller when done
  }

  Future<void> fetchSchoolData() async {
    await server
        .collection('SchoolListCollection')
        .get()
        .then((schoolListCollectionvalue) {
      for (var i = 0; i < schoolListCollectionvalue.docs.length; i++) {
        server
            .collection('SchoolListCollection')
            .doc(schoolListCollectionvalue.docs[0].data()['docid'])
            .get()
            .then((datavalue) async {
          schoolDocID.value = datavalue.data()?['docid'];
          batchDocID.value = datavalue.data()?['batchYear'];
        });
      }
    });
  }

  List<CardStudentModel> allStudentList = [];
  List<String> cardList = [];
  Future<void> getAllCardID() async {
    await server
        .collection('SchoolListCollection')
        .doc(schoolDocID.value)
        .collection('AllStudents')
        .get()
        .then((value) async {
      for (var i = 0; i < value.docs.length; i++) {
        final CardStudentModel result = CardStudentModel(
            docid: value.docs[i].data()['docid'],
            cardID: value.docs[i].data()['cardID'] ?? '',
            studentName: value.docs[i].data()['studentName'],
            admissionNumber: value.docs[i].data()['admissionNumber']);
        allStudentList.add(result);
      }
    });
  }

  Future<void> comapareDuplicateCards() async {
    log('comapareDuplicateCards');
    cardList.removeWhere((element) {
      return allStudentList.any((serverStudent) {
        if (serverStudent.cardID == element) {
          showToast(msg: '${serverStudent.cardID} Card ID Already Founded ❌');
        }
        return serverStudent.cardID == element;
      });
    });
  }

  Future<void> cardAsignToStudent(
    String studentID,
  ) async {
    cardList.clear();
    await server
        .collection('StudentRegistration')
        .doc('CardData')
        .get()
        .then((value) async {
      cardList.add(value.data()?['CardID']);
    }).then((value) async {
      print("studentID $studentID");
      print("CardList $cardList");
      await server
          .collection('SchoolListCollection')
          .doc(schoolDocID.value)
          .collection(batchDocID.value)
          .doc(batchDocID.value)
          .collection('classes')
          .doc(classDocID.value)
          .collection('Students')
          .doc(studentID)
          .get()
          .then((studentData) {
        if (studentData.data()?['cardID'] == '') {
          print("cardID=='' $studentID");
          server
              .collection('SchoolListCollection')
              .doc(schoolDocID.value)
              .collection('AllStudents')
              .doc(studentID)
              .set({'cardID': cardList[0], 'cardTaken': true},
                  SetOptions(merge: true)).then((value) async {
            await server
                .collection('SchoolListCollection')
                .doc(schoolDocID.value)
                .collection(batchDocID.value)
                .doc(batchDocID.value)
                .collection('classes')
                .doc(classDocID.value)
                .collection('Students')
                .doc(studentID)
                .set({'cardID': cardList[0], 'cardTaken': true},
                    SetOptions(merge: true)).then((value) async {
              await server
                  .collection('StudentRegistration')
                  .doc('CardData')
                  .update({'CardID': ''}).then((value) async {
                cardList.clear();
                allStudentList.clear();
              });
            });
          });
        }
      });
    });
  }

  List<ClassModel> allclassList = [];
  Future<List<ClassModel>> fetchClass() async {
    final firebase = await server
        .collection('SchoolListCollection')
        .doc(schoolDocID.value)
        .collection(batchDocID.value)
        .doc(batchDocID.value)
        .collection('classes')
        .get();

    for (var i = 0; i < firebase.docs.length; i++) {
      final list =
          firebase.docs.map((e) => ClassModel.fromMap(e.data())).toList();
      allclassList.add(list[i]);
      allclassList.sort((a, b) => a.className.compareTo(b.className));
    }
    return allclassList;
  }

  @override
  void onReady() async {
    await fetchSchoolData();
    super.onReady();
  }
}
