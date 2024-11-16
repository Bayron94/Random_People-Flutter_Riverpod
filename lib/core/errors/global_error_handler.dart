import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:ui';

import '../dependencies/dependency_injection.dart';

void setupErrorHandling(ProviderContainer container) {
  final logger = container.read(loggerProvider);

  // Captura de errores en Flutter
  FlutterError.onError = (FlutterErrorDetails details) {
    logger.e(
      'Flutter Error',
      error: details.exception,
      stackTrace: details.stack,
    );
  };

  // Captura de errores no controlados (código nativo o Dart puro)
  PlatformDispatcher.instance.onError = (error, stack) {
    logger.e(
      'Unhandled Error',
      error: error,
      stackTrace: stack,
    );
    return true;
  };
}
