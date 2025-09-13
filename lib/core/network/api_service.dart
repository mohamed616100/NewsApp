import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio) {
    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
      ),
    );
  }

  /// Generic GET request
  Future<dynamic> get({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    String? customBaseUrl,
  }) async {
    final String baseUrl = customBaseUrl ?? dio.options.baseUrl;
    final String url = baseUrl + endpoint;

    try {
      final response = await dio.get(
        url,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      throw Exception(
          'GET request failed: ${e.response?.statusCode} ${e.message}');
    } catch (e) {
      throw Exception('GET request failed: $e');
    }
  }
}
