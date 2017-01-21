// GENERATED CODE - DO NOT MODIFY BY HAND

part of spectra.models.user;

// **************************************************************************
// Generator: JsonSerializableGenerator
// Target: class User
// **************************************************************************

User _$UserFromJson(Map json) => new User(
    id: json['id'] as String,
    name: json['name'] as String,
    email: json['email'] as String,
    password: json['password'] as String,
    roles: (json['roles'] as List)?.map((v0) => v0 as String));

abstract class _$UserSerializerMixin {
  String get id;
  String get name;
  String get email;
  String get password;
  List get roles;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'email': email,
        'password': password,
        'roles': roles
      };
}
