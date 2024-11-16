import 'package:dartz/dartz.dart';
import 'package:random_people_2024/core/core.dart';
import 'package:random_people_2024/features/people_random/people_random.dart';

class GetPeopleUseCase {
  final PeopleRepository repository;

  GetPeopleUseCase(this.repository);

  Future<Either<Failure, List<Person>>> call() async {
    return await repository.getPeople();
  }
}
