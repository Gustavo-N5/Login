// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final int? id;
  final String email;
  final String firstname;
  final String lastname;
  final String age;
  User({
    this.id,
    required this.email,
    required this.firstname,
    required this.lastname,
    required this.age,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'firstname': firstname,
      'lastname': lastname,
      'age': age,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] != null ? map['id'] as int : null,
      email: map['email'] as String,
      firstname: map['firstname'] as String,
      lastname: map['lastname'] as String,
      age: map['age'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
