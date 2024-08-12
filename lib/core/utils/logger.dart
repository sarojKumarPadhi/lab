import 'package:logger/logger.dart';

class Log {
  static Logger logger = Logger();
  static void trace(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) =>
      logger.t(message,
          time: DateTime.now(), error: error, stackTrace: stackTrace);
  static void debug(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) =>
      logger.d(message,
          time: DateTime.now(), error: error, stackTrace: stackTrace);
  static void info(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) =>
      logger.i(message,
          time: DateTime.now(), error: error, stackTrace: stackTrace);
  static void warning(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) =>
      logger.w(message,
          time: DateTime.now(), error: error, stackTrace: stackTrace);
  static void error(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) =>
      logger.e(message,
          time: DateTime.now(), error: error, stackTrace: stackTrace);

  // Implement logic to handle the formatted message, e.g., output to console, save to file, etc.

  String _formatMessage(String level, String message) {
    return '${DateTime.now()} [$level] $message';
  }
}
