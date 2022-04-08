import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_theme_selector/theme.dart';
import 'package:grammar_app/src/controllers/theme_controller.dart';
import 'package:grammar_app/src/drawer_menu.dart';

class SelectTheme extends ConsumerWidget {
  SelectTheme({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeSelectorProvider);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('GRAMMAR APP'),
      ),
      drawer: const DrawerMenu(),
      body: ThemePage(
        themeMode: themeMode,
        onToggleCallback: (enabled) => {
          if (enabled)
            {ref.read(themeSelectorProvider.notifier).state = ThemeMode.dark}
          else
            {ref.read(themeSelectorProvider.notifier).state = ThemeMode.light}
        },
      ),
    );
  }
}
