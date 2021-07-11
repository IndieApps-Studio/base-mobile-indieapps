import 'package:hive_flutter/hive_flutter.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  int id = -1;
  @HiveField(1)
  String name = 'placeholder_name';
  @HiveField(2)
  String htmlUrl = 'placeholder_htmlUrl';
  @HiveField(3)
  String createdAt = '';
  @HiveField(4)
  String updatedAt = '';

  User();

  User.fromJson(Map<String, dynamic>? json) {
    id = json?['id'] ?? 'placeholder_id';
    name = json?['name'] ?? 'placeholder_name';
    htmlUrl = json?['html_url'] ?? 'placeholder_htmlUrl';
    createdAt = json?['created_at'] ?? '';
    updatedAt = json?['updated_at'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['html_url'] = htmlUrl;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
