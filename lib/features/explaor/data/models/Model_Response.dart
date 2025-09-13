import 'package:newsapp/features/explaor/data/models/ArticalsModel_EveryThing.dart';
class modelResponseEverything {
  String? status;
  int? totalResults;
  List<ArticlesEveryThing>? articles;

  modelResponseEverything({this.status, this.totalResults, this.articles});

  modelResponseEverything.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = <ArticlesEveryThing>[];
      json['articles'].forEach((v) {
        articles!.add(new ArticlesEveryThing.fromJson(v));
      });
    }
  }
}


