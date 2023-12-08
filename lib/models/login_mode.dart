import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class LoginMode {
  final String email;
  final String password;
  LoginMode({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

  factory LoginMode.fromMap(Map<String, dynamic> map) {
    return LoginMode(
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginMode.fromJson(String source) =>
      LoginMode.fromMap(json.decode(source) as Map<String, dynamic>);
}
