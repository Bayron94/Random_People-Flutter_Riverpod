import 'package:dartz/dartz.dart';
import 'package:random_people_2024/core/core.dart';
import 'package:random_people_2024/features/people_random/people_random.dart';

abstract class PeopleRepository {
  Future<Either<Failure, List<Person>>> getPeople();
  Future<Either<Failure, Person>> getPersonDetail(String personId);
}
