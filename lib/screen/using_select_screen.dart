import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/data/user.dart';
import 'package:river_pod/provider/state_provider.dart';
import 'package:river_pod/provider/value_provider.dart';

class UsingSelectScreen extends ConsumerWidget {
  const UsingSelectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // state 다 state 는 immutable 이므로 카피해서 update 를 해주어라. 꼭 꼭 기억하도록 하자. ⭐⭐⭐⭐⭐⭐⭐⭐⭐️
    final userWatch = ref.watch(userStateProvider);
    final user2Watch = ref.watch(userProvider); // 작동안한다. 그냥 일반적인 값을 사용하도록 한다.
    final boolWatch = ref.watch(boolStateProvider); // initial value is false
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 여기서 name 만 사용한다고 가정하고 select 를 쓴다.
            Text('user.name 의 값은 : ${ref.watch(userStateProvider.select((value) => value.name))}'),
            Text('user.age 의 값은 : ${userWatch.age.toString()}'),
            Text('Consumer Widget 으로 사용한 값은 $boolWatch 입니다.'),
            TextButton(
                onPressed: () {
                  // 이렇게 하니깐 값이 안바뀐다. 이유는 아래에서
                  // https://stackoverflow.com/questions/73078012/riverpod-state-update-does-not-rebuild-the-widget
                  //ref.read(userStateProvider.notifier).state.name = '이주호';
                  // 이렇게 새로운 값을 카피해서 그걸 다시 넣어주어야 한다. 왜냐하면 stateProvider 는 stateNotifierProvider 의 축소판이고 immutable 이어야 하니깐.
                  User user = User(
                      name: ref.read(userStateProvider).name,
                      age: ref.read(userStateProvider).age);
                  user.name = '이주호';
                  ref.read(userStateProvider.notifier).update((state) => user);
                  //ref.read(boolStateProvider.notifier).state = !ref.read(boolStateProvider.notifier).state;
                },
                child: const Text('이름 변경')),
            TextButton(
                onPressed: () {
                  User user = User(
                      name: ref.read(userStateProvider).name,
                      age: ref.read(userStateProvider).age);
                  user.age = 35;
                  ref.read(userStateProvider.notifier).update((state) => user);
                  //ref.read(boolStateProvider.notifier).state = !ref.read(boolStateProvider.notifier).state;
                },
                child: const Text('나이 변경')),
          ],
        ),
      ),
    );
  }
}
