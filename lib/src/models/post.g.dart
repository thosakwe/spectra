// GENERATED CODE - DO NOT MODIFY BY HAND

part of spectra.models.post;

// **************************************************************************
// Generator: JsonSerializableGenerator
// Target: class Post
// **************************************************************************

Post _$PostFromJson(Map json) => new Post(
    id: json['id'] as String,
    categoryId: json['categoryId'] as String,
    content: json['content'] as String);

abstract class _$PostSerializerMixin {
  String get id;
  String get categoryId;
  String get content;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'id': id, 'categoryId': categoryId, 'content': content};
}
