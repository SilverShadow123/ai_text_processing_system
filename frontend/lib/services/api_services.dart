import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ApiService extends GetxService {
  late final Dio _dio;

  static const String baseUrl = 'http://10.0.2.2:8000';

  ApiService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    _dio.interceptors.add(
      LogInterceptor(requestBody: true, responseBody: true),
    );
  }

  Future<Map<String, dynamic>> processText({
    required String email,
    required String text,
    String url = '',
  }) async {
    final response = await _dio.post(
      '/process',
      data: {'email': email, 'text': text, 'url': url},
    );
    return response.data as Map<String, dynamic>;
  }
}