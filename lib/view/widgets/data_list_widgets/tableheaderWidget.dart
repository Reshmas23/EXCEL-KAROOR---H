import 'package:flutter/material.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';

class TableHeaderWidget extends StatelessWidget {
  final String headerTitle;
  final double? width;

  const TableHeaderWidget({
    this.width,
    required this.headerTitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: width,
      decoration: BoxDecoration(
          color: const Color.fromARGB(250, 250, 250, 252),
          border: Border.symmetric(
            horizontal: BorderSide(color: cBlack.withOpacity(0.5)),
          )),
      child: Center(
        child: Text(
          headerTitle,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
        ),
      ),
    );
  }
}

class ResultTableHeaderWidget extends StatelessWidget {
  final String headerTitle;
  final double? width;

  const ResultTableHeaderWidget({
    this.width,
    required this.headerTitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: width,
      decoration: BoxDecoration(
          color: const Color.fromARGB(250, 250, 250, 252),
          border: Border.symmetric(
            horizontal: BorderSide(color: cBlack.withOpacity(0.5)),
          )),
          alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Text(
          headerTitle,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
        ),
      ),
    );
  }
}