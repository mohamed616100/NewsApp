import 'Artical_Top_Headline.dart';

class TopheadlineModel {
  String? status;
  int? totalResults;
  List<ArticlesTopheadline>? articles;

  TopheadlineModel({this.status, this.totalResults, this.articles});

  TopheadlineModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = <ArticlesTopheadline>[];
      json['articles'].forEach((v) {
        articles!.add(ArticlesTopheadline.fromJson(v));
      });
    }
  }
}