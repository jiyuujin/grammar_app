import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grammar_app/src/animated_toggle_button.dart';
import 'package:grammar_app/src/drawer_menu.dart';
import 'package:grammar_app/src/themes/dark_theme.dart';
import 'package:grammar_app/src/themes/light_theme.dart';

final themeProvider = StateProvider<String>((ref) {
  return 'light';
});

class SelectTheme extends ConsumerWidget {
  SelectTheme({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('GRAMMAR APP'),
      ),
      drawer: const DrawerMenu(),
      backgroundColor: theme == 'dark'
          ? darkMode.backgroundColor
          : lightMode.backgroundColor,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: height * 0.1),
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    width: width * 0.35,
                    height: width * 0.35,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: theme == 'dark'
                            ? darkMode.gradient
                            : lightMode.gradient,
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(40, 0),
                    child: Container(
                      width: width * 0.26,
                      height: width * 0.26,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: theme == 'dark'
                            ? darkMode.backgroundColor
                            : lightMode.backgroundColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.1,
              ),
              Text(
                'Choose a style',
                style: TextStyle(
                  color: theme == 'dark'
                      ? darkMode.textColor
                      : lightMode.textColor,
                  fontSize: width * 0.06,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Rubik',
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              SizedBox(
                width: width * 0.7,
                child: Text(
                  'Pop or subtle. Day or night. Customize your interface',
                  style: TextStyle(
                    color: theme == 'dark'
                        ? darkMode.textColor
                        : lightMode.textColor,
                    fontSize: width * 0.04,
                    fontFamily: 'Rubik',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: height * 0.06,
              ),
              AnimatedToggleButton(
                values: const ['Light', 'Dark'],
                textColor:
                    theme == 'dark' ? darkMode.textColor : lightMode.textColor,
                backgroundColor: theme == 'dark'
                    ? darkMode.toggleBackgroundColor
                    : lightMode.toggleBackgroundColor,
                buttonColor: theme == 'dark'
                    ? darkMode.toggleButtonColor
                    : lightMode.toggleButtonColor,
                shadows: theme == 'dark' ? darkMode.shadow : lightMode.shadow,
                onToggleCallback: (index) {
                  theme == 'dark'
                      ? ref.read(themeProvider.notifier).state = 'light'
                      : ref.read(themeProvider.notifier).state = 'dark';
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildDot(
      {required double width, required double height, required Color color}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: width,
      height: height,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: color,
      ),
    );
  }
}
