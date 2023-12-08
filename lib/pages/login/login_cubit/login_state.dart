// ignore_for_file: public_member_api_docs, sort_constructors_first
part of './login_bloc.dart';

abstract class LoginState {}

class LoginInit extends LoginState {}

class LogonState extends LoginState {}

class LogedState extends LoginState {
  User usuario;

  LogedState({
    required this.usuario,
  });
}

class LoginNotFound extends LoginState {}

class Registed extends LoginState {}
