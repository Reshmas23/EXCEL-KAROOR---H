import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:open_document/my_files/init.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:vidyaveechi_website/controller/notification_controller/notification_Controller.dart';
import 'package:vidyaveechi_website/model/class_model/class_model.dart';
import 'package:vidyaveechi_website/model/fees_model/fees_model_controller.dart';
import 'package:vidyaveechi_website/model/student_model/student_model.dart';
import 'package:vidyaveechi_website/view/constant/const.dart';
import 'package:vidyaveechi_website/view/constant/constant.validate.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';
import 'package:vidyaveechi_website/view/widgets/notification_color/notification_color_widget.dart';

class FeesAndBillsController extends GetxController {
  RxList<ClassModel> allClassList = RxList<ClassModel>();
  RxList<ClassModel> selectedClassList = RxList<ClassModel>();
  RxBool selectAllClass = false.obs;
  Rx<ButtonState> buttonstate = ButtonState.idle.obs;
  RxBool ontapCreateFees = false.obs;
  RxBool ontapviewclasswiseFees = false.obs;
  RxInt classinitalFee = 0.obs;
  RxInt studentClassWiseCount = 0.obs;
  List<StudentModel> studentData = [];
  Future<int> fetchInitalClassFee(String classDocID) async {
    print("fetchInitalClassFee ....$classDocID");
    await server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection(UserCredentialsController.batchId!)
        .doc(UserCredentialsController.batchId!)
        .collection('classes')
        .doc(classDocID)
        .get()
        .then((value) async {
      classinitalFee.value = value.data()!['classfee'];
    });
    return classinitalFee.value;
  }

  Future<RxList<ClassModel>> fetchClass() async {
    allClassList.clear();
    selectedClassList.clear();

    final firebase = await server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection(UserCredentialsController.batchId!)
        .doc(UserCredentialsController.batchId!)
        .collection('classes')
        .get();

    for (var i = 0; i < firebase.docs.length; i++) {
      final list =
          firebase.docs.map((e) => ClassModel.fromMap(e.data())).toList();
      allClassList.add(list[i]);
    }
    return allClassList;
  }

  TextEditingController feestypeNameContoller = TextEditingController();
  TextEditingController feesContoller = TextEditingController();
  TextEditingController feesDueContoller = TextEditingController();
  Future<void> addCustomFessAsignToClass() async {
    final String docid = '${feestypeNameContoller.text}${uuid.v1()}';

    buttonstate.value = ButtonState.loading;
    final ClassFeesModel feesDetail = ClassFeesModel(
        docid: docid,
        feestypeName: feestypeNameContoller.text,
        fees: int.parse(feesContoller.text.trim()),
        createdDate: DateTime.now(),
        dueDate: DateTime.now()
            .add(Duration(days: int.parse(feesDueContoller.text.trim()))));
    try {
      for (var i = 0; i < selectedClassList.length; i++) {
        await server
            .collection('SchoolListCollection')
            .doc(UserCredentialsController.schoolId)
            .collection(UserCredentialsController.batchId!)
            .doc(UserCredentialsController.batchId!)
            .collection('classes')
            .doc(selectedClassList[i].docid)
            .collection("ClassFees")
            .doc(selectedFeeMonthContoller.text.trim())
            .set({'docid': selectedFeeMonthContoller.text.trim()}).then(
                (value) async {
          await feesCollection(
                  data: feesDetail,
                  docid: selectedFeeMonthContoller.text.trim(),
                  feeDocid: docid)
              .then((value) async {
            await getStudentClassWiseCount(
                selectedClassList[i].docid,
                selectedFeeMonthContoller.text.trim(),
                int.parse(feesContoller.text.trim()),
                docid);
          });
          await server
              .collection('SchoolListCollection')
              .doc(UserCredentialsController.schoolId)
              .collection(UserCredentialsController.batchId!)
              .doc(UserCredentialsController.batchId!)
              .collection('classes')
              .doc(selectedClassList[i].docid)
              .collection("ClassFees")
              .doc(selectedFeeMonthContoller.text.trim())
              .collection('StudentsFees')
              .doc(docid)
              .set(feesDetail.toMap());
        });
      }
                  feestypeNameContoller.clear();
            feesContoller.clear();
            selectAllClass.value=false;
            selectedClassList.clear();
            feesDueContoller.clear();
            seletedFeeDateContoller.clear();
            selectedFeeMonthContoller.clear();
            buttonstate.value = ButtonState.success;
            await Future.delayed(const Duration(seconds: 2)).then((vazlue) {
              buttonstate.value = ButtonState.idle;
            });
            Get.back();
            Get.back();
            selectedClassList.clear();
            allClassList.clear();
            showToast(msg: 'Fees Genrated Completed');
    } catch (e) {
      showToast(msg: 'Somthing went wrong please try again');
      buttonstate.value = ButtonState.fail;
      await Future.delayed(const Duration(seconds: 2)).then((value) {
        buttonstate.value = ButtonState.idle;
      });
      if (kDebugMode) {}
    }
  }

