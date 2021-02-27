# [PLAGUE FOX HOMEPAGE](https://plugfox.dev)  

### Dependencies
```bash
dart pub global activate webdev
dart pub get
```

### How ot serve

* uses dartdevc with Dart DevTools
```bash
webdev serve --no-release --debug web:8080
```

* uses dart2js
```bash
webdev serve --release web:8080
```

### How ot build
```bash
webdev build --release --output web:build
dart compile js --output web:build
```
