import 'package:flutter/material.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';

// ignore: must_be_immutable
class TableListContainers extends StatelessWidget {
  final int flex;
  final String text;
  final Image? image;
   void Function()? onTap;

   TableListContainers({
    required this.text,
    required this.flex,
    this.image,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
        flex: flex,
        child: GestureDetector(onTap:onTap,
          child: Container(
            height: 45,
            width: 400,
            decoration: BoxDecoration(
                border: const Border(
                    right: BorderSide(color: cWhite, width: 0), bottom: BorderSide(color: cWhite)),
                color: Color.fromARGB(255, 240, 234, 234)),
            child: Center(
                child: Text(
              text,
              style: TextStyle(
                decoration: TextDecoration.none,
                color: cBlack,
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            )),
          ),
        ));
  }
}

class HeaderOfTable extends StatelessWidget {
  final String text;
  final int flex;

  const HeaderOfTable({
    required this.text,
    required this.flex,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: flex,
      child: Container(
        height: 45,
        width: 400,
        decoration: BoxDecoration(
            border: const Border(right: BorderSide(color: Colors.white, width: 0)),
            color: Colors.blue),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              decoration: TextDecoration.none,
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
