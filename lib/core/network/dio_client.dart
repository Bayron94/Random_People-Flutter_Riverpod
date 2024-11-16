import 'package:dio/dio.dart';
import 'package:random_people_2024/core/core.dart';

class DioClient {
  final Dio dio;

  DioClient() : dio = Dio(BaseOptions(baseUrl: Environment.baseURL));
}
