import 'package:dart_either/dart_either.dart';
import 'package:newsapp/features/profile/data/model/weather_model.dart';
import '../../../../core/network/api_failure.dart';
abstract class WeatherRepo {
  /// Fetches weather data for given latitude and longitude
  Future<Either<Failure,weathermodel>> getWeather({
    required double lat,
    required double lon,
  });
}


