library angel.models.post;

import 'package:angel_mongo/model.dart';
import 'package:source_gen/generators/json_serializable.dart';

part 'post.g.dart';

@JsonSerializable()
class Post extends Model with _$PostSerializerMixin {
  @JsonKey('id')
  @override
  String id;

  @JsonKey('categoryId')
  String categoryId;

  @JsonKey('content')
  String content;

  factory Post.fromJson(Map json) => _$PostFromJson(json);

  Post({String id, this.categoryId, this.content}) {
    this.id = id;
  }
}
