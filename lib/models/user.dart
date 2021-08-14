import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @JsonKey(name: 'html_url')
  @HiveField(2)
  final String htmlUrl;
  @JsonKey(name: 'created_at')
  @HiveField(3)
  final String createdAt;
  @JsonKey(name: 'updated_at')
  @HiveField(4)
  final String updatedAt;

  User(this.id, this.name, this.htmlUrl, this.createdAt, this.updatedAt);

  
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
