class User {
  String id = 'placeholder_id';
  String name = 'placeholder_name';
  String username = 'placeholder_username';
  String type = 'placeholder_type';
  bool isAdmin = false;
  bool isSuperadmin = false;
  String deletedAt = '';
  String createdAt = '';
  String updatedAt = '';

  User();

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    type = json['type'];
    isAdmin = json['is_admin'];
    isSuperadmin = json['is_superadmin'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['username'] = this.username;
    data['type'] = this.type;
    data['is_admin'] = this.isAdmin;
    data['is_superadmin'] = this.isSuperadmin;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
