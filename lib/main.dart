import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grammar_app/src/loading.dart';
import 'package:grammar_app/src/pages/photos_render.dart';

void main() async {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Container(
            margin: const EdgeInsets.all(10),
            color: Colors.white,
            child: const ListTile(
              title: Text('Error'),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            home: Scaffold(
              body: Column(
                children: const <Widget>[
                  // ToDo: riverpod test
                  // Expanded(
                  //   child: Count(),
                  // ),
                  Expanded(
                    child: Photos(),
                  ),
                ],
              ),
            ),
            darkTheme: ThemeData.dark(),
          );
        }
        return const Loading();
      },
    );
  }
}
