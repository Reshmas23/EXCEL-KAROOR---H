import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:uuid/uuid.dart';  
import 'package:vidyaveechi_website/model/event_models/events_model.dart';
import 'package:vidyaveechi_website/view/constant/const.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/events/all_event_view.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';

class EventController extends GetxController {
  Rx<ButtonState> buttonstate = ButtonState.idle.obs;
  TextEditingController eventnameController = TextEditingController();
  TextEditingController eventdateController = TextEditingController();
  TextEditingController editeventdateController = TextEditingController();
  TextEditingController eventdescriptionController = TextEditingController();
  TextEditingController eventvenueController = TextEditingController();
  TextEditingController eventsignedByController = TextEditingController();

   TextEditingController editnameController = TextEditingController();
  TextEditingController editdateController = TextEditingController();
  TextEditingController editdescriptionController = TextEditingController();
  TextEditingController editvenueController = TextEditingController();
  TextEditingController editsignedByController = TextEditingController();
  final formKey = GlobalKey<FormState>();
   final Rxn<DateTime> dateSelected = Rxn<DateTime>();
  //  final Rx<String> eventdateController = ''.obs;
   
  //EventModel? model;

  Future<void> createEvent() async {
    final uuid =const  Uuid().v1();
    final eventDetails = EventModel(
        eventDate: eventdateController.text,
        eventName: eventnameController.text,
        eventDescription: eventdescriptionController.text,
        venue: eventvenueController.text,
        signedBy: eventsignedByController.text,
        id: uuid
        );

    // final Map<String, dynamic> eventData = eventDetails.toMap();

    try {
      await server
          .collection('SchoolListCollection')
          .doc(UserCredentialsController.schoolId)
          .collection(UserCredentialsController.batchId!)
          .doc(UserCredentialsController.batchId!)
          .collection('AdminEvents')
          .doc(eventDetails.id)
          .set(eventDetails.toMap())
          .then((value) async {
        eventnameController.clear();
        eventdateController.clear();
        eventdescriptionController.clear();
        eventvenueController.clear();
        eventsignedByController.clear();
        buttonstate.value = ButtonState.success;
        print(UserCredentialsController.batchId!);
        print(eventDetails.id);

        showToast(msg: "Event Created Successfully");
        await Future.delayed(const Duration(seconds: 2)).then((vazlue) {
          buttonstate.value = ButtonState.idle;
        });
      });
    } catch (e) {
      buttonstate.value = ButtonState.fail;
      await Future.delayed(const Duration(seconds: 2)).then((value) {
        buttonstate.value = ButtonState.idle;
      });
      log("Error .... $e");
    }
  }

  Future<void> updateEvent(String eventData,String eventName,
    String eventDescription,String venue,String signedBy,
    String id,BuildContext context) async {
    // ignore: unused_local_variable
   // String edit = snapshot.data!.docs[index]['eventName'];
    server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection(UserCredentialsController.batchId!)
        .doc(UserCredentialsController.batchId!)
        .collection('AdminEvents')
        .doc(id)
        .update({
          'eventDate': eventController.editeventdateController.text,
          'eventName': eventController.editnameController.text,
          'eventDescription': eventController.editdescriptionController.text,
          'venue': eventController.editvenueController.text,
          'signedBy': eventController.editsignedByController.text,
        })
        .then((value) => Navigator.pop(context ))
        .then((value) => showToast(msg: 'Event Updated!'));
  }

  Future<void> deleteEvent(String id,BuildContext context)async{
     // ignore: unused_local_variable
   //  String delete = snapshot.data!.docs[index]['eventName'];
    server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection(UserCredentialsController.batchId!)
        .doc(UserCredentialsController.batchId!)
        .collection('AdminEvents')
        .doc(id)
        .delete();
  }


   Future<void> selectDate(BuildContext context, TextEditingController controller) async {
  final DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2101),
  );

  if (pickedDate != null) {
    String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
    controller.text = formattedDate;
  }
}
}
