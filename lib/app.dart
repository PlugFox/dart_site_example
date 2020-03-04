import 'dart:async';
import 'dart:html';
import 'package:meta/meta.dart' show immutable;
import 'package:plugfox/src/components/title.dart';

@immutable
class App {
  FutureOr<void> init() =>
    document.body
      ..append(title);

  @override
  int get hashCode => 0;
  @override
  bool operator ==(Object obj) =>
    obj is App;

  // SINGLETON +
  static final App _singleton = App._internal();
  factory App() => _singleton;
  App._internal();
  // SINGLETON -
}