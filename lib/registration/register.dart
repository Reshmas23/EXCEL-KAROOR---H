import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'package:vidyaveechi_website/registration/controller/registration_controller.dart';
import 'package:vidyaveechi_website/registration/excel.dart';
import 'package:vidyaveechi_website/view/constant/constant.validate.dart';
import 'package:vidyaveechi_website/view/fonts/google_poppins_widget.dart';
import 'package:vidyaveechi_website/view/widgets/textformFiledContainer/textformFiledContainer.dart';

// ignore: must_be_immutable
class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final RegisterController registercontroller = Get.put(RegisterController());

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: SizedBox(
                height: 600,
                // color: cred,
                child: Form(
                  key: formKey,
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GooglePoppinsWidgets(text: 'Register', fontsize: 35),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: TextFormFiledContainerWidget(
                          hintText: 'Enter your name',
                          title: 'Name',
                          width: 500,
                          controller: registercontroller.nameController,
                          validator: checkFieldEmpty,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: TextFormFiledContainerWidget(
                          hintText: 'Enter your class',
                          title: 'Class',
                          width: 500,
                          controller: registercontroller.classController,
                          validator: checkFieldEmpty,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: TextFormFiledContainerWidget(
                          hintText: 'Enter your emai',
                          title: 'Email',
                          width: 500,
                          controller: registercontroller.emailController,
                          validator: checkFieldEmailIsValid,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: TextFormFiledContainerWidget(
                          hintText: 'Enter your phone number',
                          title: 'Phone',
                          width: 500,
                          controller: registercontroller.phoneController,
                          validator: checkFieldEmpty,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: TextFormFiledContainerWidget(
                          hintText: 'Enter your parent name',
                          title: 'Parent name',
                          width: 500,
                          controller: registercontroller.parentNameController,
                          validator: checkFieldEmpty,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: TextFormFiledContainerWidget(
                          hintText: 'Enter your date of birth',
                          title: 'Date of birth',
                          width: 500,
                          controller: registercontroller.dateofbirthController,
                          validator: checkFieldEmpty,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2101));

                            if (pickedDate != null) {
                              print(pickedDate);
                              String formattedDate =
                                  DateFormat('yyyy-MM-dd').format(pickedDate);
                              print(formattedDate);

                              setState(() {
                                registercontroller.dateofbirthController.text =
                                    formattedDate;
                              });
                            } else {
                              print("Date is not selected");
                            }
                          },
                        ),
                      ),
                      GestureDetector(
                        onTap: (() async {
                          // String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
                          String docid = const Uuid().v4();
                          if (formKey.currentState!.validate()) {
                            await registercontroller.registerUser(docid);
                          }
                        }),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Container(
                            height: 50,
                            width: 500,
                            decoration: BoxDecoration(
                              color: Colors.purple[200],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: GooglePoppinsWidgets(
                                text: 'Register',
                                fontsize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (() async {
                          // String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
                          Get.to(const GenerateExcel());
                        }),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Container(
                            height: 50,
                            width: 500,
                            decoration: BoxDecoration(
                              color: Colors.purple[200],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: GooglePoppinsWidgets(
                                text: 'Generate Excel',
                                fontsize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Container(
                  height: 500,
                  decoration: const BoxDecoration(
                      // color: cBlue,
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('webassets/images/register.png'))),
                ),
              )),
            ],
          )
        ],
      ),
    );
  }
}
