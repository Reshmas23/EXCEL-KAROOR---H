import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/event_controller/event_controller.dart';
import 'package:vidyaveechi_website/model/event_models/events_model.dart';
import 'package:vidyaveechi_website/view/constant/constant.validate.dart';
import 'package:vidyaveechi_website/view/widgets/custom_showdialouge/custom_showdialouge.dart';
import 'package:vidyaveechi_website/view/widgets/textformFiledContainer/textformFiledBlueContainer.dart';

editFunctionOfEvent(BuildContext context, EventModel data) {
  final EventController eventController = Get.put(EventController());
  customShowDilogBox(
      context: context,
      title: 'Edit',
      children: [
        Form(
          key: eventController.formKey,
          child: Column(
            children: [
          TextFormFiledHeightnoColor(
            validator: checkFieldEmpty,
            controller: eventController.editnameController,
              hintText: data.eventName,
              title: 'Event'),
          TextFormFiledHeightnoColor(
            onTap: () {
              eventController.selectDate(context, eventController.editeventdateController);
            },
            controller: eventController.editeventdateController,
              hintText: data.eventDate,
              validator: checkFieldEmpty,
              title: 'Date'),
          TextFormFiledHeightnoColor(
            controller: eventController.editvenueController,
              hintText: data.venue,
               validator: checkFieldEmpty,
              title: 'Venue'),
          TextFormFiledHeightnoColor(
            controller: eventController.editdescriptionController,
              hintText: data.eventDescription,
               validator: checkFieldEmpty,
              title: 'Description'),
          TextFormFiledHeightnoColor(
            controller: eventController.editsignedByController,
              hintText: data.signedBy,
               validator: checkFieldEmpty,
              title: 'Signed by')
              ],),
        ),
      ],
      doyouwantActionButton: true,
      actiononTapfuction: () {
        if(eventController  .formKey.currentState! .validate()){
        eventController.updateEvent(data.eventDate,data.eventName,data.eventDescription,data.venue,data.signedBy,
          data.id,context );}
        //      // ignore: unused_local_variable
        //      String edit = snapshot.data!
        //     .docs[index]['eventName'];

        // FirebaseFirestore.instance
        //     .collection('SchoolListCollection')
        //      .doc(UserCredentialsController.schoolId)
        //      .collection(UserCredentialsController.batchId!)
        //      .doc(UserCredentialsController.batchId!)
        //     .collection('AdminEvents')
        //     .doc(snapshot
        //         .data!.docs[index]['id'])
        //     .update({
        //       'eventDate': eventController.eventdateController.text,
        //       'eventName': eventController.eventnameController.text,
        //       'eventDescription': eventController.eventdescriptionController.text,
        //       'venue': eventController.eventvenueController.text,
        //       'signedBy':eventController.eventsignedByController.text,
        //     })
        //     .then((value) =>
        //         Navigator.pop(context))
        //     .then((value) => showToast(
        //         msg: 'Event Updated!'));
      },
      actiontext: 'Update');
}
