import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToastTessage(String message) {
  Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.BOTTOM,
      fontSize: 16,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
      );
}
