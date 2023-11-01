import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../presentation/manager/preference_cubit/preference_cubit.dart';

///This function takes number localize it
/// * [context] context of widget
/// * [number] to be formatted
String numberLocale(BuildContext context, num number) {
  final preferenceCubit = getPreferenceCubit(context);
  final country = preferenceCubit.langCode == "ar" ? "EG" : "US";
  return NumberFormat(
    '#.##',
    "${preferenceCubit.langCode}_$country",
  ).format(number);
}
