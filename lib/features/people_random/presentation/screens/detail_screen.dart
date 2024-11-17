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

    if (detailState.isLoading) {
      return const Padding(
        padding: EdgeInsets.only(top: 32),
        child: LoadingData(length: 5),
      );
    }

    return Scaffold(
      body: detailState.when(
        data: (person) => ListView(
          children: [
            PresentationHeader(person: person),
            AtributeCard(
              title: 'Name',
              subtitle: person.fullName,
              icon: Icons.person,
            ),
            AtributeCard(
              title: 'Email',
              subtitle: person.email,
              icon: Icons.email,
            ),
            AtributeCard(
              title: 'Phone',
              subtitle: person.cell,
              icon: Icons.email,
            ),
            AtributeCard(
              title: 'Address',
              subtitle: person.address,
              icon: Icons.email,
            ),
          ],
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
    );
  }
}
