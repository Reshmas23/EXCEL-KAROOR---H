import 'dart:developer';
import 'dart:html' as html;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vidyaveechi_website/controller/batch_yearController/batch_year_Controller.dart';
import 'package:vidyaveechi_website/controller/class_controller/class_controller.dart';
import 'package:vidyaveechi_website/model/parent_model/parent_model.dart';
import 'package:vidyaveechi_website/model/student_model/student_model.dart';
import 'package:vidyaveechi_website/model/teacher_model/teacher_model.dart';
import 'package:vidyaveechi_website/view/constant/const.dart';
import 'package:vidyaveechi_website/view/constant/constant.validate.dart';
import 'package:vidyaveechi_website/view/drop_down/user_login/select_class.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/splash_screen/splash_screen.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';
import 'package:vidyaveechi_website/view/utils/utils.dart';
import 'package:vidyaveechi_website/view/widgets/custom_showdialouge/custom_showdialouge.dart';
import 'package:vidyaveechi_website/view/widgets/drop_DownList/schoolDropDownList.dart';

import '../../view/drop_down/user_login/batch_year.dart';
import '../../view/users/teacher/teachers_home.dart';

class UserLoginController extends GetxController {
  final classCtrl = Get.put(ClassController());
  final batchCtrl = Get.put(BatchYearController());
  final GlobalKey<FormState> _secondFormkey = GlobalKey<FormState>();
  late AnimationController animationctr;
  late Animation colorAnimation;

  RxBool loginontapped = false.obs;
  RxBool lodingContainer = false.obs;
  RxBool isLoading = RxBool(false);

  RxString userUID = ''.obs;
  final TextEditingController userEmailIDController = TextEditingController();
  final TextEditingController userPasswordController = TextEditingController();
  String batchID = '';
  late String? schoolID = schoolListValue?['docid'];
  late String? schoolName = schoolListValue?['schoolName'] ?? '';

  Future<bool> secondaryAdminLogin() async {
    //....... .......................................Secondary Admin Login Function
    try {
      final user =
          await server.collection('SchoolListCollection').doc(schoolID).get();
      await serverAuth
          .signInWithEmailAndPassword(
              email: userEmailIDController.text.trim(),
              password: userPasswordController.text.trim())
          .then((value) async {
        await SharedPreferencesHelper.setString(
            SharedPreferencesHelper.currentUserDocid, value.user!.uid);
        final result = await server
            .collection('SchoolListCollection')
            .doc(schoolID)
            .collection('Admins')
            .where('docid', isEqualTo: userUID.value)
            .get();
        if (result.docs.isNotEmpty) {
          await SharedPreferencesHelper.setString(
              SharedPreferencesHelper.userRoleKey, 'admin');
          await SharedPreferencesHelper.setString(
              SharedPreferencesHelper.schoolIdKey, schoolID!);
          await SharedPreferencesHelper.setString(
              SharedPreferencesHelper.schoolNameKey, schoolName!);
          await SharedPreferencesHelper.setString(
                  SharedPreferencesHelper.batchIdKey, user.data()?['batchYear'])
              .then((value) async {
            batchID = user.data()?['batchYear'];
            logined.value = true;
            userEmailIDController.clear();
            userPasswordController.clear();
            Get.offAll(() => SplashScreen());
          });
        } else if (result.docs.isEmpty) {
          showToast(msg: "Admin login failed");
        } else {
          showToast(msg: "Secondary-Admin login failed");
        }
      }).catchError((error) {
        if (error is FirebaseAuthException) {
          isLoading.value = false;
          handleFirebaseError(error);
        }
      });
    } catch (e) {
      log(e.toString());
      showToast(msg: "Secondary-Admin login failed");
    }
    return true;
  }

