import 'dart:developer';
import 'dart:io';
import 'package:dio/io.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../constants/constants.dart';
import '../presentation/manager/preference_cubit/preference_cubit.dart';

class ApiServices {
  final Dio dio;
  final PreferenceCubit preferenceCubit;

  ApiServices(this.dio, this.preferenceCubit) {
    (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () =>
        HttpClient()
          ..badCertificateCallback =
              (X509Certificate cert, String host, int port) => true;
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          /*
          !When access_token ends should use refresh token to get new one,
          !so which end point to send refresh token to?
           bool isValid = await checkTokenValidity();
           if (isValid) {}
           */
          options.headers['Content-Type'] = 'application/json';
          options.headers['Accept'] = 'application/json';
          options.headers['Accept-Language'] = preferenceCubit.langCode;
          return handler.next(options);
        },
      ),
    );
    _interceptorsForDebugMode();
  }

  Future<bool> checkTokenValidity() async {
    try {
      var response = await dio.get("$kBaseUrl/check-token");
      return response.statusCode == 200 || response.statusCode! <= 300;
    } catch (error) {
      bool refreshTokenSuccess = await refreshToken();
      if (refreshTokenSuccess) {
        return checkTokenValidity();
      }
      return false;
    }
  }

  Future<bool> refreshToken() async {
    try {
      var refreshToken = "";
      var response = await dio.post(
        "$kBaseUrl/refresh-token",
        data: {
          'refresh_token': refreshToken,
        },
      );
      if (response.statusCode == 200 || response.statusCode! <= 300) {
        // var responseData = response.data;
        //  preferenceCubit.updateAuthToken(responseData['access_token']);
        return true;
      }
    } catch (error) {
      log("Failed to refresh token: $error");
    }
    return false;
  }

  Future<dynamic> get({
    required String endPoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
    Options? options,
  }) async {
    var response = await dio.get(
      "$kBaseUrl$endPoint",
      data: body,
      queryParameters: query,
      options: options,
    );
    return response.data;
  }

  Future<dynamic> post({
    required String endPoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
    Options? options,
  }) async {
    var response = await dio.post(
      "$kBaseUrl$endPoint",
      data: body,
      queryParameters: query,
      options: options,
    );
    return response.data;
  }

  Future<dynamic> put({
    required String endPoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
    Options? options,
  }) async {
    var response = await dio.put(
      "$kBaseUrl$endPoint",
      data: body,
      queryParameters: query,
      options: options,
    );
    return response.data;
  }

  Future<dynamic> delete({
    required String endPoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
    Options? options,
  }) async {
    var response = await dio.delete(
      "$kBaseUrl$endPoint",
      data: body,
      queryParameters: query,
      options: options,
    );
    return response.data;
  }

  void _interceptorsForDebugMode() {
    if (kDebugMode) {
      dio.interceptors.add(
        LogInterceptor(
          request: true,
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
          error: true,
        ),
      );
    }
  }
}
