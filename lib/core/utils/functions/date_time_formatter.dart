import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../presentation/manager/preference_cubit/preference_cubit.dart';

///This function takes DateTime and format it
/// * [context] context of widget
/// * [dateTime] to be formatted
/// * Formats:
/// * "MMM d, h:mm a" => 16 Jan, 6:00PM
/// * "yMMMd" => 16 Jan 2022
/// * "jm" => 6:00PM
String dateTimeFormatter(BuildContext context, DateTime dateTime,
    {String format = "yMMMd"}) {
  final preferenceCubit = getPreferenceCubit(context);
  var formatter = DateFormat(format, preferenceCubit.langCode);
  return formatter.format(dateTime);
}
