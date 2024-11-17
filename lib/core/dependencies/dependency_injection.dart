import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:random_people_2024/core/core.dart';
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
final dioProvider = Provider<Dio>((ref) {
  final dioClient = DioClient();
  return dioClient.dio;
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
