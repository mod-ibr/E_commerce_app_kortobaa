import 'dart:convert';
import 'package:http/http.dart' as http;

import '../constants/constants.dart';
import '../presentation/manager/preference_cubit/preference_cubit.dart';

class ApiServices {
  final PreferenceCubit preferenceCubit;

  ApiServices(this.preferenceCubit);

  Future<http.Response> get({
    required String endPoint,
    required String token,
    Map<String, dynamic>? query,
  }) async {
    final response = await http.get(
      Uri.parse('$kBaseUrl$endPoint'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Accept-Language': preferenceCubit.langCode,
        'Authorization': 'Bearer $token',
      },
    );

    return response;
  }

  Future<http.Response> post({
    required String endPoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
  }) async {
    final response = await http.post(
      Uri.parse('$kBaseUrl$endPoint'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Accept-Language': preferenceCubit.langCode,
      },
      body: jsonEncode(body),
    );

    return response;
  }

  Future<http.Response> put({
    required String endPoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
  }) async {
    final response = await http.put(
      Uri.parse('$kBaseUrl$endPoint'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Accept-Language': preferenceCubit.langCode,
      },
      body: jsonEncode(body),
    );

    return response;
  }

  Future<http.Response> delete({
    required String endPoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
  }) async {
    final response = await http.delete(
      Uri.parse('$kBaseUrl$endPoint'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Accept-Language': preferenceCubit.langCode,
      },
      body: jsonEncode(body),
    );

    return response;
  }
}
