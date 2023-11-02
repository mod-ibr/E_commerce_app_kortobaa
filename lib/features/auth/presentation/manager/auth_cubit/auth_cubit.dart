import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/data/failures/failure.dart';
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
  AuthCubit({required this.authRepo, required this.preferenceCubit})
      : super(AuthInitial());

  Future<void> loginUser({required RequestLogin requestLoginData}) async {
    emit(AuthLoading());
    var result = await authRepo.loginUser(requestLoginData: requestLoginData);
    result.fold(
      (failure) => emit(AuthFailure(failure: failure)),
      (responseUserData) async {
        await preferenceCubit.saveUserData(responseUserData);
        emit(AuthLoggedIn(userData: responseUserData));
      },
    );
  }

  //Register
  RequestRegister? requestRegisterData;
  Future<void> registerUser() async {
    emit(AuthLoading());
    if (requestRegisterData != null) {
      var result = await authRepo.registerUser(
        requestRegisterData: requestRegisterData!,
      );
      result.fold(
        (failure) => emit(AuthFailure(failure: failure)),
        (responseRegisterData) =>
            emit(AuthRegister(responseRegisterData: responseRegisterData)),
      );
    }
  }
}

AuthCubit getAuthCubit(BuildContext context) =>
    BlocProvider.of<AuthCubit>(context, listen: false);
