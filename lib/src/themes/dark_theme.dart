import 'package:flutter/material.dart';
import 'package:grammar_app/src/models/theme_color.dart';

ThemeColor darkMode = ThemeColor(
  gradient: [
    const Color(0xFF8983F7),
    const Color(0xFFA3DAFB),
  ],
  backgroundColor: const Color(0xFF26242e),
  textColor: const Color(0xFFFFFFFF),
  toggleButtonColor: const Color(0xFf34323d),
  toggleBackgroundColor: const Color(0xFF222029),
  shadow: const <BoxShadow>[
    BoxShadow(
      color: Color(0x66000000),
      spreadRadius: 5,
      blurRadius: 10,
      offset: Offset(0, 5),
    ),
  ],
);
