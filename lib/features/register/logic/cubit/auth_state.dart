part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class SignoutInitial extends AuthState {}

final class SignoutSucessState extends AuthState {
  final String sucessMessage;

  SignoutSucessState({required this.sucessMessage});
}

final class SignoutLoadingState extends AuthState {}

final class SignoutFailureState extends AuthState {
  final String errorMessage;

  SignoutFailureState({required this.errorMessage});
}

final class LoginInitialState extends AuthState {}
// This is the initial state ...

final class LoginSucessState extends AuthState {
  final String role;
  final String user;

  LoginSucessState( {required this.role,required this.user});
}

final class LoginLoadingState extends AuthState {}

final class LoginFailureState extends AuthState {
  final String errorMessage;

  LoginFailureState({required this.errorMessage});
}

final class SignupInitial extends AuthState {}
// This is the initial state ...

final class SignupSucessState extends AuthState {
  final String sucessMessage;
  final String role;
   final User user;

  SignupSucessState( {required this.user,required this.role,required this.sucessMessage});
}

final class SignupLoadingState extends AuthState {}

final class SignupFailureState extends AuthState {
  final String errorMessage;

  SignupFailureState({required this.errorMessage});
}
