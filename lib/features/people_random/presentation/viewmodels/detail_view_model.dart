import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_people_2024/features/people_random/people_random.dart';

class DetailViewModel extends StateNotifier<AsyncValue<Person>> {
  final String personId;
  final GetPersonDetailUseCase getPersonDetailUseCase;

  DetailViewModel(this.personId, this.getPersonDetailUseCase)
      : super(const AsyncValue.loading()) {
    fetchPersonDetail();
  }

  Future<void> fetchPersonDetail() async {
    try {
      final result = await getPersonDetailUseCase.call(personId);
      result.fold(
        (failure) => state = AsyncValue.error(failure, StackTrace.current),
        (person) => state = AsyncValue.data(person),
      );
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  void openEmail(String email) {
    // Logic to open email app
  }
}
