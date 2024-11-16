import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:random_people_2024/core/core.dart';
import 'package:random_people_2024/features/people_random/people_random.dart';

class PeopleRepositoryImpl implements PeopleRepository {
  final PeopleRemoteDatasource datasource;
  final Logger logger;

  PeopleRepositoryImpl(this.datasource, this.logger);

  @override
  Future<Either<Failure, List<Person>>> getPeople() async {
    try {
      final people = await datasource.fetchPeople();
      return Right(people.map((model) => model.toEntity()).toList());
    } catch (err) {
      const message = 'Error in getPeople';
      logger.e(message, error: err);
      return Left(ServerFailure(message: message));
    }
  }

  @override
  Future<Either<Failure, Person>> getPersonDetail(String personId) async {
    try {
      final person = await datasource.fetchPersonDetail(personId);
      return Right(person.toEntity());
    } catch (err) {
      final message = 'Error in getPersonDetail for ID: $personId';
      logger.e(message, error: err);
      return Left(ServerFailure(message: message));
    }
  }
}
