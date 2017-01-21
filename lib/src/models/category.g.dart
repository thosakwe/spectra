// GENERATED CODE - DO NOT MODIFY BY HAND

part of angel.models.category;

// **************************************************************************
// Generator: JsonSerializableGenerator
// Target: class Category
// **************************************************************************

Category _$CategoryFromJson(Map json) => new Category(
    id: json['id'] as String,
    name: json['name'] as String,
    desc: json['desc'] as String);

abstract class _$CategorySerializerMixin {
  String get id;
  String get name;
  String get desc;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'id': id, 'name': name, 'desc': desc};
}
