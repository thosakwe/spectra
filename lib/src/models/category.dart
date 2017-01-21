library angel.models.category;

import 'package:angel_mongo/model.dart';
import 'package:source_gen/generators/json_serializable.dart';

part 'category.g.dart';

@JsonSerializable()
class Category extends Model with _$CategorySerializerMixin {
  @JsonKey('id')
  @override
  String id;

  @JsonKey('name')
  String name;
  
  @JsonKey('desc')
  String desc;

  factory Category.fromJson(Map json) => _$CategoryFromJson(json);

  Category({String id, this.name, this.desc}) {
    this.id = id;
  }
}