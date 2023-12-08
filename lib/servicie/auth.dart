import 'package:froms/models/user.dart';

abstract class Auth {
  Future<User> login(String email, String senha);
  Future<User> cadastrar(
      String email, String nome, String sobrenome, String idade, String senha);
}
