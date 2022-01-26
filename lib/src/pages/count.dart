import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final countProvider = StateProvider((ref) => 0);

class Count extends ConsumerWidget {
  const Count({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(countProvider.state).state;

    return Scaffold(
      body: Center(
        child: Text('count is $count'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(countProvider.notifier).state += 1;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