  Future<void> adminLoginController(BuildContext context) async {
    loginontapped.value = true;

    //....... ........................................Admin  Login Function
    try {
      final user =
          await server.collection('SchoolListCollection').doc(schoolID).get();
      await serverAuth
          .signInWithEmailAndPassword(
              email: userEmailIDController.text.trim(),
              password: userPasswordController.text.trim())
          .then((value) async {
        await SharedPreferencesHelper.setString(
            SharedPreferencesHelper.currentUserDocid, value.user!.uid);
        log("Admin ID $userUID");
        log("schoolID ID $schoolID");
        userUID.value = value.user!.uid;
        if (user.data()?['batchYear'] == '') {
          setBatchYear(context);
        } else {
          if (userUID.value == schoolID) {
            await SharedPreferencesHelper.setString(
                SharedPreferencesHelper.userRoleKey, 'admin');
            await SharedPreferencesHelper.setString(
                SharedPreferencesHelper.schoolIdKey, schoolID!);
            await SharedPreferencesHelper.setString(
                SharedPreferencesHelper.schoolNameKey, schoolName!);
            await SharedPreferencesHelper.setString(
                    SharedPreferencesHelper.batchIdKey,
                    user.data()!['batchYear'])
                .then((value) async {
              log("SchoolID :  ${UserCredentialsController.schoolId}");
              log("BatchID :  ${UserCredentialsController.batchId}");
              log("userrole :  ${UserCredentialsController.userRole}");
              batchID = user.data()?['batchYear'];

              userEmailIDController.clear();
              userPasswordController.clear();
              logined.value = true;
              Get.offAll(() => SplashScreen());
            });
          } else {
            await secondaryAdminLogin();
          }
        }
      }).catchError((error) {
        if (error is FirebaseAuthException) {
          isLoading.value = false;
          handleFirebaseError(error);
        }
      });
    } catch (e) {
      log(e.toString());
      showToast(msg: "School Login failed !!");
    }
  }

  Future<void> teacherLoginController() async {
    //....... ........................................teacher  Login Function

    try {
      serverAuth
          .signInWithEmailAndPassword(
              email: userEmailIDController.text.trim(),
              password: userPasswordController.text.trim())
          .then((value) async {
        final result = await server
            .collection('SchoolListCollection')
            .doc(schoolID)
            .collection('Teachers')
            .where('docid', isEqualTo: userUID.value)
            .get();
        if (result.docs.isNotEmpty) {
          userEmailIDController.clear();
          userPasswordController.clear();
          Get.offAll(() => const TeachersHomeScreen());
        } else if (result.docs.isEmpty) {
          showToast(msg: "No Results Found !!");
        } else {
          showToast(msg: "Login failed");
        }
      }).catchError((error) {
        if (error is FirebaseAuthException) {
          isLoading.value = false;
          handleFirebaseError(error);
        }
      });
    } catch (e) {
      log(e.toString());
      showToast(msg: "School Login failed !!");
    }
  }

