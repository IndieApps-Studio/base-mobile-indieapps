class User {
  int id = -1;
  String name = 'placeholder_name';
  String htmlUrl = 'placeholder_htmlUrl';
  String createdAt = '';
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
