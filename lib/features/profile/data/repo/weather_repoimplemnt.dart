import 'package:dart_either/dart_either.dart';
import 'package:dio/dio.dart';
import '../../../../core/network/api_failure.dart';
import '../../../../core/network/api_service.dart';
import '../../../../core/network/app_endpoint.dart';
import '../model/weather_model.dart';
import 'weather_repo.dart';

class WeatherRepoImplem implements WeatherRepo {
  final ApiService apiService;

  WeatherRepoImplem(this.apiService);

  @override
  Future<Either<Failure, weathermodel>> getWeather({required double lat, required double lon}) async {
    try {
      final response = await apiService.get(
        endpoint: ApiEndpoints.weather(lat: lat.toString(), lon: lon.toString()),
      );

      final weather = weathermodel.fromJson(response);
      return Right(weather);

    } on DioException catch (e) {
      return Left(handleDioError(e));
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }
}
