import '../data/model/weather_model.dart';

abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final weathermodel weather;
  WeatherLoaded(this.weather);
}

class WeatherError extends WeatherState {
  final String message;
  WeatherError(this.message);
}
