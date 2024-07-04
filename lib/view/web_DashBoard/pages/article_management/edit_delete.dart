import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

articleEditAndDelete(
    BuildContext context, String title, String description, String id) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController titleController = TextEditingController();
        TextEditingController descriptionController = TextEditingController();

        titleController.text = title;
        descriptionController.text = description;

        return AlertDialog(
          title: Text('Edit or Delete'),
          content: Container(
            width: 500,
            height: 300,
            child: Column(
              children: [
                TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                log(id);
                FirebaseFirestore.instance
                    .collection('ArticleManagement')
                    .doc(id)
                    .update({
                  'articleTitle': titleController.text,
                  'articleDescription': descriptionController.text,
                  'docID': id,
                }).then((value) => Navigator.pop(context));
              },
              child: Text('Edit'),
            ),
            TextButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return Container(
                          child: AlertDialog(
                        title: Text('Delete Article'),
                        content: Text(
                            'Are you sure you want to delete this article?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              FirebaseFirestore.instance
                                  .collection('ArticleManagement')
                                  .doc(id)
                                  .delete();
                              Navigator.of(context).pop();
                            },
                            child: Text('Yes'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('No'),
                          ),
                        ],
                      ));
                    }).then((value) => Navigator.pop(context));
              },
              child: Text('Delete'),
            ),
          ],
      );
});
}