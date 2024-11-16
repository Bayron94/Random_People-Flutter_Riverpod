import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:random_people_2024/features/people_random/people_random.dart';

class PeopleRemoteDatasource {
  final Dio dio;
  final Logger logger;

  PeopleRemoteDatasource(this.dio, this.logger);

  Future<List<PersonModel>> fetchPeople() async {
    try {
      final response = await dio.get('?results=20');
      final results = response.data['results'] as List;
      return results.map((json) => PersonModel.fromJson(json)).toList();
    } catch (e) {
      logger.e('Error fetching people', error: e);
      rethrow;
    }
  }

  Future<PersonModel> fetchPersonDetail(String personId) async {
    try {
      final response = await dio.get('?id=$personId');
      return PersonModel.fromJson(response.data['results'][0]);
    } catch (e) {
      logger.e('Error fetching person detail for ID: $personId', error: e);
      rethrow;
    }
  }
}
