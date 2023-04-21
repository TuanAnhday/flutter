import 'package:logger/logger.dart';

class AppLogger {
  final _logi = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      printEmojis: false,
      printTime: false,
      lineLength: 150,
    ),
  );

  void debugLog(dynamic message) => _logi.d(message);

  void infoLog(dynamic message) => _logi.i(message);
}
