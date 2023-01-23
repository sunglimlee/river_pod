import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/provider/value_provider.dart';

class ValueProviderScreen extends ConsumerWidget {
  const ValueProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final valueWatch = ref.watch(valueProvider);
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Text('정해져 있는 값은 $valueWatch 입니다.'),
            Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                return Text('Consumer Widget 사용한 값은 $valueWatch 입니다.');
              },
            )
          ],
        ),
      ),
    );
  }
}
