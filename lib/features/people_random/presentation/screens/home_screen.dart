import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../viewmodels/viewmodels.dart';
import '../widgets/widgets.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeProvider);
    final homeNotifier = ref.read(homeProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Random People')),
      body: Column(
        children: [
          PersistentTextField(
            controller: homeNotifier.searchController,
            hintText: 'Search...',
            onChanged: homeNotifier.filterResults,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: homeState.filteredPeople.length,
              itemBuilder: (context, index) {
                final person = homeState.filteredPeople[index];
                return AtributeCard(
                  title: person.fullName,
                  subtitle: person.email,
                  icon: Icons.person,
                  onTap: () => homeNotifier.navigateToDetail(
                    context,
                    person.id,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
