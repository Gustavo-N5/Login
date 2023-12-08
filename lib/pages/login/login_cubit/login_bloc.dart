import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:froms/models/user.dart';
import 'package:froms/servicie/auth.dart';
import 'package:froms/servicie/auth_impl.dart';
part 'login_state.dart';

class LoginBloc extends Cubit<LoginState> {
  Auth servicie = AuthImpl();
  LoginBloc() : super(LoginInit());

  login(String email, String senha) async {
    try {
      var response = await servicie.login(email, senha);
      emit(LogedState(usuario: response));
    } on DioException catch (_) {
      emit(LoginNotFound());
    }
  }

  cadastro(String email, String nome, String sobrenome, String idade,
      String senha) async {
    try {
      var response =
          await servicie.cadastrar(email, nome, sobrenome, idade, senha);
      emit(Registed());
    } on DioException catch (_) {
      emit(LoginNotFound());
    }
  }
}
