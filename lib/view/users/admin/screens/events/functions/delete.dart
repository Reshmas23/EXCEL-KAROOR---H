import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/event_controller/event_controller.dart';
import 'package:vidyaveechi_website/model/event_models/events_model.dart';
import 'package:vidyaveechi_website/view/widgets/custom_delete_showdialog/custom_delete_showdialog.dart';

final EventController eventController = Get.put(EventController());
deleteFunctionOfEvents(BuildContext context, EventModel data) {
  customDeleteShowDialog(
      context: context,
      onTap: () {
        eventController.deleteEvent(
          data.id,
          context,
        );Navigator.pop(context);
      });
  // customShowDilogBox(
  //   context: context,
  //   title: 'Delete',
  //   children: [
  //     GooglePoppinsWidgets(
  //         text: 'Are you sure to want delete',
  //         fontsize: ResponsiveWebSite.isMobile(context) ? 12 : 15)
  //   ],
  //   doyouwantActionButton: true,
  //   //actiontext: 'cancel',
  //   actiononTapfuction: () {
  //     eventController.deleteEvent(
  //       data.id,
  //       context,
  //     );
  //     // ignore: unused_local_variable
  //     // String delete = snapshot.data!
  //     //     .docs[index]['eventName'];
  //     // FirebaseFirestore.instance
  //     //     .collection(
  //     //         'SchoolListCollection')
  //     //     .doc(UserCredentialsController.schoolId)
  //     //     .collection(UserCredentialsController.batchId!)
  //     //     .doc(UserCredentialsController.batchId!)
  //     //     .collection('AdminEvents')
  //     //     .doc(snapshot.data!
  //     //         .docs[index]['id'])
  //     //     .delete()
  //     //     .then((value) =>Navigator.pop(context));
  //   },
  // );
}
