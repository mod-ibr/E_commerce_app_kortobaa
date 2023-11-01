import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showShortToast(
  String message, {
  Color backgroundColor = Colors.black,
  ToastGravity gravity = ToastGravity.CENTER,
}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: gravity,
    backgroundColor: backgroundColor,
  );
}

showLongToast(
  String message, {
  Color backgroundColor = Colors.black,
  ToastGravity gravity = ToastGravity.CENTER,
}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: gravity,
    backgroundColor: backgroundColor,
  );
}
