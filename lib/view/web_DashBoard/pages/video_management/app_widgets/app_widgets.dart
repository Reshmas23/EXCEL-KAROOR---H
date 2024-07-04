import 'package:flutter/material.dart';

class AppWidgets {
  static const loadinWidget = Center(child: CircularProgressIndicator());

  static void showDeleteConfirmationDialog(
    BuildContext context, [
    VoidCallback? callback,
  ]) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Deletion'),
          content: const Text('Are you sure you want to delete this item?'),
          actions: <Widget>[
            TextButton(
              onPressed: callback,
              child: const Text('Delete'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}
