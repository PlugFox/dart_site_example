import 'dart:developer' as developer;

import 'package:meta/meta.dart';

const Logger l = Logger._();

@immutable
class Logger {
  const Logger._();

  /// Emit a log event.
  ///
  /// This function was designed to map closely to the logging information
  /// collected by `package:logging`.
  ///
  /// - [message] is the log message
  /// - [level] (optional) is the severity level
  /// - [name] (optional) is the name of the source of the log message
  void log(
    String message, {
    Level level = Level.info,
    String name = '',
  }) {
    assert(() {
      developer.log(
        message,
        time: DateTime.now(),
        level: level.value,
        name: name,
      );
      return true;
    }(), 'Исключаем этот код из продакшена');
  }

  /// Emit a warning log event.
  ///
  /// This function was designed to map closely to the logging information
  /// collected by `package:logging`.
  ///
  /// - [message] is the log message
  /// - [level] (optional) is the severity level
  /// - [name] (optional) is the name of the source of the log message
  /// - [error] (optional) an error object associated with this log event
  /// - [stackTrace] (optional) a stack trace associated with this log event
  void warning(
    Object message, {
    Level level = Level.warning,
    String name = '',
    Object? error,
    StackTrace? stackTrace,
  }) {
    assert(() {
      developer.log(
        message.toString(),
        time: DateTime.now(),
        level: level.value,
        name: name,
        error: error ?? message,
        stackTrace: stackTrace,
      );
      return true;
    }(), 'Исключаем этот код из продакшена');
  }

  /// Emit a error log event.
  ///
  /// This function was designed to map closely to the logging information
  /// collected by `package:logging`.
  ///
  /// - [error] an error object associated with this log event
  /// - [level] (optional) is the severity level
  /// - [name] (optional) is the name of the source of the log message
  /// - [stackTrace] (optional) a stack trace associated with this log event
  void error(
    Object message, {
    Level level = Level.severe,
    String name = '',
    Object? error,
    StackTrace? stackTrace,
  }) {
    assert(() {
      developer.log(
        message.toString(),
        time: DateTime.now(),
        level: level.value,
        name: name,
        error: error ?? message,
        stackTrace: stackTrace,
      );
      return true;
    }(), 'Исключаем этот код из продакшена');
  }
}

/// [Level]s to control logging output. Logging can be enabled to include all
/// levels above certain [Level]. [Level]s are ordered using an integer
/// value [Level.value]. The predefined [Level] constants below are sorted as
/// follows (in descending order): [Level.SHOUT], [Level.SEVERE],
/// [Level.WARNING], [Level.INFO], [Level.CONFIG], [Level.FINE], [Level.FINER],
/// [Level.FINEST], and [Level.ALL].
///
/// We recommend using one of the predefined logging levels. If you define your
/// own level, make sure you use a value between those used in [Level.ALL] and
/// [Level.OFF].
@immutable
class Level implements Comparable<Level> {
  final String name;

  /// Unique value for this level. Used to order levels, so filtering can
  /// exclude messages whose level is under certain value.
  final int value;

  const Level(this.name, this.value);

  /// Special key to turn on logging for all levels ([value] = 0).
  static const Level all = Level('ALL', 0);

  /// Special key to turn off all logging ([value] = 2000).
  static const Level off = Level('OFF', 2000);

  /// Key for highly detailed tracing ([value] = 300).
  static const Level finest = Level('FINEST', 300);

  /// Key for fairly detailed tracing ([value] = 400).
  static const Level finer = Level('FINER', 400);

  /// Key for tracing information ([value] = 500).
  static const Level fine = Level('FINE', 500);

  /// Key for static configuration messages ([value] = 700).
  static const Level config = Level('CONFIG', 700);

  /// Key for informational messages ([value] = 800).
  static const Level info = Level('INFO', 800);

  /// Key for potential problems ([value] = 900).
  static const Level warning = Level('WARNING', 900);

  /// Key for serious failures ([value] = 1000).
  static const Level severe = Level('SEVERE', 1000);

  /// Key for extra debugging loudness ([value] = 1200).
  static const Level shout = Level('SHOUT', 1200);

  static const List<Level> levels = <Level>[all, finest, finer, fine, config, info, warning, severe, shout, off];

  @override
  bool operator ==(Object other) => other is Level && value == other.value;

  bool operator <(Level other) => value < other.value;

  bool operator <=(Level other) => value <= other.value;

  bool operator >(Level other) => value > other.value;

  bool operator >=(Level other) => value >= other.value;

  @override
  int compareTo(Level other) => value - other.value;

  @override
  int get hashCode => value;

  @override
  String toString() => name;
}
