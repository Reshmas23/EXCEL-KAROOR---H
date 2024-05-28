import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/view/fonts/google_poppins_widget.dart';
import 'package:vidyaveechi_website/view/widgets/textformFiledContainer/textformFiledBlueContainer.dart';

import '../../../../controller/card_controller.dart';

class AdmissionNumberAssigning extends StatelessWidget {
  final CardController cardController = Get.put(CardController());
  AdmissionNumberAssigning({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: 10),
              Expanded(
                child: TextFormFiledBlueContainerWidget(
                  hintText: 'Enter admission number',
                  title: 'Admission number',
                  controller: cardController.admissionController,
                ),
              ),
              const SizedBox(width: 20),
              GooglePoppinsWidgets(
                text: cardController.admissionController.text,
                fontsize: 20,
              ),
            ],
          ),
        ],
      );
    
  }
}
