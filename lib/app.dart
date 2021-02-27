import 'dart:async';
import 'dart:html' as html;

import 'package:homepage/src/common/utility/l.dart';
import 'package:rxdart/rxdart.dart';

void start() => runZonedGuarded(
      _qrSetOnClickCallback,
      (error, stackTrace) {
        l.error(error.toString(), error: error, stackTrace: stackTrace, name: 'TOP_LEVEL_ERROR');
      },
    );

void _qrSetOnClickCallback() {
  final document = html.document;
  final elements = document
      .getElementsByClassName('icon-qrcode')
      .map<html.Element?>((e) => e.parent)
      .whereType<html.AnchorElement>()
      .toList(growable: false);
  if (elements.isEmpty) return;
  final button = elements.first;
  final qrElement = document.getElementById('qr-overlay');
  if (qrElement == null) return;
  qrElement.onClick.throttleTime(const Duration(milliseconds: 500)).forEach((_) {
    qrElement
      ..hidden = true
      ..style.display = 'none';
  });
  button.onClick.throttleTime(const Duration(milliseconds: 500)).forEach((_) {
    document.getElementById('qr-overlay')
      ?..hidden = false
      ..style.display = 'block';
  });
}
