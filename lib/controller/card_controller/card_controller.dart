import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/notification_controller/notification_Controller.dart';
import 'package:vidyaveechi_website/view/constant/constant.validate.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';

class CardController extends GetxController {
  final notificationCntrl = Get.put(NotificationController());
  Future<void> streamCard() async {
    print("object>>>>>>>>>>>>>");
    await server
        .collection('Attendance')
        .doc('CardData')
        .get()
        .then((cardvalue) async {
      // final String cardId = cardvalue.data()?['CardID'];
      // final String dateTime = cardvalue.data()?['TappedTime'];
      // final String attendenceTaked = cardvalue.data()?['AttendanceTaken'];
      await fetchParents().then((value) async {
        print("Update Details>>>>>>>>>>>>>");
        await server.collection('Attendance').doc('CardData').update({
          "AttendanceTaken": "true",
          'CardID': '',
        }).then((value) async {
          await server.collection('Attendance').doc('CardData').update({
            "AttendanceTaken": "false",
            'CardID': '',
          });
        });
      });
    });
  }

  Future<void> fetchParents() async {
    print("fetchParents>>>>>>>>>>>>>");
    await server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection('AllUsersDeviceID')
        .get()
        .then((value) {
      for (var i = 0; i < value.docs.length; i++) {
        notificationCntrl.sendPushMessage(
            value.docs[i].data()['devideID'],
            'Attendence Taked ${timeConvert(DateTime.now())} ${dateConvert(DateTime.now())} ',
            'Card Attendece 💳');
      }
    });
  }
}
