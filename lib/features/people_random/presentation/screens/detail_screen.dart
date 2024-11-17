import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../viewmodels/viewmodels.dart';
import '../widgets/widgets.dart';

class DetailScreen extends ConsumerWidget {
  final String personId;

  const DetailScreen({super.key, required this.personId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailState = ref.watch(detailProvider(personId));
    final detailNotifier = ref.read(detailProvider(personId).notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Person Detail')),
      body: detailState.when(
        data: (person) => ListView(
          children: [
            AtributeCard(
              title: 'Name',
              subtitle: person.fullName,
              icon: Icons.person,
              onTap: () {},
            ),
            AtributeCard(
              title: 'Email',
              subtitle: person.email,
              icon: Icons.email,
              onTap: () => detailNotifier.openEmail(person.email),
            ),
          ],
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
    );
  }
}
