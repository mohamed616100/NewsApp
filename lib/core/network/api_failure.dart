import 'dart:io';
import 'package:dio/dio.dart';

/// Base class for failures
abstract class Failure {
  final String message;
  const Failure(this.message);
}

/// General API failure
class ApiFailure extends Failure {
  const ApiFailure(super.message);

  /// Constructs failure from DioException
  factory ApiFailure.fromDio(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return const ApiFailure('انتهت مهلة الاتصال بالخادم. تحقق من الإنترنت.');
      case DioExceptionType.sendTimeout:
        return const ApiFailure('انتهت مهلة إرسال الطلب. حاول مرة أخرى.');
      case DioExceptionType.receiveTimeout:
        return const ApiFailure('انتهت مهلة استلام الاستجابة. حاول لاحقًا.');
      case DioExceptionType.badCertificate:
        return const ApiFailure('شهادة الأمان غير صالحة.');
      case DioExceptionType.badResponse:
        return ApiFailure.fromResponse(
          dioException.response?.statusCode ?? 500,
          dioException.response?.data,
        );
      case DioExceptionType.cancel:
        return const ApiFailure('تم إلغاء الطلب. حاول مرة أخرى.');
      case DioExceptionType.connectionError:
        return const ApiFailure('فشل الاتصال بالشبكة. تحقق من الإنترنت.');
      case DioExceptionType.unknown:
        if (dioException.error is SocketException) {
          return const ApiFailure('لا يوجد اتصال بالإنترنت.');
        }
        return const ApiFailure('حدث خطأ غير متوقع.');
    }
  }

  /// Constructs failure from HTTP status code and response
  factory ApiFailure.fromResponse(int statusCode, dynamic responseData) {
    String message = 'حدث خطأ غير معروف';
    if (responseData is Map<String, dynamic> && responseData['message'] != null) {
      message = responseData['message'].toString();
    }

    switch (statusCode) {
      case 400:
        return ApiFailure('طلب غير صالح: $message');
      case 401:
        return ApiFailure('غير مصرح: $message');
      case 403:
        return ApiFailure('تم رفض الوصول: $message');
      case 404:
        return ApiFailure('المورد غير موجود');
      case 408:
        return ApiFailure('انتهت مهلة الطلب');
      case 409:
        return ApiFailure('تعارض في البيانات');
      case 500:
        return ApiFailure('خطأ داخلي في الخادم');
      case 503:
        return ApiFailure('الخدمة غير متاحة حاليًا');
      default:
        return ApiFailure('خطأ برمز الحالة $statusCode');
    }
  }
}

/// Helper function to convert Dio exceptions to failures
Failure handleDioError(DioException dioException) {
  return ApiFailure.fromDio(dioException);
}
