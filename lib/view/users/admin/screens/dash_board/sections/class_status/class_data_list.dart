import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/widgets/data_list_widgets/data_container.dart';

class ClassDataList extends StatelessWidget {
  const ClassDataList({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    RxBool status = true.obs;
    return Container(
      height: 45,
      color: index % 2 == 0
          ? const Color.fromARGB(255, 246, 246, 246)
          : Colors.blue[50],
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: DataContainerWidget(
              rowMainAccess: MainAxisAlignment.center,
              color: cWhite,
              index: index,
              headerTitle: '  class x',
            ),
          ),
          const SizedBox(
            width: 02,
          ),
          Expanded(
            flex: 5,
            child: DataContainerWidget(
              rowMainAccess: MainAxisAlignment.center,
              color: cWhite,
              index: index,
              headerTitle: 'class tr',
            ),
          ),
          const SizedBox(
            width: 02,
          ),
          Expanded(
            flex: 5,
            child: DataContainerWidget(
              rowMainAccess: MainAxisAlignment.center,
              color: cWhite,
              index: index,
              headerTitle: 'current tr',
            ),
          ),
          const SizedBox(
            width: 02,
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: DataContainerWidget(
                rowMainAccess: MainAxisAlignment.center,
                color: cWhite,
                index: index,
                headerTitle: "100",
              ),
            ),
          ),
          const SizedBox(
            width: 02,
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: DataContainerWidget(
                rowMainAccess: MainAxisAlignment.center,
                color: cWhite,
                index: index,
                headerTitle: "100",
              ),
            ),
          ),
          const SizedBox(
            width: 02,
          ),
          Expanded(
            flex: 2,
            child: Obx(
              () => SizedBox(
                width: 10,
                height: 20,
                child: Image.asset(
                  status.value == true
                      ? 'webassets/png/active.png'
                      : 'webassets/png/shape.png',
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 02,
          ),
        ],
      ),
    );
  }
}
