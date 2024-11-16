import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String baseURL = dotenv.env['API_BASE_URL'] ?? '';
}
