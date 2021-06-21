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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['pages'] = this.pages;
    data['perpage'] = this.perpage;
    data['total'] = this.total;
    return data;
  }
}
