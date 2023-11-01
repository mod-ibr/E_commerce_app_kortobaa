import 'package:dio/dio.dart';

enum NetworkTimeoutExceptions {
  sendTimeout,
  connectionTimeout,
  receiveTimeout,
  cancel,
}

enum NetworkExpMsgCodes {
  noInternetConnectionExpCode,
  badResponseExpCode,
  unKnowingExpCode
}

abstract class Failure {
  final DioExceptionType exceptionType;
  final int? statusCode;
  final NetworkExpMsgCodes expMsgCode;
  final String? errorMessage;
  const Failure({
    required this.exceptionType,
    required this.statusCode,
    required this.expMsgCode,
    required this.errorMessage,
  });
}
