import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grammar_app/src/drawer_menu.dart';
import 'package:grammar_app/src/loading.dart';

class Photos extends StatelessWidget {
  const Photos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /**
     * StreamBuilder
     * データの更新がある度に更新する
     */
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('photos').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final List<DocumentSnapshot> documents = snapshot.data!.docs;
          return Scaffold(
            appBar: AppBar(
              title: const Text('GRAMMAR APP'),
            ),
            drawer: const DrawerMenu(),
            body: SingleChildScrollView(
              // physics: ScrollPhysics(),
              child: Column(
                children: <Widget>[
                  ListView(
                    shrinkWrap: true,
                    // physics: ScrollPhysics(),
                    children: documents.map((doc) => Card(
                      child: Column(
                        children: <Widget>[
                          Image.network(doc['content']),
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: ListTile(
                              title: Text(doc['name'].toString()),
                              leading: const Icon(
                                Icons.airplanemode_active
                              ),
                            ),
                          ),
                        ],
                      ),
                    )).toList(),
                  ),
                ],
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return const Text('Error');
        }
        return const Loading();
      }
    );
  }
}
