import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final loggerProvider = Provider((ref) {
  return Logger(
    printer: PrettyPrinter(),
  );
});
