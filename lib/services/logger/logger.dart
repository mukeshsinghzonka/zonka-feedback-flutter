import 'package:logger/logger.dart';

class LoggerService {
 
  final  _logger = Logger();


  void logDebug(String message) {
    _logger.d(message);
  }


  void logError(String message) {
    _logger.e(message);
  }

  void logInfo(String message) {
    _logger.i(message);
  }

  void logWarning(String message) {
    _logger.w(message);
  }
}