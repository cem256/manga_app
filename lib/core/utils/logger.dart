import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class Log {
  late Logger logger;

  static Log? _instance;
  static Log get instance {
    _instance ??= Log._init();
    return _instance!;
  }

  Log._init() {
    logger = Logger();
  }

  void d(dynamic message) => kDebugMode ? logger.d(message) : null; // Debug (Blue)

  void v(dynamic message) => kDebugMode ? logger.v(message) : null; // Verbose (Grey)

  void w(dynamic message) => kDebugMode ? logger.w(message) : null; // Warning (Orange)

  void e(dynamic message) => kDebugMode ? logger.e(message) : null; // Error (Red)

  void i(dynamic message) => kDebugMode ? logger.i(message) : null; // Info (Blue)

  void wtf(dynamic message) => kDebugMode ? logger.wtf(message) : null; // Wtf (Pink)
}
