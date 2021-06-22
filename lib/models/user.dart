class User {
  String id = 'placeholder_id';
  String name = 'placeholder_name';
  String createdAt = '';
  String updatedAt = '';

  User();

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 'placeholder_id';
    name = json['name'] ?? 'placeholder_name';
    createdAt = json['created_at'] ?? '';
    updatedAt = json['updated_at'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
