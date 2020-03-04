@echo off
@echo.
@echo ~~~ PUBLISH ~~~
@echo.
@call pub get
@echo.
@call pub run build_runner build
@echo.
@call webdev build -r
@echo.
@call pub run pwa
@echo.
@call webdev build -r
@echo.
@call firebase deploy --only hosting:plug-fox
@echo.
@timeout 5