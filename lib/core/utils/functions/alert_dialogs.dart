import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

void showErrorAlertDialog(
  BuildContext context, {
  String? title,
  Color? titleColor,
  String? content,
  Function()? btnOkOnPress,
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
    btnOkOnPress: () => btnOkOnPress!(),
  ).show();
}

void showWarningAlertDialog(
  BuildContext context, {
  String? title,
  Color? titleColor,
  String? content,
  Function()? btnOkOnPress,
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
    btnOkOnPress: () => btnOkOnPress!(),
  ).show();
}

void showSuccessAlertDialog(
  BuildContext context, {
  String? title,
  Color? titleColor,
  String? content,
  Function()? btnOkOnPress,
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
    btnOkOnPress: () => btnOkOnPress!(),
  ).show();
}
