# [PLAGUE FOX HOMEPAGE](https://plugfox.dev)  
   
### Install firebase  
  
 + for macOS:  
```bash
brew install node
```  
  
 + for Windows:  
```bash
choco install nodejs
```  
  
then  
  
```bash
npm install -g firebase-tools
firebase login
```


### Dependencies
```bash
dart pub global activate webdev
dart pub get
```


### Serve

* uses dartdevc with Dart DevTools
```bash
webdev serve --no-release --debug web:8080
```

* uses dart2js
```bash
webdev serve --release web:8080
```

* uses firebase
```bash
cd build/
firebase serve
```


### Build
```bash
webdev build --release --output web:build
dart run pwa // if you need pwa
webdev build --release --output web:build // again if you need pwa
```

### Generate PWA
```bash
webdev build --release --output web:build
cd build
rm -rf packages .firebase .dart_tool
dart run pwa
```

then add `// @dart=2.9` at pwa.dart for unsound null safety
and rebuild project with

```bash
webdev build --release --output web:build
```

### Publish  
  
```bash
cd build/
firebase deploy --only hosting --project plug-fox -m "<Описание ручного релиза>"
```