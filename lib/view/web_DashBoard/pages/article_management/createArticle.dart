import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/google_poppins_widget.dart';
import 'package:vidyaveechi_website/view/widgets/back_button/back_button_widget.dart';
import 'package:vidyaveechi_website/view/widgets/textformFiledContainer/textformFiledContainer.dart';

createArticle(BuildContext context) {
  String fileName = '';
  String finalDownloadUrl = '';
  Uint8List? filee;
  TextEditingController articleTitleController = TextEditingController();
  TextEditingController articleDescriptionController = TextEditingController();

  Future<String> pickDocument() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null) {
        Uint8List fileBytes = result.files.first.bytes!;
        filee = fileBytes;
        String fileName = result.files.first.name;
        return fileName;
        // Upload file
      }
    } catch (e) {
      return e.toString();
    }

    return '';
    // try {
    //   FilePickerResult? result = await FilePickerWeb.platform.pickFiles(
    //     type: FileType.custom,
    //     allowedExtensions: [
    //       'pdf',
    //       'doc',
    //       'docx'
    //     ], // Add more extensions as needed
    //   );

    //   if (result != null) {
    //     File file = File(result.files.single.bytes.toString());
    //     // Handle the selected document file (e.g., save it, process it, etc.)
    //     print('Selected document: ${file.path}');
    //     return file.path;
    //   }
    // } catch (e) {
    //   print('Error picking document: $e');
    //   return 'Error picking document: $e';
    // }

    // return '';
  }

  Future<void> uploadDocument(Uint8List res) async {
    try {
      // Get a reference to the Firebase Storage service
      final storage = FirebaseStorage.instance;

      // Create a reference to the document you want to upload
      Reference documentReference =
          storage.ref().child('articles').child(fileName);

      SettableMetadata metadata = SettableMetadata(
        customMetadata: {
          'customKey': 'customValue',
          // Add any additional metadata fields as needed
        },
      );

      UploadTask uploadTask = documentReference.putData(res, metadata);

      await uploadTask.whenComplete(() {
        log('done');
      });

      TaskSnapshot snap = await uploadTask;
      String downloadUrl = await snap.ref.getDownloadURL();
      log(downloadUrl);
      finalDownloadUrl = downloadUrl;
    } catch (e) {
      print('Error uploading document: $e');
    }
  }

  return showDialog(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      final GlobalKey<FormState> formKey = GlobalKey<FormState>();
      return Form(
        key: formKey,
        child: AlertDialog(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GooglePoppinsWidgets(
                  text: 'CREATE ARTICLE',
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
                  height: 500,
                  width: 400,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormFiledContainerWidget(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'This field is required';
                            } else {
                              return null;
                            }
                          },
                          controller: articleTitleController,
                          hintText: "Enter Article Title",
                          title: "Article Title",
                          width: 300),
                      TextFormFiledContainerWidget(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'This field is required';
                            } else {
                              return null;
                            }
                          },
                          controller: articleDescriptionController,
                          hintText: "Enter Article Description",
                          title: "Article Description",
                          width: 300),
                      SizedBox(
                        height: 60,
                        width: 300,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                                height: 35,
                                width: 300,
                                child: MaterialButton(
                                  onPressed: () async {
                                    fileName = await pickDocument();
                                    log(fileName);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: GooglePoppinsWidgets(
                                          text: fileName,
                                          fontsize: 15,
                                          color: Colors.white,
                                        ),
                                        duration: const Duration(seconds: 5),
                                      ),
                                    );
                                    //       .showSnackBar(
                                    //     SnackBar(
                                    //       content: GooglePoppinsWidgets(
                                    //         text: '$fileName',
                                    //         fontsize: 15,
                                    //         color: Colors.white,
                                    //       ),
                                    //       duration: Duration(seconds: 5),
                                    //     ),
                                    //   );
                                    //     .then((value) {
                                    //   log(fileName);
                                    //   ScaffoldMessenger.of(context)
                                    //       .showSnackBar(
                                    //     SnackBar(
                                    //       content: GooglePoppinsWidgets(
                                    //         text: '$fileName',
                                    //         fontsize: 15,
                                    //         color: Colors.white,
                                    //       ),
                                    //       duration: Duration(seconds: 5),
                                    //     ),
                                    //   );
                                    //   return fileName;
                                    // });
                                  },
                                  color: themeColorBlue,
                                  child: GooglePoppinsWidgets(
                                    text: 'Select doc',
                                    color: cWhite,
                                    fontsize: 14,
                                  ),
                                )),
                          ],
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 250,
                        decoration: const BoxDecoration(
                          color: themeColorBlue,
                        ),
                        child: MaterialButton(
                          onPressed: () async {
                            if (filee != null) {
                              String uid = const Uuid().v1();
                              uploadDocument(filee!).then((value) {
                                FirebaseFirestore.instance
                                    .collection('ArticleManagement')
                                    .doc(uid)
                                    .set({
                                  'articleTitle': articleTitleController.text,
                                  'articleDescription':
                                      articleDescriptionController.text,
                                  'articleUrl': finalDownloadUrl,
                                  'docID': uid
                                }).then((value) {
                                  Navigator.pop(context);
                                });
                              });
                            }
                          },
                          child: Center(
                            child: GooglePoppinsWidgets(
                                text: 'Add Article',
                                color: cWhite,
                                fontsize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}
