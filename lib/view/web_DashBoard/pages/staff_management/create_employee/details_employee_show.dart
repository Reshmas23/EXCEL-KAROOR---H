// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:vidyaveechi_website/view/fonts/google_poppins_widget.dart';
import 'package:vidyaveechi_website/view/widgets/back_button/back_button_widget.dart';

detailsShowingFunction(BuildContext context,) {
   double screenSize = MediaQuery.of(context).size.height;

  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: SizedBox(
          width: screenSize/2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GooglePoppinsWidgets(
                text: 'Employee Details',
                fontsize: 15,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(
                width: 50,
              ),
              const Padding(
                padding: EdgeInsets.only(
                  top: 10,
                ),
                child: BackButtonContainerWidget(),
              ),
            ],
          ),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                   const CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage(""),),
                    const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                       GooglePoppinsWidgets(text: "🙂 ", fontsize: 14),
                       GooglePoppinsWidgets(text: "Anakha", fontsize: 14),
                    ],
                  ),
                  Container(
                    // height: screenSize,
                    alignment: Alignment.center,
                    child: const Divider(
                    color: Color.fromARGB(255, 57, 53, 46),
                      thickness: 1,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                       GooglePoppinsWidgets(text: "📧 ", fontsize: 14),
                       GooglePoppinsWidgets(text: "anakha@gmail.com", fontsize: 14),
                    ],
                  ),
                  Container(
                    // height: screenSize,
                    alignment: Alignment.center,
                    child: const Divider(
                    color: Color.fromARGB(255, 57, 53, 46),
                      thickness: 1,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                       GooglePoppinsWidgets(text: "📱 ", fontsize: 14),
                       GooglePoppinsWidgets(text: "1234567890", fontsize: 14),
                    ],
                  ),
                  Container(
                    // height: screenSize,
                    alignment: Alignment.center,
                    child: const Divider(
                    color: Color.fromARGB(255, 57, 53, 46),
                      thickness: 1,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                       GooglePoppinsWidgets(text: "✍️ ", fontsize: 14),
                       GooglePoppinsWidgets(text: "Advocate", fontsize: 14),
                    ],
                  ),
                  Container(
                    // height: screenSize,
                    alignment: Alignment.center,
                    child: const Divider(
                     color: Color.fromARGB(255, 57, 53, 46),
                      thickness: 1,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                       GooglePoppinsWidgets(text: "📅 ", fontsize: 14),
                       GooglePoppinsWidgets(text: "13/10/2023", fontsize: 14),
                    ],
                  ),
                  Container(
                    // height: screenSize,
                    alignment: Alignment.center,
                    child: const Divider(
                     color: Color.fromARGB(255, 57, 53, 46),
                      thickness: 1,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                       GooglePoppinsWidgets(text: "🏠 ", fontsize: 14),
                       GooglePoppinsWidgets(text: "Trichilathu", fontsize: 14),
                    ],
                  ),
                  Container(
                    // height: screenSize,
                    alignment: Alignment.center,
                    child: const Divider(
                      color: Color.fromARGB(255, 57, 53, 46),
                      thickness: 1,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                       GooglePoppinsWidgets(text: "🏙️ ", fontsize: 14),
                       GooglePoppinsWidgets(text: "Statue", fontsize: 14),
                    ],
                  ),
                  Container(
                    // height: screenSize,
                    alignment: Alignment.center,
                    child: const Divider(
                      color: Color.fromARGB(255, 57, 53, 46),
                      thickness: 1,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                       GooglePoppinsWidgets(text: "🌆 ", fontsize: 14),
                       GooglePoppinsWidgets(text: "Trivandrum", fontsize: 14),
                    ],
                  ),
                  Container(
                    // height: screenSize,
                    alignment: Alignment.center,
                    child: const Divider(
                      color: Color.fromARGB(255, 57, 53, 46),
                      thickness: 1,
                    ),
                  ),const SizedBox(height: 10,),
                 
                ],
              )
            ],
          ),
        ),
         contentPadding: EdgeInsets.symmetric(
          horizontal: 40, 
          vertical: 20,  
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
