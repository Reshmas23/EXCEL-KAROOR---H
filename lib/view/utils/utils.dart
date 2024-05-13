import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vidyaveechi_website/view/constant/const.dart';

void handleFirebaseError(FirebaseAuthException error) {
  switch (error.code) {
    case 'invalid-email':
      showToast(msg: 'invalid-email');
      break;
    case 'user-disabled':
      showToast(msg: 'user-disabled');
      break;
    case 'user-not-found':
      showToast(msg: 'user-not-found');
      break;
    case 'wrong-password':
      showToast(msg: 'wrong-password');
      break;
    case 'invalid-credential':
      showToast(msg: 'Invalid-credential');
      break;

    default:
      showToast(msg: 'Something went wrong');
      break;
  }
}

const circularProgressIndicatotWidget = Center(
  child: CircularProgressIndicator(),
);

String idGenerator() {
  final now = DateTime.now();
  return now.microsecondsSinceEpoch.toString();
}
