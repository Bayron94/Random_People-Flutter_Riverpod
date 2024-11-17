import 'package:flutter/material.dart';
import 'package:random_people_2024/features/people_random/presentation/screens/screens.dart';

class AppRoutes {
  static const String home = '/';
  static const String detail = '/detail';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case detail:
        final personId = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => DetailScreen(personId: personId),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('No route defined')),
          ),
        );
    }
  }
}
