import 'package:logging/logging.dart';
import 'package:maddalena/core/logging/maddalena_logger.dart';

class MaddalenaDefaultLoggerImpl implements MaddalenaLogger {
  MaddalenaDefaultLoggerImpl({
    required this.name,
  }) : _logger = Logger(name);

  final String name;
  late final Logger _logger;

  @override
  void error(String message) {
    _logger.severe(message);
  }

  @override
  void warn(String message) {
    _logger.warning(message);
  }

  @override
  void info(String message) {
    _logger.info(message);
  }

  @override
  void debug(String message) {
    _logger.config(message);
  }

  @override
  void trace(String message) {
    _logger.finest(message);
  }
}
