import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/admin_section/student_controller/student_controller.dart';
import 'package:vidyaveechi_website/model/student_model/student_model.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/students/search_students/studentdataList.dart';

import '../../../../../fonts/google_poppins_widget.dart';
import '../student_details/widgets/category_tableHeader.dart';

class AllStudentSearchByID extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(
          Icons.clear,
          color: Colors.black,
        ));
    return null;
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<StudentModel> suggestionList;

    if (query.isEmpty) {
      suggestionList = Get.find<StudentController>().studentProfileList;
    } else {
      suggestionList = Get.find<StudentController>()
          .studentProfileList
          .where((item) =>
              item.admissionNumber.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    if (suggestionList.isEmpty) {
      return ListTile(
        title: GooglePoppinsWidgets(
          text: "User not found",
          fontsize: 18,
          fontWeight: FontWeight.w400,
        ),
      );
    }
    return Scaffold(
      body: SafeArea(
        child: ListView.separated(
          itemBuilder: (context, index) {
            final data = suggestionList[index];
            return GestureDetector(
              onTap: () async {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 75,
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child:
                                  CatrgoryTableHeaderWidget(headerTitle: 'ID')),
                          SizedBox(
                            width: 02,
                          ),
                          Expanded(
                              flex: 4,
                              child: CatrgoryTableHeaderWidget(
                                  headerTitle: 'Name')),
                          SizedBox(
                            width: 02,
                          ),
                          Expanded(
                              flex: 2,
                              child: CatrgoryTableHeaderWidget(
                                  headerTitle: 'Class')),
                          SizedBox(
                            width: 02,
                          ),
                          Expanded(
                              flex: 4,
                              child: CatrgoryTableHeaderWidget(
                                  headerTitle: 'E mail')),
                          SizedBox(
                            width: 02,
                          ),
                          Expanded(
                              flex: 3,
                              child: CatrgoryTableHeaderWidget(
                                  headerTitle: 'Ph.NO')),
                        ],
                      ),
                      SearchStudentDataList(data: data, index: index)
                    ],
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 10,
            );
          },
          itemCount: suggestionList.length,
        ),
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const SizedBox();
  }
}
