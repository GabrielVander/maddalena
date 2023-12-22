import 'package:flutter_test/flutter_test.dart';
import 'package:logging/logging.dart';
import 'package:maddalena/core/logging/impl/maddalena%20_default_logger_impl.dart';

void main() {
  late MaddalenaDefaultLoggerImpl logger;

  setUp(() {
    Logger.root.level = Level.ALL;
    logger = MaddalenaDefaultLoggerImpl(name: 'MaddalenaDefaultLoggerImplTest');
  });

  test('error', () {
    logger.error('bZzJYnrQWR');
  });

  test('warn', () {
    logger.warn('6MlJUONXbc');
  });

  test('info', () {
    logger.info('FZv5qw86aUG');
  });

  test('debug', () {
    logger.debug('78MajJM');
  });

  test('trace', () {
    logger.trace('1IBvkrx');
  });
}
