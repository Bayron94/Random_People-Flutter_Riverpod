import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_people_2024/features/people_random/people_random.dart';
import 'home_state.dart';

class HomeViewModel extends StateNotifier<HomeState> {
  final GetPeopleUseCase getPeopleUseCase;
  final TextEditingController searchController = TextEditingController();

  HomeViewModel(this.getPeopleUseCase) : super(const HomeState()) {
    fetchPeople();
  }

  Future<void> fetchPeople() async {
    state = state.copyWith(isLoading: true);
    final result = await getPeopleUseCase.call();
    result.fold(
      (failure) => state = state.copyWith(isLoading: false),
      (people) => state = state.copyWith(
        people: people,
        filteredPeople: people,
        isLoading: false,
      ),
    );
  }

  void filterResults(String query) {
    final filtered = state.people
        .where(
          (person) =>
              person.fullName.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
    state = state.copyWith(filteredPeople: filtered);
  }

  void navigateToDetail(BuildContext context, String personId) {
    Navigator.pushNamed(context, '/detail', arguments: personId);
  }
}
