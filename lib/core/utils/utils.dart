import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showMassage(msg, {bool isSuccess = false}) {
  Fluttertoast.showToast(
      msg: msg ?? "",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: isSuccess ? Colors.green : Colors.redAccent,
      textColor: Colors.white,
      fontSize: 16.0);
}