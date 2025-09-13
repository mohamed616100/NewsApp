import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();

  static const _defaultTimeout = Duration(seconds: 60);

  static Dio? _openWeatherDio;
  static Dio? _newsApiDio;

  static Dio get openWeatherDio {
    if (_openWeatherDio == null) {
      throw Exception('OpenWeather Dio not initialized. Call initialize() first.');
    }
    return _openWeatherDio!;
  }

  static Dio get newsApiDio {
    if (_newsApiDio == null) {
      throw Exception('NewsAPI Dio not initialized. Call initialize() first.');
    }
    return _newsApiDio!;
  }

  static Future<void> initialize() async {
    if (_openWeatherDio == null) {
      _openWeatherDio = Dio(
        BaseOptions(
          baseUrl: 'https://api.openweathermap.org/data/2.5/',
          connectTimeout: _defaultTimeout,
          receiveTimeout: _defaultTimeout,
          sendTimeout: _defaultTimeout,
          headers: {'Content-Type': 'application/json', 'Accept': '*/*'},
        ),
      );
      _addLoggingInterceptor(_openWeatherDio!);
    }

    if (_newsApiDio == null) {
      _newsApiDio = Dio(
        BaseOptions(
          baseUrl: 'https://newsapi.org/v2/',
          connectTimeout: _defaultTimeout,
          receiveTimeout: _defaultTimeout,
          sendTimeout: _defaultTimeout,
          headers: {'Content-Type': 'application/json', 'Accept': '*/*'},
        ),
      );
      _addLoggingInterceptor(_newsApiDio!);
    }
  }

  static void _addLoggingInterceptor(Dio dio) {
    if (kDebugMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
        ),
      );
    }
  }
}
