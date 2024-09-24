import 'package:flutter/material.dart';

class Styles {
  static TextStyle titleStyle() {
    return const TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  }

  static TextStyle bodyStyle() {
    return const TextStyle(fontSize: 16, fontWeight: FontWeight.normal);
  }

  static TextStyle emailStyle() {
    return const TextStyle(
        fontSize: 14, fontWeight: FontWeight.normal, color: Colors.grey);
  }
}
