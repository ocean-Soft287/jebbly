import 'package:logger/logger.dart';

class CustomLogger {
  static Logger logger = Logger(
      printer: PrettyPrinter(colors: true, printEmojis: true, methodCount: 0));
}