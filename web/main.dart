import 'dart:html' show window, document, Event;
import 'package:plugfox/app.dart';
import 'package:pwa/client.dart' as pwa;
import 'package:service_worker/window.dart' as sw;

void main() {
  pwa.Client();
  _registerServiceWorker();
  App()..init();
}

Future<void> _registerServiceWorker() async {
  try {
    if (sw.isNotSupported) {
      throw UnsupportedError('ServiceWorkers are not supported.');
    }
    await sw.register('sw.dart.js');
  } catch (e) {
    window.console.warn(e.toString());
  }
  return Future.value(null);
}