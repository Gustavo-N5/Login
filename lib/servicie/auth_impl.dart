import 'package:dio/dio.dart';
import 'package:froms/models/user.dart';
import 'package:froms/servicie/auth.dart';

class AuthImpl extends Auth {
  var uri = "http://10.0.2.2:3000/";

  @override
  Future<User> login(String email, String senha) async {
    var response = await Dio().post(
      "http://localhost:3000/login",
      data: {
        "email": email,
        "password": senha,
      },
    );
    if (response.statusCode == 200) {
      return User.fromMap(response.data["user"]);
    }
    return throw ();
  }

  @override
  Future<User> cadastrar(String email, String nome, String sobrenome,
      String idade, String senha) async {
    var response = await Dio().post(
      "http://localhost:3000/register",
      data: {
        "email": email,
        "password": senha,
        "firstname": nome,
        "lastname": sobrenome,
        "age": idade
      },
    );
    if (response.statusCode == 201) {
      return User.fromMap(response.data["user"]);
    }
    return throw ();
  }
}
