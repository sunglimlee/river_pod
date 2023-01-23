import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/cart_state_notifier.dart';

class StateNotifierProviderScreen extends ConsumerWidget {
  const StateNotifierProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartStateNotifierWatch = ref.watch(cartStateNotifierProvider);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (var item in cartStateNotifierWatch)
            Center(child: Text(item.toString())),
          TextButton(
              onPressed: () {
                int i = Random().nextInt(90);
                ref.read(cartStateNotifierProvider.notifier).addProduct('이성림${i.toString()}');
              },
              child: const Text('리스트에 추가'))
        ],
      ),
    );
  }
}
