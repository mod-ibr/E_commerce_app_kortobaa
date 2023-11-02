import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

void showErrorAlertDialog(
  BuildContext context, {
  String? title,
  Color? titleColor,
  String? content,
}) {
  AwesomeDialog(
    context: context,
    animType: AnimType.scale,
    dialogType: DialogType.error,
    title: title,
    body: Center(
      child: Text(
        content ?? "",
      ),
    ),
    btnOkOnPress: () {},
  ).show();
}

void showWarningAlertDialog(
  BuildContext context, {
  String? title,
  Color? titleColor,
  String? content,
  required List<Widget>? actions,
}) {
  AwesomeDialog(
    context: context,
    animType: AnimType.scale,
    dialogType: DialogType.warning,
    title: title,
    body: Center(
      child: Text(
        content ?? "",
      ),
    ),
    btnOkOnPress: () {},
  ).show();
}

void showSuccessAlertDialog(
  BuildContext context, {
  String? title,
  Color? titleColor,
  String? content,
  required List<Widget>? actions,
}) {
  AwesomeDialog(
    context: context,
    animType: AnimType.scale,
    dialogType: DialogType.success,
    title: title,
    body: Center(
      child: Text(
        content ?? "",
      ),
    ),
    btnOkOnPress: () {},
  ).show();
}
