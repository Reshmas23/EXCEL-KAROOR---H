import 'package:flutter/material.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';

editFunctionOfSubject(BuildContext context){
  showDialog(context: context, builder: (context) {
    return AlertDialog(
      title:  Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [ 
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back)),
         TextFontWidget(text: "  Edit Subject", fontsize: 15,fontWeight: FontWeight.bold,)
      ],),
      content: SizedBox(
        height: 120,
        child: Column(
          children: [ 
             SizedBox(
                height: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     TextFontWidget(text: ' Subject Name *', fontsize: 12.5),
                  const SizedBox(
                    height: 05,
                  ),
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1),
                        borderRadius: const BorderRadius.all(Radius.circular(5))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: const InputDecoration( 
                            border: InputBorder.none,
                            hintText: 'Enter Subject Name',
                            hintStyle: TextStyle(fontSize: 13,)),),
                      )),
                  ],
                ),
              ),
               GestureDetector(
            onTap: () {
              //if (_formKey.currentState!.validate()) {}
            },
            child: Container(
              height: 40,
              width: 150,
              decoration: BoxDecoration(
                  color: themeColorBlue,
                  border: Border.all(color: themeColorBlue),
                  borderRadius: BorderRadius.circular(05)),
              child:  Center(
                child: TextFontWidget(
                  text: "Edit",
                  fontsize: 14,
                  // fontWeight: FontWeight.w600,
                  color: cWhite,
                ),
              ),
            ),
          ),
          ],
        ),
      ),
    );
  },);
}


           