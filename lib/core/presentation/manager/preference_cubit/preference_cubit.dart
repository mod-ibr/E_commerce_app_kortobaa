import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:convert';

import '../../../../features/auth/data/models/response_login.dart';
import '../../../constants/constants.dart';
import '../../../localization/l10n.dart';

part 'preference_state.dart';

class PreferenceCubit extends Cubit<PreferenceState> {
  final SharedPreferences sharedPreferences;
  PreferenceCubit({required this.sharedPreferences})
      : super(PreferenceInitial());

  //* For API Services and Auth
  ResponseLogin? _userData;
  ResponseLogin? get userData => _userData;

  Future<void> saveUserData(ResponseLogin responseUserData) async {
    _userData = responseUserData;
    await saveDataSharedPreference(key: kUserData, value: _userData?.toJson());
  }

  Future<void> getUserData() async {
    final data = await getDataFromSharedPreference(key: kUserData);
    if (data != null) {
      _userData = ResponseLogin.fromJson(json.decode(data));
    }
  }

  Future<void> removeUserData() async {
    await removeData(key: kUserData);
    _userData = null;
  }

  //* For locale
  late String _langCode;
  String get langCode => _langCode;

  Future<void> toggleLocale({required String languageCode}) async {
    if (!L10n.supportedLocales.contains(Locale(languageCode)) &&
        (languageCode != _langCode)) return;
    _langCode = languageCode;
    await saveDataSharedPreference(key: kLocale, value: languageCode);
    emit(PreferenceInitial());
  }

  ///Used as initializer
  String getLocaleFromCache() {
    _langCode = getDataFromSharedPreference(key: kLocale) ?? "ar";
    emit(PreferenceInitial());
    return _langCode;
  }

  //* For SharedPreferences
  dynamic getDataFromSharedPreference({required String key}) =>
      sharedPreferences.get(key);

  Future<bool> saveDataSharedPreference(
      {required String key, required dynamic value}) async {
    if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    } else if (value is String) {
      return await sharedPreferences.setString(key, value);
    } else if (value is int) {
      return await sharedPreferences.setInt(key, value);
    } else if (value is Map) {
      return await sharedPreferences.setString(key, json.encode(value));
    } else {
      return await sharedPreferences.setDouble(key, value);
    }
  }

  ///Used to remove a specific variable in SharedPreferences
  Future<bool> removeData({required String key}) async =>
      await sharedPreferences.remove(key);

  ///Used to clear all data in SharedPreferences
  Future<void> clearData() => sharedPreferences.clear();
}

PreferenceCubit getPreferenceCubit(BuildContext context) =>
    BlocProvider.of<PreferenceCubit>(context, listen: false);
