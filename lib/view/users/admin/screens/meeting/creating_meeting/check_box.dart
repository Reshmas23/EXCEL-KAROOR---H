import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class CheckedBoxMeetingWidget extends StatelessWidget {
  const CheckedBoxMeetingWidget({
    super.key,
   // required this.adminMeetingController,
  });

 // final AdminMeetingController adminMeetingController;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: [
              Checkbox(value: ''.isEmpty,onChanged: (value) {
                
              },
                // value: adminMeetingController.studentCheckBox.value,
                // onChanged: (value) {
                //   adminMeetingController.studentCheckBox.value = value ?? false;
                // },
              ),
              const Text('Students')
            ],
          ),
          Row(
            children: [
              Checkbox(
                value: ''.isEmpty,onChanged: (value) {
                
              },
                // value: adminMeetingController.teacherCheckBox.value,
                // onChanged: (value) {
                //   adminMeetingController.teacherCheckBox.value = value ?? false;
                // },
              ),
              const Text('Teacher')
            ],
          ),
          Row(
            children: [
              Checkbox(
                value: ''.isEmpty,onChanged: (value) {
                
              },
                // value: adminMeetingController.guardianCheckBox.value,
                // onChanged: (value) {
                //   adminMeetingController.guardianCheckBox.value =
                //       value ?? false;
                // },
              ),
              const Text('Parents')
            ],
          ),
        ],
      );
    });
  }
}