  Future<void> addFessAsignToClass() async {
    final String docid = '${feestypeNameContoller.text}${uuid.v1()}';

    buttonstate.value = ButtonState.loading;

    try {
      for (var i = 0; i < selectedClassList.length; i++) {
        final ClassFeesModel feesDetail = ClassFeesModel(
            docid: docid,
            feestypeName: feestypeNameContoller.text,
            fees: classinitalFee.value,
            createdDate: DateTime.now(),
            dueDate: DateTime.now()
                .add(Duration(days: int.parse(feesDueContoller.text.trim()))));

        await fetchInitalClassFee(selectedClassList[i].docid)
            .then((value) async {
          feesDetail.fees = classinitalFee.value;

          await server
              .collection('SchoolListCollection')
              .doc(UserCredentialsController.schoolId)
              .collection(UserCredentialsController.batchId!)
              .doc(UserCredentialsController.batchId!)
              .collection('classes')
              .doc(selectedClassList[i].docid)
              .collection("ClassFees")
              .doc(selectedFeeMonthContoller.text.trim())
              .set({'docid': selectedFeeMonthContoller.text.trim()}).then(
                  (value) async {
            await server
                .collection('SchoolListCollection')
                .doc(UserCredentialsController.schoolId)
                .collection(UserCredentialsController.batchId!)
                .doc(UserCredentialsController.batchId!)
                .collection('classes')
                .doc(selectedClassList[i].docid)
                .collection("ClassFees")
                .doc(selectedFeeMonthContoller.text.trim())
                .collection('StudentsFees')
                .doc(docid)
                .set(feesDetail.toMap());
          }).then((value) async {
            await feesCollection(
                    data: feesDetail,
                    feeDocid: docid,
                    docid: selectedFeeMonthContoller.text.trim())
                .then((value) async {
              await getStudentClassWiseCount(
                  selectedClassList[i].docid,
                  selectedFeeMonthContoller.text.trim(),
                  classinitalFee.value,
                  docid);
            });
          });
        });
      }
      feestypeNameContoller.clear();
      feesContoller.clear();
             selectAllClass.value=false;
            selectedClassList.clear();
      feesDueContoller.clear();
      seletedFeeDateContoller.clear();
      selectedFeeMonthContoller.clear();
      buttonstate.value = ButtonState.success;
      await Future.delayed(const Duration(seconds: 2)).then((vazlue) {
        buttonstate.value = ButtonState.idle;
      });
      Get.back();
      Get.back();
      selectedClassList.clear();
      allClassList.clear();

      showToast(msg: 'Fees Genrated Completed');
    } catch (e) {
      showToast(msg: 'Somthing went wrong please try again');
      buttonstate.value = ButtonState.fail;
      await Future.delayed(const Duration(seconds: 2)).then((value) {
        buttonstate.value = ButtonState.idle;
      });
      if (kDebugMode) {}
    }
  }

