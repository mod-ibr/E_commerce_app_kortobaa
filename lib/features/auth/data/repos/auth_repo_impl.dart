import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/data/api_services.dart';
import '../../../../core/data/failures/failure.dart';
import '../../../../core/data/failures/server_failure.dart';
import '../models/request_login.dart';
import '../models/request_register.dart';
import '../models/response_login.dart';
import '../models/response_register/response_register.dart';
import 'auth_repo.dart';


class AuthRepoImpl extends AuthRepo {
  final ApiServices apiServices;

  AuthRepoImpl({required this.apiServices});

  @override
  Future<Either<Failure, ResponseLogin>> loginUser(
      {required RequestLogin requestLoginData}) async {
    try {
      var response = await apiServices.post(
        endPoint: "/users/login/",
        body: requestLoginData.toJson(),
      );
      return Right(
        ResponseLogin.fromJson(response),
      );
    } catch (e) {
      return Left(_handleError(e));
    }
  }

  @override
  Future<Either<Failure, ResponseRegister>> registerUser(
      {required RequestRegister requestRegisterData}) async {
    try {
      var response = await apiServices.post(
        endPoint: "/users/register/",
        body: requestRegisterData.toJson(),
      );
      return Right(
        ResponseRegister.fromJson(response),
      );
    } catch (e) {
      return Left(_handleError(e));
    }
  }

  Failure _handleError(Object e) {
    if (e is DioException) {
      return ServerFailure.handleNetworkErrorType(e);
    }
    return ServerFailure(
      exceptionType: DioExceptionType.unknown,
      expMsgCode: NetworkExpMsgCodes.unKnowingExpCode,
      errorMessage: e.toString(),
    );
  }
}
