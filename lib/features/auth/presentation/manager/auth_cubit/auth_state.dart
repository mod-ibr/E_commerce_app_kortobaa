part of 'auth_cubit.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthLoggedIn extends AuthState {
  final ResponseLogin userData;

  AuthLoggedIn({required this.userData});
}

final class AuthRegister extends AuthState {
  final ResponseRegister responseRegisterData;

  AuthRegister({required this.responseRegisterData});
}

final class AuthFailure extends AuthState {
  final Failure failure;

  AuthFailure({required this.failure});
}
