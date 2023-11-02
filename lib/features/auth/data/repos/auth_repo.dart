import 'package:dartz/dartz.dart';

import '../../../../core/data/failures/failure.dart';
import '../models/auth/request_register.dart';
import '../models/auth/response_login.dart';
import '../models/request_login.dart';
import '../models/response_register/response_register.dart';


abstract class AuthRepo {
  Future<Either<Failure, ResponseLogin>> loginUser(
      {required RequestLogin requestLoginData});

  Future<Either<Failure, ResponseRegister>> registerUser(
      {required RequestRegister requestRegisterData});

}
