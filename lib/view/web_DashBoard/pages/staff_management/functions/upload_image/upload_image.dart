import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/google_poppins_widget.dart';
import 'package:vidyaveechi_website/view/web_DashBoard/pages/staff_management/controller/employee_controller.dart';
import 'package:vidyaveechi_website/view/web_DashBoard/utils/image_picker.dart';
import 'package:vidyaveechi_website/view/widgets/back_button/back_button_widget.dart';
import 'package:vidyaveechi_website/view/widgets/blue_Container_widget/blue_Container_widget.dart';


uploadImageForStaff(BuildContext context, String docid) {
  final ImagePickerClass imagePicker = ImagePickerClass(picker: ImagePicker());
  // File? imagePath;
  StaffManagementController staffManagementController =
      Get.put(StaffManagementController());

  return showDialog(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GooglePoppinsWidgets(
                text: 'UPLOAD IMAGE FOR THIS PERSON',
                fontsize: 13,
                fontWeight: FontWeight.w600),
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: BackButtonContainerWidget(),
            ),
          ],
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              SizedBox(
                height: 300,
                width: 350,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(() {
                      if (staffManagementController.imagePath.value == null) {
                        return CircleAvatar(
                          radius: 80,
                          child: IconButton(
                              onPressed: () async {
                                try {
                                  staffManagementController.imagePath.value =
                                      await imagePicker.pickImageGallery();
                                } catch (e) {
                                  print(e);
                                }
                                // final input =
                                //     querySelector('#imageInput') as InputElement;
                                // input.click();
                              },
                              icon: const Icon(Icons.camera_alt_outlined)),
                        );
                      } else {
                        return Column(
                          children: [
                            CircleAvatar(
                              radius: 80,
                              backgroundImage: MemoryImage(
                                  staffManagementController.imagePath.value!),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: GestureDetector(
                                onTap: () async {
                                  try {
                                    staffManagementController.imagePath.value =
                                        await imagePicker.pickImageGallery();

                                    log("Image pathhhh ---->>> ${staffManagementController.imagePath.value}");
                                  } catch (e) {
                                    print(e);
                                  }
                                },
                                child: BlueContainerWidget(
                                  title: "Change Image",
                                  fontSize: 12,
                                  color: themeColorBlue,
                                  width: 100,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            )
                          ],
                        );
                      }
                    }),
                    Obx(() {
                      if (staffManagementController.imagePath.value == null) {
                        return const Text('');
                      } else {
                        return GestureDetector(
                          onTap: () async {
                            staffManagementController
                                .uploadImage(
                                    staffManagementController.imagePath.value!,
                                    'staffImage')
                                .then((value) async {
                              await FirebaseFirestore.instance
                                  .collection('StaffManagement')
                                  .doc('StaffManagement')
                                  .collection('Active')
                                  .doc(docid)
                                  .update({
                                'staffImage':
                                    staffManagementController.staffImageUrl
                              }).then((value) {
                                staffManagementController.imagePath = Rxn();
                                Navigator.pop(context);
                                Navigator.pop(context);
                              });
                            });
                          },
                          child: Obx(() {
                            if (staffManagementController.isUploading.value) {
                              return const CircularProgressIndicator(
                                color: themeColorBlue,
                              );
                            } else {
                              return Container(
                                height: 32,
                                width: 150,
                                decoration: const BoxDecoration(
                                  color: themeColorBlue,
                                ),
                                child: Center(
                                  child: GooglePoppinsWidgets(
                                      text: 'U P L O A D',
                                      color: cWhite,
                                      fontsize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              );
                            }
                          }),
                        );
                      }
                    }),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}
