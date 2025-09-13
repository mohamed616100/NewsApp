
import 'package:dart_either/dart_either.dart';
import 'package:newsapp/core/network/api_failure.dart';

import '../../models/models_top_headline/TopheadlineModel.dart';

abstract class TopHeadlineRepo {
  Future<Either<Failure,TopheadlineModel>> getTopHeadlines({
    required String query,
    required String category,
     int? pageSize,
     int? page,
    required String country,
});
}