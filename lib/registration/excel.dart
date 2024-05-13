import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:syncfusion_flutter_xlsio/xlsio.dart' hide Column;
import 'package:vidyaveechi_website/registration/controller/registration_controller.dart';
import 'package:vidyaveechi_website/registration/model/registration_model.dart';

class GenerateExcel extends StatefulWidget {
 
  const GenerateExcel({Key? key, })
      : super(key: key);


 
  @override
  // ignore: library_private_types_in_public_api
  _CreateExcelState createState() => _CreateExcelState();
}

class _CreateExcelState extends State<GenerateExcel> {
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
  // In save_file_web.dart
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
  final RegisterController excelcontroller = Get.put(RegisterController());
  
  // Fetch all users
  final List<RegisterModel> users = await excelcontroller.fetchUserData();
  
  // Group users by class
  Map<String, List<RegisterModel>> usersByClass = {};
  for (var user in users) {
    if (!usersByClass.containsKey(user.userClass)) {
      usersByClass[user.userClass] = [];
    }
    usersByClass[user.userClass]!.add(user);
  }

  // Create Excel files for each class
  for (var entry in usersByClass.entries) {
    final className = entry.key;
    final classUsers = entry.value;

    //Creating a workbook.
    final Workbook workbook = Workbook();
    //Accessing via index
    final Worksheet sheet = workbook.worksheets[0];
    sheet.showGridlines = true;

    // Enable calculation for worksheet.
    sheet.enableSheetCalculations();

    sheet.getRangeByName('A1').setText('Name');
    sheet.getRangeByName('B1').setText('Class');
    sheet.getRangeByName('C1').setText('Email');
    sheet.getRangeByName('D1').setText('Phone');
    sheet.getRangeByName('E1').setText('Date of birth');
        sheet.getRangeByName('F1').setText('Parent Name');
        

    for (int i = 0; i < classUsers.length; i++) {
      sheet.getRangeByIndex(i + 2, 1).setText(classUsers[i].userName);
      sheet.getRangeByIndex(i + 2, 2).setText(classUsers[i].userClass);
      sheet.getRangeByIndex(i + 2, 3).setText(classUsers[i].userEmail);
      sheet.getRangeByIndex(i + 2, 4).setText(classUsers[i].phoneNumber);
      sheet.getRangeByIndex(i + 2, 5).setText(classUsers[i].dateofBirth);
       sheet.getRangeByIndex(i + 2, 6).setText(classUsers[i].parentName);
       
    }

    // Save and launch the excel.
    final List<int> bytes = workbook.saveAsStream();
    // Dispose the document.
    workbook.dispose();

    // Save and launch the file.
    await saveAndLaunchFile(bytes, 'Class$className.xlsx');
  }
}
}