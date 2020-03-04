@echo off
@echo.
@echo ~~~ BUILD ~~~
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
@timeout 5