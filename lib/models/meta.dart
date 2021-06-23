class Meta {
  late int page = 0;
  late int pages = 1;
  late int perpage = 10;
  late int total = 1;

  Meta();

  Meta.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    pages = json['pages'];
    perpage = json['perpage'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['page'] = page;
    data['pages'] = pages;
    data['perpage'] = perpage;
    data['total'] = total;
    return data;
  }
}
