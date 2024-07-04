import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/notification_controller/notification_Controller.dart';
import 'package:vidyaveechi_website/view/constant/constant.validate.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';

class CardController extends GetxController {
  final notificationCntrl = Get.put(NotificationController());
  Future<void> streamCard() async {
    print("calling");
    await server
        .collection('Attendance')
        .doc(UserCredentialsController.schoolId)
        .get()
        .then((cardvalue) async {
      await fetchCardDataStudents(cardID: cardvalue.data()?['CardID']);
    });
  }

  Future<void> fetchCardDataStudents({required String cardID}) async {
    await server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
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
        .doc(UserCredentialsController.schoolId)
        .collection('AllUsersDeviceID')
        .doc(parentID)
        .get()
        .then((value) async {
      await notificationCntrl
          .sendPushMessage(
        value.data()?['devideID'],
        'Sir/Madam, your child $studentName was present on ${dateConvert(DateTime.now())} \n സർ/മാഡം, ${dateConvert(DateTime.now())} തീയതി ${timeConvert(DateTime.now())} നിങ്ങളുടെ കുട്ടി ഹാജരായി',
        'Attendence Notification from ${UserCredentialsController.schoolName}',
      )
          .then((cardvalue) async {
        await server
            .collection('Attendance')
            .doc(UserCredentialsController.schoolId)
            .update({'CardID': ''});
      });
    });
  }
  
}
