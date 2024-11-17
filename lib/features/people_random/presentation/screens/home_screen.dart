import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_people_2024/core/theme/theme.dart';

import '../viewmodels/viewmodels.dart';
import '../widgets/widgets.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeProvider);
    final homeNotifier = ref.read(homeProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Random People',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        elevation: 2,
        shadowColor: customHintColor,
      ),
      body: Column(
        children: [
          SearchTextField(
            controller: homeNotifier.searchController,
            hintText: 'Search...',
            onChanged: homeNotifier.filterResults,
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                await homeNotifier.fetchPeople();
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ListView.separated(
                  itemCount: homeState.filteredPeople.length,
                  itemBuilder: (context, index) {
                    final person = homeState.filteredPeople[index];

                    if (homeState.isLoading) {
                      return const LoadingData();
                    }
                    return PresentationCard(
                      person: person,
                      onTap: () => homeNotifier.navigateToDetail(
                        context,
                        person.id,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 18);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