  askUserDetailsBottomSheet(BuildContext context) {
    return customShowDilogBox(
        context: context,
        title: "Slelct the options",
        children: [
          SizedBox(
            height: 150,
            width: 400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextFontWidget(text: 'Select Batch year *', fontsize: 12),
                SizedBox(
                  height: 45,
                  child: SelectBatchYearDropDownLogin(),
                ),
                const SizedBox(
                  height: 10,
                ),
                const TextFontWidget(text: 'Select Class *', fontsize: 12),
                SizedBox(
                  height: 45,
                  child: SelectClassDropDownLogin(),
                ),
              ],
            ),
          )
        ],
        actiononTapfuction: () async {
          await studentLoginController(context);
        },
        doyouwantActionButton: true);
  }

  Future<void> studentLoginController(BuildContext context) async {
    //....... ........................................Student  Login Function
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: userEmailIDController.text.trim(),
        password: userPasswordController.text.trim(),
      )
          .then((value) async {
        final user = await server
            .collection('SchoolListCollection')
            .doc(schoolListValue['docid'])
            .collection(batchCtrl.batchyearValue.value)
            .doc(batchCtrl.batchyearValue.value)
            .collection('classes')
            .doc(classCtrl.classDocID.value)
            .collection('Students')
            .doc(value.user?.uid)
            .get();

        if (user.data() != null) {
          UserCredentialsController.studentModel =
              StudentModel.fromMap(user.data()!);
        }

        if (UserCredentialsController.studentModel?.userRole == "student") {
          await SharedPreferencesHelper.setString(
              SharedPreferencesHelper.userRoleKey, 'student');
          await SharedPreferencesHelper.setString(
              SharedPreferencesHelper.schoolIdKey, schoolID!);
          await SharedPreferencesHelper.setString(
              SharedPreferencesHelper.schoolNameKey, schoolName!);
          await SharedPreferencesHelper.setString(
              SharedPreferencesHelper.batchIdKey,
              batchCtrl.batchyearValue.value);
          await SharedPreferencesHelper.setString(
              SharedPreferencesHelper.classIdKey, classCtrl.classDocID.value);
          if (context.mounted) {
            logined.value = true;
            Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (context) {
              return SplashScreen();
            }), (route) => false);
          }
          isLoading.value = false;
        } else {
          showToast(msg: "You are not a student");
          isLoading.value = false;
        }
      }).catchError((error) {
        if (error is FirebaseAuthException) {
          isLoading.value = false;
          handleFirebaseError(error);
        }
      });
    } catch (e) {
      isLoading.value = false;
      // showToast(msg: e.toString());
      showToast(msg: "Sign in failed");
    }
  }

  askUserDetailsParentBottomSheet(BuildContext context) {
    return customShowDilogBox(
        context: context,
        title: "Slelct the options",
        children: [
          SizedBox(
            height: 150,
            width: 400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextFontWidget(text: 'Select Batch year *', fontsize: 12),
                SizedBox(
                  height: 45,
                  child: SelectBatchYearDropDownLogin(),
                ),
                const SizedBox(
                  height: 10,
                ),
                const TextFontWidget(text: 'Select Class *', fontsize: 12),
                SizedBox(
                  height: 45,
                  child: SelectClassDropDownLogin(),
                ),
              ],
            ),
          )
        ],
        actiononTapfuction: () async {
          await parentLoginController(context);
        },
        doyouwantActionButton: true);
  }

  Future<void> parentLoginController(BuildContext context) async {
    //....... ........................................parent  Login Function

    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: userEmailIDController.text.trim(),
        password: userPasswordController.text.trim(),
      )
          .then((value) async {
        final user = await server
            .collection('SchoolListCollection')
            .doc(schoolListValue['docid'])
            .collection(batchCtrl.batchyearValue.value)
            .doc(batchCtrl.batchyearValue.value)
            .collection('classes')
            .doc(classCtrl.classDocID.value)
            .collection('Parents')
            .doc(value.user?.uid)
            .get();

        if (user.data() != null) {
          UserCredentialsController.parentModel =
              ParentModel.fromMap(user.data()!);
        }

        if (UserCredentialsController.parentModel?.userRole == "parent") {
          await SharedPreferencesHelper.setString(
              SharedPreferencesHelper.userRoleKey, 'parent');
          await SharedPreferencesHelper.setString(
              SharedPreferencesHelper.schoolIdKey, schoolID!);
          await SharedPreferencesHelper.setString(
              SharedPreferencesHelper.schoolNameKey, schoolName!);
          await SharedPreferencesHelper.setString(
              SharedPreferencesHelper.batchIdKey,
              batchCtrl.batchyearValue.value);
          await SharedPreferencesHelper.setString(
              SharedPreferencesHelper.classIdKey, classCtrl.classDocID.value);
          if (context.mounted) {
            logined.value = true;
            Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (context) {
              return SplashScreen();
            }), (route) => false);
          }
          isLoading.value = false;
        } else {
          showToast(msg: "You are not a parent");
          isLoading.value = false;
        }
      }).catchError((error) {
        if (error is FirebaseAuthException) {
          isLoading.value = false;
          handleFirebaseError(error);
        }
      });
    } catch (e) {
      isLoading.value = false;
      // showToast(msg: e.toString());
      showToast(msg: "Sign in failed");
    }
  }

  //////////////////////////////////

  askUserDetailsTeacherBottomSheet(BuildContext context) {
    return customShowDilogBox(
        context: context,
        title: "Slelct the options",
        children: [
          SizedBox(
            height: 150,
            width: 400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextFontWidget(text: 'Select Batch year *', fontsize: 12),
                SizedBox(
                  height: 45,
                  child: SelectBatchYearDropDownLogin(),
                ),
                const SizedBox(
                  height: 10,
                ),
                const TextFontWidget(text: 'Select Class *', fontsize: 12),
                SizedBox(
                  height: 45,
                  child: SelectClassDropDownLogin(),
                ),
              ],
            ),
          )
        ],
        actiononTapfuction: () async {
          await teachereLoginController(context);
        },
        doyouwantActionButton: true);
  }

  Future<void> teachereLoginController(BuildContext context) async {
    //....... ........................................parent  Login Function

    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: userEmailIDController.text.trim(),
        password: userPasswordController.text.trim(),
      )
          .then((value) async {
        final user = await server
            .collection('SchoolListCollection')
            .doc(schoolListValue['docid'])
            .collection('Teachers')
            .doc(value.user?.uid)
            .get();

        if (user.data() != null) {
          UserCredentialsController.teacherModel =
              TeacherModel.fromMap(user.data()!);
        }

        if (UserCredentialsController.teacherModel?.userRole == "teacher") {
          //       Scaffold(
          //   body: SafeArea(child: Center(
          //     child: TextFontWidget(text: "under Maintenance.........", fontsize: 20),
          //   )),
          // );
          await SharedPreferencesHelper.setString(
              SharedPreferencesHelper.userRoleKey, 'teacher');
          await SharedPreferencesHelper.setString(
              SharedPreferencesHelper.schoolIdKey, schoolID!);
          await SharedPreferencesHelper.setString(
              SharedPreferencesHelper.schoolNameKey, schoolName!);
          await SharedPreferencesHelper.setString(
              SharedPreferencesHelper.batchIdKey,
              batchCtrl.batchyearValue.value);
          await SharedPreferencesHelper.setString(
              SharedPreferencesHelper.classIdKey, classCtrl.classDocID.value);
          if (context.mounted) {
            logined.value = true;
            Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (context) {
              return SplashScreen();
            }), (route) => false);
          }
          isLoading.value = false;
        } else {
          showToast(msg: "You are not a teacher");
          isLoading.value = false;
        }
      }).catchError((error) {
        if (error is FirebaseAuthException) {
          isLoading.value = false;
          handleFirebaseError(error);
        }
      });
    } catch (e) {
      isLoading.value = false;
      // showToast(msg: e.toString());
      showToast(msg: "Sign in failed");
    }
  }

  TextEditingController applynewBatchYearContoller = TextEditingController();
  TextEditingController selectedToDaterContoller = TextEditingController();
  final Rxn<DateTime> _selectedDateForApplyDate = Rxn<DateTime>();
  final Rxn<DateTime> _selectedToDate = Rxn<DateTime>();
  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDateForApplyDate.value ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDateForApplyDate.value) {
      _selectedDateForApplyDate.value = picked;
      DateTime parseDate =
          DateTime.parse(_selectedDateForApplyDate.value.toString());
      final DateFormat formatter = DateFormat('yyyy-MMMM');
      String formatted = formatter.format(parseDate);

      applynewBatchYearContoller.text = formatted.toString();
      log(formatted.toString());
    }
  }

  _selectToDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedToDate.value ?? DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2100),
      // builder: (context, child) {},
    );
    if (picked != null && picked != _selectedToDate.value) {
      _selectedToDate.value = picked;
      DateTime parseDate = DateTime.parse(_selectedToDate.value.toString());
      final DateFormat formatter = DateFormat('yyyy-MMMM');
      String formatted = formatter.format(parseDate);

      selectedToDaterContoller.text = formatted.toString();
      log(formatted.toString());
    }
  }

  setBatchYear(BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Form(
          key: _secondFormkey,
          child: AlertDialog(
            title: const Text('Add BatchYear'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  TextFormField(
                    validator: (value) {
                      if (applynewBatchYearContoller.text.isEmpty) {
                        return 'Invalid';
                      } else {
                        return null;
                      }
                    },
                    controller: applynewBatchYearContoller,
                    readOnly: true,
                    onTap: () => _selectDate(context),
                    decoration: const InputDecoration(
                      labelText: 'DD-MM-YYYY',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const Icon(Icons.arrow_downward_outlined),
                  TextFormField(
                    controller: selectedToDaterContoller,
                    validator: (value) {
                      if (selectedToDaterContoller.text.isEmpty) {
                        return 'Invalid';
                      } else {
                        return null;
                      }
                    },
                    readOnly: true,
                    onTap: () => _selectToDate(context),
                    decoration: const InputDecoration(
                      labelText: 'To',
                      border: OutlineInputBorder(),
                    ),
                  ),
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
                child: const Text('Create'),
                onPressed: () async {
                  if (_secondFormkey.currentState!.validate()) {
                    await server
                        .collection('SchoolListCollection')
                        .doc(schoolID)
                        .collection("BatchYear")
                        .doc(
                            '${applynewBatchYearContoller.text.trim()}-${selectedToDaterContoller.text.trim()}')
                        .set({
                      'id':
                          '${applynewBatchYearContoller.text.trim()}-${selectedToDaterContoller.text.trim()}'
                    }).then((value) async {
                      await server
                          .collection('SchoolListCollection')
                          .doc(schoolID)
                          .set({
                        'batchYear':
                            "${applynewBatchYearContoller.text.trim()}-${selectedToDaterContoller.text.trim()}"
                      }, SetOptions(merge: true)).then((value) {
                        return showDialog(
                          context: context,
                          barrierDismissible: false, // user must tap button!
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Message'),
                              content: const SingleChildScrollView(
                                child: ListBody(
                                  children: <Widget>[
                                    Text(
                                        'Batch added successfully, Please login again.')
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('Ok'),
                                  onPressed: () {
                                    html.window.location.reload();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      });
                    });
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  RxString loginData = ''.obs;
  RxBool logined = false.obs;
  Future<void> loginSaveData() async {
    try {
      log("***************loginSaveData*************************");
      log("Sherf P schhol ID ${UserCredentialsController.schoolId}");
      log(" Local School Id  $schoolID");
      log("Sherf P batchID ${UserCredentialsController.batchId}");
      log(" Local batchID $batchID");
      final date = DateTime.now();
      DateTime parseDate = DateTime.parse(date.toString());
      final month = DateFormat('MMMM-yyyy');
      String monthwise = month.format(parseDate);
      final DateFormat formatter = DateFormat('dd-MM-yyyy');
      String formatted = formatter.format(parseDate);

      final String docid = uuid.v1();
      await server
          .collection('SchoolListCollection')
          .doc(UserCredentialsController.schoolId)
          .collection(UserCredentialsController.batchId ?? batchID)
          .doc(UserCredentialsController.batchId ?? batchID)
          .collection("LoginHistory")
          .doc(monthwise)
          .set({
        'docid': monthwise,
      }).then((value) async {
        await server
            .collection('SchoolListCollection')
            .doc(UserCredentialsController.schoolId)
            .collection(UserCredentialsController.batchId ?? batchID)
            .doc(UserCredentialsController.batchId ?? batchID)
            .collection("LoginHistory")
            .doc(monthwise)
            .collection(monthwise)
            .doc(formatted)
            .set({'docid': formatted}).then((value) async {
          loginData.value = docid;
          await SharedPreferencesHelper.setString(
              SharedPreferencesHelper.userloginKey, loginData.value);

          log("LOG IN KEY ::::: ${loginData.value}");
          await server
              .collection('SchoolListCollection')
              .doc(UserCredentialsController.schoolId)
              .collection(UserCredentialsController.batchId ?? batchID)
              .doc(UserCredentialsController.batchId ?? batchID)
              .collection("LoginHistory")
              .doc(monthwise)
              .collection(monthwise)
              .doc(formatted)
              .collection(formatted)
              .doc(docid)
              .set({
            'docid': docid,
            'loginTime': DateTime.now().toString(),
            'logoutTime': '',
            'adminuserName': FirebaseAuth.instance.currentUser?.email,
            'adminID': FirebaseAuth.instance.currentUser?.uid
          }, SetOptions(merge: true));
        });
      });
      logined.value = false;
    } catch (e) {
      print(e);
    }
  }

  Future<void> logoutSaveData() async {
    print('logout Key${UserCredentialsController.userloginKey}');
    final date = DateTime.now();
    DateTime parseDate = DateTime.parse(date.toString());
    final month = DateFormat('MMMM-yyyy');
    String monthwise = month.format(parseDate);
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    String formatted = formatter.format(parseDate);
    await server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection(UserCredentialsController.batchId!)
        .doc(UserCredentialsController.batchId)
        .collection("LoginHistory")
        .doc(monthwise)
        .collection(monthwise)
        .doc(formatted)
        .collection(formatted)
        .doc(UserCredentialsController.userloginKey)
        .set({
      'docid': UserCredentialsController.userloginKey,
      'logoutTime': DateTime.now().toString(),
      'adminuserName': FirebaseAuth.instance.currentUser?.email,
      'adminID': FirebaseAuth.instance.currentUser?.uid
    }, SetOptions(merge: true));
  }
}
