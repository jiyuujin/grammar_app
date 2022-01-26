import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:grammar_app/src/pages/photos_render.dart';
import 'package:grammar_app/src/pages/select_theme.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Drawer build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return Drawer(
      child: Column(children: [
        UserAccountsDrawerHeader(
          accountName: Text(appLocalizations.contact),
          accountEmail: const Text('yuma.kitamura@ponos.co.jp'),
        ),
        ListTile(
          title: Text(appLocalizations.photos),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => const Photos(),
              ),
            );
          },
        ),
        ListTile(
          title: Text(appLocalizations.selectTheme),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => SelectTheme(),
              ),
            );
          },
        ),
      ]),
    );
  }
}
