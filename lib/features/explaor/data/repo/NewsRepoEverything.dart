import 'package:dart_either/dart_either.dart';

import '../../../../core/network/api_failure.dart';
import '../models/Model_Response.dart';

abstract class NewsRepoEverything {
  Future<Either<Failure,modelResponseEverything>> geteverything({
    required String query,
    int? pageSize,
    int? page,
    String? language,
    String? from,
    String? to,
    String? sortBy,

  });
}