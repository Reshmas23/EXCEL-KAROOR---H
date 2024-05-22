import 'dart:html';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' hide Column;
import 'package:vidyaveechi_website/view/drop_down/select_class.dart';

import '../../../../../controller/registration_controller/registation_controller.dart';
import '../../../../../model/student_model/student_model.dart';
import '../../../../fonts/google_poppins_widget.dart';



class GenerateExcel extends StatefulWidget {
  const GenerateExcel({Key? key}) : super(key: key);

  @override
  _GenerateExcelState createState() => _GenerateExcelState();
}

class _GenerateExcelState extends State<GenerateExcel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: GooglePoppinsWidgets(text: 'Download Excel', fontsize: 16),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GooglePoppinsWidgets(text: 'Select class', fontsize: 16),
            ////SizedBox(height: 80,width: 300,child: SelectClassDropDown(),),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.lightBlue,
                disabledForegroundColor: Colors.grey,
              ),
              onPressed: generateExcel,
              child: const Text('Generate Excel'),
            )
          ],
        ),
      ),
    );
  }

  Future<void> saveAndLaunchFile(List<int> bytes, String fileName) async {
    final blob = Blob([Uint8List.fromList(bytes)]);
    final url = Url.createObjectUrlFromBlob(blob);
    AnchorElement(href: url)
      ..target = 'webbrowser'
      ..download = fileName
      ..click();
    Url.revokeObjectUrl(url);
  }

  Future<void> generateExcel() async {
    final RegistrationController excelcontroller = Get.put(RegistrationController());
    

    // Fetch all users
    final List<StudentModel> users = await excelcontroller.fetchStudentData();

    // Debug: Print fetched users
    print('Fetched users: ${users.length}');
    for (var user in users) {
      print('User: ${user.studentName}, Class: ${user.classId}');
    }

    // Group users by class
    Map<String, List<StudentModel>> usersByClass = {};
    for (var user in users) {
      if (!usersByClass.containsKey(user.nameofClass)) {
        usersByClass[user.nameofClass] = [];
      }
      usersByClass[user.nameofClass]!.add(user);
    }

    // Debug: Print grouped users by class
    usersByClass.forEach((nameofClass, users) {
      print('Class: $nameofClass, Students: ${users.length}');
    });

    // Create Excel files for each class
    for (var entry in usersByClass.entries) {
      final nameofClass = entry.key;
      final classUsers = entry.value;

      // Debug: Print class details before creating Excel
      print('Creating Excel for Class: $nameofClass with ${classUsers.length} students');

      // Creating a workbook.
      final Workbook workbook = Workbook();
      // Accessing via index
      final Worksheet sheet = workbook.worksheets[0];
      sheet.showGridlines = true;

      // Enable calculation for worksheet.
      sheet.enableSheetCalculations();

      sheet.getRangeByName('A1').setText('Name');
      sheet.getRangeByName('B1').setText('Class');
      sheet.getRangeByName('C1').setText('Email');
      sheet.getRangeByName('D1').setText('Phone');
      
      sheet.getRangeByName('E1').setText('Parent Name');

      for (int i = 0; i < classUsers.length; i++) {
        sheet.getRangeByIndex(i + 2, 1).setText(classUsers[i].studentName);
        sheet.getRangeByIndex(i + 2, 2).setText(classUsers[i].nameofClass);
        sheet.getRangeByIndex(i + 2, 3).setText(classUsers[i].studentemail);
        sheet.getRangeByIndex(i + 2, 4).setText(classUsers[i].parentPhoneNumber);
       
        sheet.getRangeByIndex(i + 2, 5).setText(classUsers[i].nameofParent);
      }

      // Save and launch the excel.
      final List<int> bytes = workbook.saveAsStream();
      // Dispose the document.
      workbook.dispose();

      // Save and launch the file.
      await saveAndLaunchFile(bytes, '$nameofClass.xlsx');
    }

    // Debug: Completed
    print('Excel generation completed.');
  }
}
