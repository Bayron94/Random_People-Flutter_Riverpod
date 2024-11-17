import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:random_people_2024/features/people_random/people_random.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default([]) List<Person> people,
    @Default([]) List<Person> filteredPeople,
    @Default(false) bool isLoading,
  }) = _HomeState;
}