  TextEditingController seletedFeeDateContoller = TextEditingController();
  TextEditingController selectedFeeMonthContoller = TextEditingController();
  final Rxn<DateTime> _selectedFeeDate = Rxn<DateTime>();
  final Rxn<DateTime> _selectedMonth = Rxn<DateTime>();
  selectMonth(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedMonth.value ?? DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2100),
      // builder: (context, child) {},
    );
    if (picked != null) {
      _selectedMonth.value = picked;
      DateTime parseDate = DateTime.parse(_selectedMonth.value.toString());
      final DateFormat formatter = DateFormat('dd-MM-yyyy');
      String formatted = formatter.format(parseDate);

      selectedFeeMonthContoller.text = formatted.toString();
    }
  }

  selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedFeeDate.value ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      _selectedFeeDate.value = picked;
      DateTime parseDate = DateTime.parse(_selectedFeeDate.value.toString());
      final DateFormat formatter = DateFormat('dd-MM-yyyy');
      String formatted = formatter.format(parseDate);

      seletedFeeDateContoller.text = formatted.toString();
    }
  }

  Future<void> feesCollection(
      {required ClassFeesModel data,
      required String docid,
      required String feeDocid}) async {
    await server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection(UserCredentialsController.batchId!)
        .doc(UserCredentialsController.batchId!)
        .collection('FeesCollection')
        .doc(docid)
        .set({'docid': docid}, SetOptions(merge: true));
    await server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection(UserCredentialsController.batchId!)
        .doc(UserCredentialsController.batchId!)
        .collection('FeesCollection')
        .doc(docid)
        .collection(docid)
        .doc(feeDocid)
        .set(data.toMap(), SetOptions(merge: true));
  }

  Future<void> getStudentClassWiseCount(String classDocID,
      String feeCollectionID, int fee, String dataDocID) async {
        studentData.clear();

    await server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection(UserCredentialsController.batchId!)
        .doc(UserCredentialsController.batchId!)
        .collection('classes')
        .doc(classDocID)
        .collection('Students')
        .get()
        .then((value) async {
                  final list =
            value.docs.map((e) => StudentModel.fromMap(e.data())).toList();
        studentData.addAll(list);
      for (var i = 0; i < value.docs.length; i++) {
        print('Student names ${value.docs[i].data()['studentemail']}');

        // final StudentModel list = StudentModel(
        //     admissionNumber: value.docs[i].data()['admissionNumber'],
        //     alPhoneNumber: value.docs[i].data()['alPhoneNumber'],
        //     bloodgroup: value.docs[i].data()['bloodgroup'],
        //     classId: value.docs[i].data()['classId'],
        //     createDate: value.docs[i].data()['createDate'],
        //     dateofBirth: value.docs[i].data()['dateofBirth'],
        //     district: value.docs[i].data()['district'],
        //     docid: value.docs[i].data()['docid'],
        //     gender: value.docs[i].data()['gender'],
        //     guardianId: value.docs[i].data()['guardianId'],
        //     houseName: value.docs[i].data()['houseName'],
        //     parentId: value.docs[i].data()['parentId'],
        //     parentPhoneNumber: value.docs[i].data()['parentPhoneNumber'],
        //     place: value.docs[i].data()['place'],
        //     profileImageId: value.docs[i].data()['profileImageId'],
        //     profileImageUrl: value.docs[i].data()['profileImageUrl'],
        //     studentName: value.docs[i].data()['studentName'],
        //     password: value.docs[i].data()['password'],
        //     studentemail: value.docs[i].data()['studentemail'],
        //     userRole: value.docs[i].data()['userRole']);

        await server
            .collection('SchoolListCollection')
            .doc(UserCredentialsController.schoolId)
            .collection(UserCredentialsController.batchId!)
            .doc(UserCredentialsController.batchId!)
            .collection('FeesCollection')
            .doc(feeCollectionID)
            .collection(feeCollectionID)
            .doc(dataDocID)
            .collection('Students')
            .doc(studentData[i].docid)
            .set({
          'docid': studentData[i].docid,
          'StudentName': studentData[i].studentName,
          'fee': fee,
          'feepaid': false,
          'classID': studentData[i].classId,
          'paid': 0,
          'editFee': false,
        }, SetOptions(merge: true));
      }
    }).then((value) async {
      await getFeeTotalAmount(feeCollectionID, fee, dataDocID);
    });
  }

  Future<void> getFeeTotalAmount(
    String feeCollectionID,
    int fee,
    String dateDocID,
  ) async {
    await server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection(UserCredentialsController.batchId!)
        .doc(UserCredentialsController.batchId!)
        .collection('FeesCollection')
        .doc(feeCollectionID)
        .collection(feeCollectionID)
        .doc(dateDocID)
        .collection('Students')
        .get()
        .then((value) async {
      await server
          .collection('SchoolListCollection')
          .doc(UserCredentialsController.schoolId)
          .collection(UserCredentialsController.batchId!)
          .doc(UserCredentialsController.batchId!)
          .collection('FeesCollection')
          .doc(feeCollectionID)
          .collection(feeCollectionID)
          .doc(dateDocID)
          .set({
        'totalStudents': value.docs.length,
        'totalAmount': fee * value.docs.length,
        'collectedAmount': 0,
        'pendingAmount': 0,
      }, SetOptions(merge: true));
    });
  }

  RxList feeMonthList = [].obs;
  RxList feeDateList = [].obs;

  RxString feeMonthDatadowpdown = 'd'.obs;
  RxString feeMonthData = 'd'.obs;
  RxString feeDateData = 'd'.obs;
  RxString feetypeName = ''.obs;
  RxString feeDueDateName = ''.obs;
  RxBool feessendingMessage = false.obs;

  Future<List> fetchFeeMonthData() async {
    await server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection(UserCredentialsController.batchId!)
        .doc(UserCredentialsController.batchId!)
        .collection('FeesCollection')
        .get()
        .then((value) async {
      for (var i = 0; i < value.docs.length; i++) {
        feeMonthList.add(value.docs[i]['docid']);
      }
    });
    return feeMonthList;
  }

  Future<List> fetchFeeDateData() async {
    await server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection(UserCredentialsController.batchId!)
        .doc(UserCredentialsController.batchId!)
        .collection('FeesCollection')
        .doc(feeMonthData.value)
        .collection(feeMonthData.value)
        .get()
        .then((value) async {
      for (var i = 0; i < value.docs.length; i++) {
        feeDateList.add(value.docs[i]['docid']);
      }
    });
    return feeDateList;
  }

  pendingAmountCalculate(String dateDocID) async {
    int paidFee = 0;

    int studenttotalAmount = 0;

    await server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection(UserCredentialsController.batchId!)
        .doc(UserCredentialsController.batchId!)
        .collection('FeesCollection')
        .doc(feeMonthData.value)
        .collection(feeMonthData.value)
        .doc(dateDocID)
        .collection('Students')
        .get()
        .then((value) async {
      for (var i = 0; i < value.docs.length; i++) {
        final int totaladdesult = value.docs[i].data()['paid'];

        studenttotalAmount = studenttotalAmount + totaladdesult;
      }

      paidFee = studenttotalAmount;
      await server
          .collection('SchoolListCollection')
          .doc(UserCredentialsController.schoolId)
          .collection(UserCredentialsController.batchId!)
          .doc(UserCredentialsController.batchId!)
          .collection('FeesCollection')
          .doc(feeMonthData.value)
          .collection(feeMonthData.value)
          .doc(dateDocID)
          .get()
          .then((value) async {
        int totalAmount = value.data()?['totalAmount'] ?? 0;
        int result = totalAmount - paidFee;

        await server
            .collection('SchoolListCollection')
            .doc(UserCredentialsController.schoolId)
            .collection(UserCredentialsController.batchId!)
            .doc(UserCredentialsController.batchId!)
            .collection('FeesCollection')
            .doc(feeMonthData.value)
            .collection(feeMonthData.value)
            .doc(dateDocID)
            .update({'pendingAmount': result});
      });

      // .update({'totalAmount': totalResult.value});
    });
  }

  int initialFeeResult = 0;
  int totalResult = 0;

  bugCalculateTotalamount(String dateDocID, int totalStudent) async {
    int totalAmount = 0;
    await server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection(UserCredentialsController.batchId!)
        .doc(UserCredentialsController.batchId!)
        .collection('FeesCollection')
        .doc(feeMonthData.value)
        .collection(feeMonthData.value)
        .doc(dateDocID)
        .collection('Students')
        .get()
        .then((value) async {
      for (var i = 0; i < value.docs.length; i++) {
        final int totaladdesult = value.docs[i].data()['fee'];

        totalAmount = totalAmount + totaladdesult;
      }

      totalResult = totalAmount;

      await server
          .collection('SchoolListCollection')
          .doc(UserCredentialsController.schoolId)
          .collection(UserCredentialsController.batchId!)
          .doc(UserCredentialsController.batchId!)
          .collection('FeesCollection')
          .doc(feeMonthData.value)
          .collection(feeMonthData.value)
          .doc(dateDocID)
          .update({'totalAmount': totalResult});
    });
  }

  collectedAmountCalculate(String dateDocID) async {
    int collectedFee = 0;

    int totalAmount = 0;

    await server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection(UserCredentialsController.batchId!)
        .doc(UserCredentialsController.batchId!)
        .collection('FeesCollection')
        .doc(feeMonthData.value)
        .collection(feeMonthData.value)
        .doc(dateDocID)
        .collection('Students')
        .get()
        .then((value) async {
      for (var i = 0; i < value.docs.length; i++) {
        final int totaladdesult = value.docs[i].data()['paid'];

        totalAmount = totalAmount + totaladdesult;
      }

      collectedFee = totalAmount;
      await server
          .collection('SchoolListCollection')
          .doc(UserCredentialsController.schoolId)
          .collection(UserCredentialsController.batchId!)
          .doc(UserCredentialsController.batchId!)
          .collection('FeesCollection')
          .doc(feeMonthData.value)
          .collection(feeMonthData.value)
          .doc(dateDocID)
          .get()
          .then((value) async {
        await server
            .collection('SchoolListCollection')
            .doc(UserCredentialsController.schoolId)
            .collection(UserCredentialsController.batchId!)
            .doc(UserCredentialsController.batchId!)
            .collection('FeesCollection')
            .doc(feeMonthData.value)
            .collection(feeMonthData.value)
            .doc(dateDocID)
            .update({'collectedAmount': collectedFee});
      });

      // .update({'totalAmount': totalResult.value});
    });
  }

  RxString currentStudentFee = ''.obs;
  RxBool sendMessageForUnPaidStudentandParentsbool = false.obs;
  Future<void> sendMessageForUnPaidStudentandParents() async {
    await server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection(UserCredentialsController.batchId!)
        .doc(UserCredentialsController.batchId!)
        .collection('FeesCollection')
        .doc(feeMonthData.value)
        .collection(feeMonthData.value)
        .doc(feeDateData.value)
        .collection('Students')
        .get()
        .then((value) async {
      showToast(msg: "Please wait while a sec ...");
      for (var i = 0; i < value.docs.length; i++) {
        int studentFee = value.docs[i]['fee'];
        if (value.docs[i]['feepaid'] == false) {
          server
              .collection('SchoolListCollection')
              .doc(UserCredentialsController.schoolId)
              .collection('AllStudents')
              .doc(value.docs[i]['docid'])
              .get()
              .then((value) async {
            Get.find<NotificationController>().userStudentNotification(
                studentID: value['docid'],
                icon: WarningNotifierSetup().icon,
                messageText:
                    'Your ${Get.find<FeesAndBillsController>().feetypeName.value} rupees $studentFee /- is due on ${stringTimeToDateConvert(Get.find<FeesAndBillsController>().feeDueDateName.value)} ,Please pay on or before the due date.\nനിങ്ങളുടെ ${Get.find<FeesAndBillsController>().feetypeName.value} ആയ $studentFee /- രൂപ, ദയവായി ${stringTimeToDateConvert(Get.find<FeesAndBillsController>().feeDueDateName.value)} തിയതിക്കുള്ളിൽ അടക്കേണ്ടതാണ്',
                // ,
                headerText:
                    "${Get.find<FeesAndBillsController>().feetypeName.value} Due Fee",
                whiteshadeColor: WarningNotifierSetup().whiteshadeColor,
                containerColor: WarningNotifierSetup().containerColor);

            Get.find<NotificationController>().userparentNotification(
                parentID: value['parentId'],
                icon: WarningNotifierSetup().icon,
                messageText:
                    'Your ${Get.find<FeesAndBillsController>().feetypeName.value} rupees $studentFee /- is due on ${stringTimeToDateConvert(Get.find<FeesAndBillsController>().feeDueDateName.value)} ,Please pay on or before the due date.\nനിങ്ങളുടെ ${Get.find<FeesAndBillsController>().feetypeName.value} ആയ $studentFee /- രൂപ, ദയവായി ${stringTimeToDateConvert(Get.find<FeesAndBillsController>().feeDueDateName.value)} തിയതിക്കുള്ളിൽ അടക്കേണ്ടതാണ്',
                headerText:
                    "${Get.find<FeesAndBillsController>().feetypeName.value} Due Fee",
                whiteshadeColor: WarningNotifierSetup().whiteshadeColor,
                containerColor: WarningNotifierSetup().containerColor);
          });
        }
      }
    }).then((value) {
      showToast(msg: "Notification Sended !!");
      sendMessageForUnPaidStudentandParentsbool.value = false;
    });
  }
}