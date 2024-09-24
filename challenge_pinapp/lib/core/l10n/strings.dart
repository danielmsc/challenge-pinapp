import 'dart:ui';

import 'package:get/get.dart';

class Strings extends Translations {
  static final locales = [
    const Locale('es', 'AR'), // Add es_AR locale support
  ];

  @override
  Map<String, Map<String, String>> get keys => {
        'es_AR': {
          'posts': 'Posts',
        },
      };
}
