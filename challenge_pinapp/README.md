# challenge_pinapp

App Flutter para realizar llamados a la [API JSONPlaceholder](https://jsonplaceholder.typicode.com/).

## Requisitos

- Flutter 3.24.3
- Dart
- Un dispositivo Android

## Dependencias

Este proyecto utiliza las siguientes dependencias:

- [get](https://pub.dev/packages/get): gestión del estado y la navegación.
- [dio](https://pub.dev/packages/dio): para realizar solicitudes HTTP.
- [dartz](https://pub.dev/packages/dartz): programación funcional en Dart.
- [flutter_localization](https://pub.dev/packages/flutter_localization): para poder configurar la regionalización de los strings.

Para las pruebas, este proyecto utiliza:

- [flutter_test](https://api.flutter.dev/flutter/flutter_test/flutter_test-library.html): para realizar pruebas unitarias.
- [mockito](https://pub.dev/packages/mockito): para crear objetos mockeados.
- [build_runner](https://pub.dev/packages/build_runner): para generar código automáticamente.


## Ejecución de la app

En primer lugar, se requiere obtener las dependencias necesarias. Para ello, ejecutá el siguiente comando:

```bash
flutter pub get
```

Luego, para correr la app en un dispositivo físico o emulador, utilizá el comando:

```bash
flutter run
```

## Ejecución de los tests unitarios

Primero, es obligatorio ejecutar el siguiente comando para poder generar los mocks y así poder correr los tests unitarios:

```bash
dart run build_runner build
```

Para ejecutar los tests unitarios se requiere correr el comando:

```bash
flutter test
```
