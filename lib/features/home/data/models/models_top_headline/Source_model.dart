class SourceTopHeadline {
  String? id;
  String? name;

  SourceTopHeadline({this.id, this.name});

  SourceTopHeadline.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
