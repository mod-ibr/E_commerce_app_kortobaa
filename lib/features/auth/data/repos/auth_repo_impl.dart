import 'dart:convert';
import 'dart:developer';
import '../../../../core/data/api_services.dart';
import '../../../../core/error/exceptions.dart';
import '../models/request_login.dart';
import '../models/request_register.dart';
import '../models/response_login.dart';
import '../models/response_register/response_register.dart';
import 'auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final ApiServices apiServices;

  AuthRepoImpl({required this.apiServices});

  @override
  Future<ResponseLogin> loginUser(
      {required RequestLogin requestLoginData}) async {
    var response = await apiServices.post(
      endPoint: "/users/login/",
      body: requestLoginData.toJson(),
    );

    final decodedJson = json.decode(response.body);
    log("Response from loginUser : $response");

    if (response.statusCode == 200) {
      ResponseLogin responseLogin =
          ResponseLogin.fromJson(decodedJson as Map<String, dynamic>);

      return responseLogin;
    } else if (response.statusCode == 401) {
      log("401 ERROR : ${decodedJson['detail']}");
      throw WrongAccountException();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ResponseRegister> registerUser(
      {required RequestRegister requestRegisterData}) async {
    var response = await apiServices.post(
      endPoint: "/users/register/",
      body: requestRegisterData.toJson(),
    );

    final decodedJson = json.decode(response.body);
    log("Response from registerUser : $response");

    if (response.statusCode == 200) {
      ResponseRegister responseRegister =
          ResponseRegister.fromJson(decodedJson as Map<String, dynamic>);

      return responseRegister;
    } else if (response.statusCode == 400) {
      log("400 ERROR : ${decodedJson['username']}");
      throw ExistAccountException();
    } else {
      throw ServerException();
    }
  }
}
