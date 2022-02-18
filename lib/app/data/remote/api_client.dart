import 'package:dio/dio.dart';

class ApiClient {
  final Dio client;

  ApiClient(String baseUrl)
      : client = Dio(BaseOptions(baseUrl: baseUrl))
          ..interceptors.add(LogInterceptor(responseBody: true));
}
