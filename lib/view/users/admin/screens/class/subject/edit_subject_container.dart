import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/subject_controller/subject_controller.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';

class SubjectNameEditWidget extends StatelessWidget {
  final String docid;
  const SubjectNameEditWidget({super.key, required this.docid});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: SizedBox(
            height: 35,
            child: Center(
              child: TextFormField(
                controller: Get.find<SubjectController>().subNameEditController,
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 01, horizontal: 01),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0)),
                      borderSide: BorderSide(
                        width: 1,
                        style: BorderStyle.none,
                        color: Colors.red,
                      )),
                  focusedErrorBorder: OutlineInputBorder(
                    // borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(
                      width: 1,
                      style: BorderStyle.none,
                      color: Colors.red,
                    ),
                  ),
                  // contentPadding: const EdgeInsets.all(8.0),
                  enabledBorder:
                      OutlineInputBorder(borderSide: BorderSide(width: 0.4)),
                  hintStyle: TextStyle(fontSize: 13),
                  hintText: "  Enter subject name",
                  focusedBorder: OutlineInputBorder(
                    //<-- SEE HERE
                    borderSide: BorderSide(width: 1, color: Colors.green),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 2,
        ),
        Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: () async {
              await Get.find<SubjectController>().updateSubjectName(docid);
            },
            child: Container(
              height: 35,
              decoration: BoxDecoration(
                  border: Border.all(color: cBlack.withOpacity(0.2))),
              child: Center(
                child: TextFontWidget(
                  text: '✔️',
                  fontsize: 12,
                  fontWeight: FontWeight.bold,
                  color: cgreen,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 2,
        ),
        Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: () async {
              await Get.find<SubjectController>().enableorDisableUpdate(
                docid,
                false,
              );
            },
            child: Container(
              height: 35,
              decoration: BoxDecoration(
                  border: Border.all(color: cBlack.withOpacity(0.2))),
              child:  Center(
                child: TextFontWidget(
                  text: '✖️',
                  fontsize: 12,
                  fontWeight: FontWeight.bold,
                  color: cred,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
