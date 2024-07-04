import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/admin_section/parent_controller/parent_controller.dart';
import 'package:vidyaveechi_website/model/parent_model/parent_model.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/parents/list_table/list_table_of_prnt.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/students/student_details/widgets/category_tableHeader.dart';

import '../../../../../fonts/google_poppins_widget.dart';

class AllParentSearchByName extends SearchDelegate {
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
    final List<ParentModel> suggestionList;

    if (query.isEmpty) {
      suggestionList = Get.find<ParentController>().parentProfileList;
    } else {
      suggestionList = Get.find<ParentController>()
          .parentProfileList
          .where((item) =>
              item.parentName!.toLowerCase().contains(query.toLowerCase()))
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
              onTap: () async {
                Get.find<ParentController>().parentModelData.value = data;
                Get.find<ParentController>().ontapviewParent.value = true;
                Get.back();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 75,
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: CatrgoryTableHeaderWidget(
                                  headerTitle: 'No.')),
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
                              flex: 4,
                              child: CatrgoryTableHeaderWidget(
                                  headerTitle: 'Email')),
                          SizedBox(
                            width: 02,
                          ),
                          Expanded(
                              flex: 3,
                              child: CatrgoryTableHeaderWidget(
                                  headerTitle: 'Ph.NO')),
                          SizedBox(
                            width: 02,
                          ),
                          Expanded(
                              flex: 4,
                              child: CatrgoryTableHeaderWidget(
                                  headerTitle: 'Student Name')),
                          SizedBox(
                            width: 02,
                          ),
                          Expanded(
                              flex: 2,
                              child: CatrgoryTableHeaderWidget(
                                  headerTitle: 'Class')),
                        ],
                      ),
                      AllParentsDataList(data: data, index: index)
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
