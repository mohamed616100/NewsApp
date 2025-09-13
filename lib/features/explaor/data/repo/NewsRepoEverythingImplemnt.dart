import 'package:dart_either/dart_either.dart';
import 'package:dio/dio.dart';
import 'package:newsapp/core/network/app_endpoint.dart';
import '../../../../../core/network/api_failure.dart';
import '../../../../../core/network/api_service.dart';
import '../models/Model_Response.dart';
import 'NewsRepoEverything.dart';
class Newsrepoeverythingimplemnt implements NewsRepoEverything{
  final ApiService apiService;
  Newsrepoeverythingimplemnt(this.apiService);
  @override
  Future<Either<Failure,modelResponseEverything>>geteverything({
    required String query,
    int? pageSize,
    int? page,
    String? language,
    String? from,
    String? to,
    String? sortBy,
  })async {
    try{
      final response= await apiService.get(endpoint:
            ApiEndpoints.newsEverything(
                query: query,
                pageSize: pageSize,
                page: page,
                language:language,
                from: from,
                to: to,
                sortBy: sortBy
            )
      );
      final news = modelResponseEverything.fromJson(response);
      return Right(news);
    }
    on DioException catch(e){
      return Left(handleDioError(e));
    }catch(e){
      return Left(ApiFailure(e.toString()));
    }
  }

}