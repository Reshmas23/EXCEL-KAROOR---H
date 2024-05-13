import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vidyaveechi_website/controller/batch_yearController/batch_year_Controller.dart';

class SelectBatchYearDropDown extends StatelessWidget {
  SelectBatchYearDropDown({
    Key? key,
  }) : super(key: key);

  final batchCtrl = Get.put(BatchYearController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
          child: DropdownSearch<String>(
        validator: (item) {
          if (item == null) {
            return "Required field";
          } else {
            return null;
          }
        },
      
        // autoValidateMode: AutovalidateMode.always,
      
        asyncItems: (value) {
          batchCtrl.allbatchList.clear();
      
          return batchCtrl.fetchBatchyear();
        },
        itemAsString: (value) => value,
        onChanged: (value) async {
          if (value != null) {
            batchCtrl.batchyearValue.value = value;
          }
        },
        popupProps: const PopupProps.menu(
            searchFieldProps: TextFieldProps(
                decoration: InputDecoration(
                    hintText: "Search Batch Year", border: OutlineInputBorder())),
            showSearchBox: true,
            searchDelay: Duration(microseconds: 10)),
        dropdownDecoratorProps: DropDownDecoratorProps(
            baseStyle: GoogleFonts.poppins(
                fontSize: 13, color: Colors.black.withOpacity(0.7))),
      )),
    );
  }
}
