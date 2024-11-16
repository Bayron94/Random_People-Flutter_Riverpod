import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:random_people_2024/features/people_random/people_random.dart';

// Logger Provider
final loggerProvider = Provider((ref) {
  return Logger(
    printer: PrettyPrinter(
      // Formato legible para desarrollo
      colors: true,
      dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
    ),
  );
});

// Dio Provider
final dioProvider = Provider((ref) {
  final logger = ref.read(loggerProvider);
  final dio = Dio();

  // Configuración del interceptor para loggeo de errores
  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) {
      logger.i('Request: ${options.method} ${options.uri}');
      return handler.next(options);
    },
    onResponse: (response, handler) {
      logger.i('Response: ${response.statusCode} ${response.data}');
      return handler.next(response);
    },
    onError: (DioException error, handler) {
      logger.e(
        'Dio Error: ${error.message}',
        error: error,
        stackTrace: error.stackTrace,
      );
      return handler.next(error);
    },
  ));

  return dio;
});

// Remote Datasource Provider
final peopleRemoteDatasourceProvider = Provider((ref) {
  final dio = ref.read(dioProvider);
  final logger = ref.read(loggerProvider);
  return PeopleRemoteDatasource(dio, logger);
});

// Repository Provider
final peopleRepositoryProvider = Provider((ref) {
  final datasource = ref.read(peopleRemoteDatasourceProvider);
  final logger = ref.read(loggerProvider);
  return PeopleRepositoryImpl(datasource, logger);
});

// Use Case Providers
final getPeopleUseCaseProvider = Provider((ref) {
  final repository = ref.read(peopleRepositoryProvider);
  return GetPeopleUseCase(repository);
});

final getPersonDetailUseCaseProvider = Provider((ref) {
  final repository = ref.read(peopleRepositoryProvider);
  return GetPersonDetailUseCase(repository);
});
