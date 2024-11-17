import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get baseURL => dotenv.env['API_BASE_URL'] ?? '';
}
