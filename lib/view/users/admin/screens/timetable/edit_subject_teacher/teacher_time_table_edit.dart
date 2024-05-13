import 'package:awesome_side_sheet/Enums/sheet_position.dart';
import 'package:awesome_side_sheet/side_sheet.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';

teacherTimeTableEditOption(BuildContext context) {
  aweSideSheet(
      context: context,
      sheetPosition: SheetPosition.right,
      showCloseButton: false,
      title: "Edit Teacher List",
      
      
      body: SingleChildScrollView(
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 50),
                child: Container(
                  width: ResponsiveWebSite.isMobile(context) ? 200 : 400,
                  height: 35,
                  color: screenContainerbackgroundColor,
                  child: DropdownSearch(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    dropdownDecoratorProps: DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                            hintText: "Please Select Teacher",
                            labelStyle: TextStyle(
                              fontSize:
                                  ResponsiveWebSite.isMobile(context) ? 13 : 15,
                            ),
                            contentPadding: EdgeInsets.only(top: 5, bottom: 5),
                            prefixIcon: Icon(
                              Icons.menu_book,
                              size: 20,
                            ))),
                    items: const ['1', '2', '3'],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50,left: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 40, 90, 228),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Submit',
                        style: TextStyle(
                            fontSize:
                                ResponsiveWebSite.isMobile(context) ? 10 : 13,
                            fontWeight: FontWeight.bold,
                            color: cWhite),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20,top: 50),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 40, 90, 228),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Delete',
                        style: TextStyle(
                            fontSize:
                                ResponsiveWebSite.isMobile(context) ? 10 : 13,
                            fontWeight: FontWeight.bold,
                            color: cWhite),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      footer: Container());
}
