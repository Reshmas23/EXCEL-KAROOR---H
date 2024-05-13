import 'package:flutter/material.dart';

// class AppTextStyles {
//   static const boldText = TextStyle(
//     fontSize: 20,
//     color: Colors.black,
//     fontWeight: FontWeight.bold,
//   );
// }
class AppTextStyles {
  static TextStyle boldText(
      {double fontSize = 20, Color color = Colors.black}) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle text({double fontSize = 20, Color color = Colors.black}) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.w600,
    );
  }
}
