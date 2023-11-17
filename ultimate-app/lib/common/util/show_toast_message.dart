import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore: avoid_classes_with_only_static_members
class Utils {
  static dynamic flutterToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }


  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snackBar(
      BuildContext context,
      {required String message}) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
    ));
  }

  /// Field Focus Change Function
  static void fieldFocusChange(
    BuildContext context, {
    required FocusNode current,
    required FocusNode nextFocus,
  }) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
