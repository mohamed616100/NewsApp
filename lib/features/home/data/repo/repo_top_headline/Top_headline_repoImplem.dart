import 'package:dart_either/dart_either.dart';
import 'package:dio/dio.dart';
import 'package:newsapp/core/network/app_endpoint.dart';
import 'package:newsapp/features/home/data/repo/repo_top_headline/To_headline_repo.dart';
import '../../../../../core/network/api_failure.dart';
import '../../../../../core/network/api_service.dart';
import '../../models/models_top_headline/TopheadlineModel.dart';
class TopHeadlineImplemRepo implements TopHeadlineRepo{
  final ApiService apiService;
  TopHeadlineImplemRepo(this.apiService);
  Future<Either<Failure,TopheadlineModel>>getTopHeadlines({
    required String query,
    required String category,
     int? pageSize,
     int? page,
    required String country,
})async {
    try{
      final response= await apiService.get(
          endpoint:ApiEndpoints.newsTopHeadlines(
              query: query,
              category: category,
              pageSize: pageSize,
              page: page,
              country: country
          )
      );
      final news = TopheadlineModel.fromJson(response);
      return Right(news);
    }
    on DioException catch(e){
      return Left(handleDioError(e));
    }catch(e){
      return Left(ApiFailure(e.toString()));
    }
  }

}