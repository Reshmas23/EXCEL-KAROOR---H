
import 'package:get/get.dart';

import '../../model/loginHistory_model/login_history_model.dart';
import '../../view/utils/firebase/firebase.dart';
import '../../view/utils/shared_pref/user_auth/user_credentials.dart';

class AdminLoginHistroyController extends GetxController {
  // RxList <AdminLoginDetailHistoryModel> loginHistorylistMonth =RxList([]);
  List<AdminLoginDetailHistoryModel> loginHistorylistMonth = [];
  String loginTime = '';
  String month = '';
  String date = '';
  String docid = '';
  Rxn<AdminLoginDetailHistoryModel> loginhistoryModelData =
      Rxn<AdminLoginDetailHistoryModel>();

  RxBool loginHistroyontapped = false.obs;
  RxBool selectedMonth=false.obs;


  /////////////////////////////////////////\
  List<String> allLoginMonthList = [];
  RxString loginHMonthValue = 'dd'.obs;
  Future<List<String>> fetchLoginHMonth() async {
    final firebase = await server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection(UserCredentialsController.batchId!)
        .doc(UserCredentialsController.batchId)
        .collection('LoginHistory')
        .get();

    for (var i = 0; i < firebase.docs.length; i++) {
      final list = firebase.docs[i].data()['docid'] ;
      allLoginMonthList.add(list);
      print(list);
    }
    return allLoginMonthList;
  }

  List<String> allLoginDayList = [];
  RxString loginHDayValue = 'dd'.obs;
  Future<List<String>> fetchLoginHDay() async {
    final firebase = await server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection(UserCredentialsController.batchId!)
        .doc(UserCredentialsController.batchId)
        .collection('LoginHistory')
        .doc(loginHMonthValue.value)
        .collection(loginHMonthValue.value)
        .get();

    for (var i = 0; i < firebase.docs.length; i++) {
      final list = firebase.docs[i].data()['docid'];
      allLoginDayList.add(list);
    }
    return allLoginDayList;
  }
}
