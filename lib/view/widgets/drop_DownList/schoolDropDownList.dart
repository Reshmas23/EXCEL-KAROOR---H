import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vidyaveechi_website/view/fonts/google_poppins_widget.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';

var schoolListValue;

class GetSchoolListDropDownButton extends StatefulWidget {
  const GetSchoolListDropDownButton({Key? key}) : super(key: key);

  @override
  State<GetSchoolListDropDownButton> createState() =>
      _GetSchoolListDropDownButtonState();
}

class _GetSchoolListDropDownButtonState
    extends State<GetSchoolListDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return dropDownButton();
  }

  StreamBuilder<QuerySnapshot<Map<String, dynamic>>> dropDownButton() {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("SchoolListCollection")
            .orderBy('schoolName', descending: false)
            .snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasData) {
            return DropdownButtonFormField(
              hint: schoolListValue == null
                  ? GooglePoppinsWidgets(text: 'Select school',fontsize: 14,overflow:TextOverflow.ellipsis ,)
                  : GooglePoppinsWidgets(text: schoolListValue!["schoolName"],fontsize: 14,overflow:TextOverflow.ellipsis ,),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.transparent, width: 0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                border: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.transparent, width: 0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                filled: true,
              ),
              items: snapshot.data!.docs.map(
                (val) {
                  return DropdownMenuItem(
                    value: val["schoolName"],
                    child: Text(val["schoolName"]),
                  );
                },
              ).toList(),
              onChanged: (val) {
                var categoryIDObject = snapshot.data!.docs
                    .where((element) => element["schoolName"] == val)
                    .toList()
                    .first;
                log(categoryIDObject["schoolName"]);
                UserCredentialsController.schoolId = categoryIDObject['docid'];

                setState(
                  () {
                    schoolListValue = categoryIDObject;
                  },
                );
              },
            );
          }
          return const SizedBox(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
