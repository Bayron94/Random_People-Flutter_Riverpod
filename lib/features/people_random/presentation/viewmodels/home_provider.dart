import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_people_2024/core/core.dart';
import 'home_view_model.dart';
import 'home_state.dart';

final homeProvider = StateNotifierProvider<HomeViewModel, HomeState>(
  (ref) {
    final getPeopleUseCase = ref.read(getPeopleUseCaseProvider);
    return HomeViewModel(getPeopleUseCase);
  },
);
