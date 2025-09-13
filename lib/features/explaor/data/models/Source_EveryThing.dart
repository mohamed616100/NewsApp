class SourceEveryThing {
  String? id;
  String? name;

  SourceEveryThing({this.id, this.name});

  SourceEveryThing.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

}
