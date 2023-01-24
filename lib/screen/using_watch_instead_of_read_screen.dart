import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/provider/state_provider.dart';

class UsingWatchInstreadOfReadScreen extends ConsumerWidget {
  const UsingWatchInstreadOfReadScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final countWatch = ref.watch(countStateProvider);
    return Scaffold(
      appBar: AppBar(),
      body: Center( // 정렬을 이렇게 하는구나.
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(countWatch.toString()),
          TextButton(onPressed: (){
            ref.read(countStateProvider.notifier).state++;
          }, child: const Text('ref.read 를 이용해서 값을 변경')),
          TextButton(onPressed: (){
            ref.watch(countStateProvider.notifier).state++;
          }, child: const Text('ref.watch 를 이용해서 값을 변경\n이렇게 watch 를 써도 아무 이상없이 똑같이 된다.')),
        ]),
      ),
    );
  }
}
