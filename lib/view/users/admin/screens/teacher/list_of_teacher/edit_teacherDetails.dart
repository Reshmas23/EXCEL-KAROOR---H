import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/class_controller/class_controller.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';

class TeacherDetailEditWidget extends StatelessWidget {
  final String docid;
  const TeacherDetailEditWidget({super.key, required this.docid});

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
                  hintText: "  Enter class name",
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
              await Get.find<ClassController>().updateClassName(docid);
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
              await Get.find<ClassController>().enableorDisableUpdate(
                'editoption',
                docid,
                false,
              );
            },
            child: Container(
              height: 35,
              decoration: BoxDecoration(
                  border: Border.all(color: cBlack.withOpacity(0.2))),
              child: Center(
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

class FeesEditWidget extends StatelessWidget {
  final String docid;
  const FeesEditWidget({super.key, required this.docid});

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
                controller: Get.find<ClassController>().classFeeEditController,
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
                  hintText: "  Enter class fee",
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
              await Get.find<ClassController>().updateClassFees(docid);
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
              await Get.find<ClassController>().enableorDisableUpdate(
                'feeeditoption',
                docid,
                false,
              );
            },
            child: Container(
              height: 35,
              decoration: BoxDecoration(
                  border: Border.all(color: cBlack.withOpacity(0.2))),
              child: Center(
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
