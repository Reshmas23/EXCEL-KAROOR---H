import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:vidyaveechi_website/model/teacher_model/teacher_model.dart';
import 'package:vidyaveechi_website/view/constant/const.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';

class TeacherController extends GetxController {
  RxBool teacherAttendeceOnTap = false.obs;
  RxBool teacherAttendeceMonthWiswOnTap = false.obs;
  TextEditingController teacherNameController = TextEditingController();
  TextEditingController teacherPhoneNumeber = TextEditingController();
  TextEditingController teacherIDController = TextEditingController();
  Rx<ButtonState> buttonstate = ButtonState.idle.obs;
  final Rx<String> dateofbithController = ''.obs;
  final Rx<String> gender = ''.obs;
  final Rx<String> subject = ''.obs;
  final Rxn<DateTime> selectedDOB = Rxn<DateTime>();
  RxBool ontapTeacher = false.obs;
  RxString dobSelectedDate = ''.obs;
  RxString joiningSelectedDate = ''.obs;
  RxBool ontapviewteacher = false.obs;
  Rxn<TeacherModel> teacherModelData = Rxn<TeacherModel>();
  final formKey = GlobalKey<FormState>();

//......................  Add teacher Section

  RxBool automaticmail = false.obs;

  final _firebase = server
      .collection('SchoolListCollection')
      .doc(UserCredentialsController.schoolId);

  

  Future<void> createNewTeacher(TeacherModel teacherModel) async {
    buttonstate.value = ButtonState.loading;
    try {
      await _firebase
          .collection('TempTeacherList')
          .add(teacherModel.toMap())
          .then((value) async {
        await _firebase
            .collection('TempTeacherList')
            .doc(value.id)
            .update({"docid": value.id}).then(
          (value) {
            showToast(msg: "Successfully Created");
            clearFields();
          },
        );
      });
      buttonstate.value = ButtonState.success;
      await Future.delayed(const Duration(seconds: 2)).then((vazlue) {
        buttonstate.value = ButtonState.idle;
      });
    } catch (e) {
      showToast(msg: "Teacher Creation Failed");
      buttonstate.value = ButtonState.fail;
      await Future.delayed(const Duration(seconds: 2)).then((value) {
        buttonstate.value = ButtonState.idle;
      });
      log("Error .... $e");
    }
  }

  removeTeacher(BuildContext context, String teacherID) async {
    if (UserCredentialsController.schoolId == serverAuth.currentUser!.uid) {
      return showDialog(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back)),
                const Text('Alert'),
              ],
            ),
            content: const SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(
                      'By removing a teacher, you are deleting all the details associated with that teacher. Are you sure to proceed?')
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () async {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Ok'),
                onPressed: () {
                  _firebase
                      .collection('Teachers')
                      .doc(teacherID)
                      .delete()
                      .then((value) {
                    showToast(msg: "Removed");
                    Navigator.of(context).pop();
                  });
                },
              ),
            ],
          );
        },
      );
    } else {
      return showDialog(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Alert'),
            content: const SingleChildScrollView(
              child: ListBody(
                children: <Widget>[Text('Sorry you have no access to delete')],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  selectToDateofBirth(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDOB.value ?? DateTime.now(),
      firstDate: DateTime(1920),
      lastDate: DateTime(2030),
      // builder: (context, child) {
      //   return Container();
      // },
    );
    if (picked != null && picked != selectedDOB.value) {
      selectedDOB.value = picked;
      DateTime parseDate = DateTime.parse(selectedDOB.value.toString());
      final DateFormat formatter = DateFormat('yyyy-MMMM-dd');
      String formatted = formatter.format(parseDate);

      dateofbithController.value = formatted.toString();
      log(formatted.toString());
    }
  }

  void clearFields() {
    teacherNameController.clear();
    teacherPhoneNumeber.clear();
    teacherIDController.clear();
  }

  RxString attendenceTeacherDocID = 'dd'.obs;
  RxString selectedMonthView = 'dds'.obs;
  RxList teacherAttendeceMonthList = [].obs;

  Future<List> fetchTeacherAttenceMonthfunction() async {
    try {
      await server
          .collection('SchoolListCollection')
          .doc(UserCredentialsController.schoolId)
          .collection(UserCredentialsController.batchId!)
          .doc(UserCredentialsController.batchId!)
          .collection('TeacherAttendence')
          .doc(attendenceTeacherDocID.value)
          .collection('MonthWiseAttendence')
          .get()
          .then((value) {
        for (var i = 0; i < value.docs.length; i++) {
          teacherAttendeceMonthList.add(value.docs[i].data()['docid']);
        }
      });
    } catch (e) {
      log(e.toString());
    }

    return teacherAttendeceMonthList;
  }
}
