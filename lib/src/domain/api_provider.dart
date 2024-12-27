import 'package:dio/dio.dart';

class ApiProvider {
  static final Dio _dio = Dio(BaseOptions(
    headers: {
      'Cache-Control': 'no-cache',
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    },
    // Added timeout related errors handling on ui
    connectTimeout: const Duration(seconds: 60),
    sendTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 60),
  ));

  static Dio getDio() {
    return _dio;
  }
}
