library spectra.models.user;

import 'package:angel_mongo/model.dart';
import 'package:angel_security/angel_security.dart';
import 'package:source_gen/generators/json_serializable.dart';

part 'user.g.dart';

final Permission _admin = new Permission('admin');

@JsonSerializable()
class User extends Model with _$UserSerializerMixin {
  @JsonKey('id')
  @override
  String id;

  @JsonKey('name')
  String name;

  @JsonKey('email')
  String email;

  @JsonKey('password')
  String password;

  @JsonKey('roles')
  final List<String> roles = [];

  factory User.fromJson(Map json) => _$UserFromJson(json);

  bool get isAdmin => roles.any(_admin.verify);

  User(
      {String id,
      this.name,
      this.email,
      this.password,
      Iterable<String> roles: const []}) {
    this.id = id;
    this.roles.addAll(roles ?? []);
  }
}
