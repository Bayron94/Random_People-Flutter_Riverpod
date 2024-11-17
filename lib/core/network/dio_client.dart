import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:random_people_2024/core/core.dart';

class DioClient {
  final Dio dio;

  DioClient() : dio = Dio(BaseOptions(baseUrl: Environment.baseURL)) {
    // Configurar interceptores
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        Logger().i('Request: ${options.method} ${options.uri}');
        return handler.next(options);
      },
      onResponse: (response, handler) {
        Logger().i('Response: ${response.statusCode} ${response.data}');
        return handler.next(response);
      },
      onError: (DioException error, handler) {
        Logger().e(
          'Dio Error: ${error.message}',
          error: error,
          stackTrace: error.stackTrace,
        );
        return handler.next(error);
      },
    ));
  }
}
