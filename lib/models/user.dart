import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserMoodel {
  final String uid;
  final String username;
  final String email;
  final String password;
  UserMoodel({
    required this.uid,
    required this.username,
    required this.email,
    required this.password,
  });
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'username': username,
      'email': email,
      'password': password,
    };
  }

  factory UserMoodel.fromMap(Map<String, dynamic> map) {
    return UserMoodel(
      uid: map['uid'] as String,
      username: map['username'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserMoodel.fromJson(String source) => UserMoodel.fromMap(json.decode(source) as Map<String, dynamic>);
}
