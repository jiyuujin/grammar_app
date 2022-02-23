import 'package:flutter/material.dart';
import 'package:flutter_theme_selector/theme.dart';
import 'package:grammar_app/src/drawer_menu.dart';

class SelectTheme extends StatelessWidget {
  SelectTheme({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('GRAMMAR APP'),
      ),
      drawer: const DrawerMenu(),
      body: const ThemePage(),
    );
  }
}
