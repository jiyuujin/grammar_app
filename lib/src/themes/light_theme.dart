import 'package:flutter/material.dart';
import 'package:grammar_app/src/models/theme_color.dart';

ThemeColor lightMode = ThemeColor(
  gradient: [
    const Color(0xDDFF0080),
    const Color(0xDDFF8C00),
  ],
  backgroundColor: const Color(0xFFFFFFFF),
  textColor: const Color(0xFF000000),
  toggleButtonColor: const Color(0xFFFFFFFF),
  toggleBackgroundColor: const Color(0xFFe7e7e8),
  shadow: const [
    BoxShadow(
      color: Color(0xFFd8d7da),
      spreadRadius: 5,
      blurRadius: 10,
      offset: Offset(0, 5),
    ),
  ],
);