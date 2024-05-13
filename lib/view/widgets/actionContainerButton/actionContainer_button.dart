import 'package:flutter/widgets.dart';

class ActionContainerButton extends StatelessWidget {
  const ActionContainerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 100,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(30)
      ),
    );
  }
}