import '../models/request_login.dart';
import '../models/request_register.dart';
import '../models/response_login.dart';
import '../models/response_register/response_register.dart';

abstract class AuthRepo {
  Future<ResponseLogin> loginUser({required RequestLogin requestLoginData});
  Future<ResponseRegister> registerUser(
      {required RequestRegister requestRegisterData});
}
