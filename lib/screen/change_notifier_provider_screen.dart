import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/provider/cart_change_notifier.dart';

class ChangeNotifierProviderScreen extends ConsumerWidget {
  const ChangeNotifierProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartChangeNotifierWatch = ref.watch(cartChangeNotifierProvider);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (var item in cartChangeNotifierWatch.cart)
            Center(child: Text(item.toString())),
          TextButton(
              onPressed: () {
                int i = Random().nextInt(90);
                ref.read(cartChangeNotifierProvider.notifier).addProduct('이성림${i.toString()}');
              },
              child: const Text('리스트에 추가'))
        ],
      ),
    );
  }
}
