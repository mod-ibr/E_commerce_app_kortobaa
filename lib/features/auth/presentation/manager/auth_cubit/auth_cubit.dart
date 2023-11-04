import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/exceptions.dart';
import 'package:e_commerce_app/core/error/failures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/network/network_connection_checker.dart';
import '../../../../../core/presentation/manager/preference_cubit/preference_cubit.dart';
import '../../../data/models/request_login.dart';
import '../../../data/models/request_register.dart';
import '../../../data/models/response_login.dart';
import '../../../data/models/response_register/response_register.dart';
import '../../../data/repos/auth_repo.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;
  final PreferenceCubit preferenceCubit;
  final NetworkConnectionChecker networkConnectionChecker;

  AuthCubit({
    required this.authRepo,
    required this.preferenceCubit,
    required this.networkConnectionChecker,
  }) : super(AuthInitial());

  Future<void> loginUser({required RequestLogin requestLoginData}) async {
    emit(AuthLoading());
    var result = await _loginUser(requestLoginData: requestLoginData);

    result.fold(
      (failure) => emit(AuthFailure(failure: failure)),
      (responseUserData) async {
        await preferenceCubit.saveUserData(responseUserData);
        emit(AuthLoggedIn(userData: responseUserData));
      },
    );
  }

  Future<Either<Failure, ResponseLogin>> _loginUser(
      {required RequestLogin requestLoginData}) async {
    if (await networkConnectionChecker.isConnected) {
      try {
        var result =
            await authRepo.loginUser(requestLoginData: requestLoginData);

        return Right(result);
      } on WrongAccountException {
        return Left(WrongAccountFailure());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  //Register
  RequestRegister? requestRegisterData;
  Future<void> registerUser() async {
    emit(AuthLoading());
    if (requestRegisterData != null) {
      var result = await _registerUser(requestRegister: requestRegisterData!);

      result.fold(
        (failure) => emit(AuthFailure(failure: failure)),
        (responseRegisterData) =>
            emit(AuthRegister(responseRegisterData: responseRegisterData)),
      );
    }
  }

  Future<Either<Failure, ResponseRegister>> _registerUser(
      {required RequestRegister requestRegister}) async {
    if (await networkConnectionChecker.isConnected) {
      try {
        var result = await authRepo.registerUser(
          requestRegisterData: requestRegister,
        );

        return Right(result);
      } on ExistAccountException {
        return Left(WrongAccountFailure());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}

AuthCubit getAuthCubit(BuildContext context) =>
    BlocProvider.of<AuthCubit>(context, listen: false);
