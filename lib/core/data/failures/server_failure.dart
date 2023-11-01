import 'dart:io';
import 'package:dio/dio.dart';

import 'failure.dart';

class ServerFailure extends Failure {
  ServerFailure(
      {required super.exceptionType,
      super.statusCode,
      required super.expMsgCode,
      super.errorMessage});

/*
 ? this factory constructor using to decide which factory constructor will using to will return an instance of class based on dio exception
*/
  factory ServerFailure.handleNetworkErrorType(DioException exception) {
    final expType = exception.type;

    if (expType == DioExceptionType.badResponse) {
      return ServerFailure.fromResponse(exception);
    }
    if (expType is NetworkTimeoutExceptions) {
      return ServerFailure.fromTimeout(exception);
    }
    if (exception.error is SocketException ||
        expType == DioExceptionType.connectionError) {
      return ServerFailure.fromNetwork(exception);
    }
    return ServerFailure.fromUnknown(exception);
  }

  factory ServerFailure.fromResponse(DioException exception) {
    return ServerFailure(
      exceptionType: DioExceptionType.badResponse,
      statusCode: exception.response?.statusCode,
      expMsgCode: NetworkExpMsgCodes.badResponseExpCode,
      errorMessage: exception.response?.data['message'],
    );
  }

  factory ServerFailure.fromNetwork(DioException exception) {
    return ServerFailure(
      exceptionType: DioExceptionType.connectionError,
      statusCode: exception.response?.statusCode,
      expMsgCode: NetworkExpMsgCodes.noInternetConnectionExpCode,
      errorMessage: exception.response?.data['message'],
    );
  }

  factory ServerFailure.fromUnknown(DioException exception) {
    return ServerFailure(
      exceptionType: DioExceptionType.unknown,
      statusCode: exception.response?.statusCode,
      expMsgCode: NetworkExpMsgCodes.unKnowingExpCode,
      errorMessage: exception.response?.data['message'],
    );
  }

  factory ServerFailure.fromTimeout(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.receiveTimeout:
        return ServerFailure(
          exceptionType: DioExceptionType.receiveTimeout,
          statusCode: exception.response?.statusCode,
          expMsgCode: NetworkExpMsgCodes.noInternetConnectionExpCode,
          errorMessage: exception.response?.data['message'],
        );
      case DioExceptionType.sendTimeout:
        return ServerFailure(
          exceptionType: DioExceptionType.sendTimeout,
          statusCode: exception.response?.statusCode,
          expMsgCode: NetworkExpMsgCodes.noInternetConnectionExpCode,
          errorMessage: exception.response?.data['message'],
        );
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
          exceptionType: DioExceptionType.connectionTimeout,
          statusCode: exception.response?.statusCode,
          expMsgCode: NetworkExpMsgCodes.noInternetConnectionExpCode,
          errorMessage: exception.response?.data['message'],
        );
      case DioExceptionType.cancel:
        return ServerFailure(
          exceptionType: DioExceptionType.cancel,
          statusCode: exception.response?.statusCode,
          expMsgCode: NetworkExpMsgCodes.noInternetConnectionExpCode,
          errorMessage: exception.response?.data['message'],
        );
      default:
        return ServerFailure.fromUnknown(exception);
    }
  }
}
