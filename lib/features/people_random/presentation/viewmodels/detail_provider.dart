import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_people_2024/core/core.dart';
import 'package:random_people_2024/features/people_random/people_random.dart';
import 'detail_view_model.dart';

final detailProvider =
    StateNotifierProvider.family<DetailViewModel, AsyncValue<Person>, String>(
  (ref, personId) {
    final getPersonDetailUseCase = ref.read(getPersonDetailUseCaseProvider);
    return DetailViewModel(personId, getPersonDetailUseCase);
  },
);
