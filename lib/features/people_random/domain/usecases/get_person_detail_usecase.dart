import 'package:dartz/dartz.dart';
import 'package:random_people_2024/core/core.dart';
import 'package:random_people_2024/features/people_random/people_random.dart';

class GetPersonDetailUseCase {
  final PeopleRepository repository;

  GetPersonDetailUseCase(this.repository);

  Future<Either<Failure, Person>> call(String personId) async {
    return await repository.getPersonDetail(personId);
  }
}
