import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/provider/state_provider.dart';

class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final boolWatch = ref.watch(boolStateProvider); // inital value is false
    final boolUsingFamilyWatch = ref.watch(boolUsingFamilyModifierStateProvider(
        true)); // when watch I gave true this provider.
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.center,
        child: Column(
          children: [
            Text('일반 bool provider 의 정해져 있는 값은 $boolWatch 입니다.'),
            Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                return Text('Consumer Widget 으로 사용한 값은 $boolWatch 입니다.');
              },
            ),
            TextButton(
                onPressed: () {
                  ref.read(boolStateProvider.notifier).state =
                      !ref.read(boolStateProvider.notifier).state;
                },
                child: const Text('Change value')),
            TextButton(
              onPressed: () {
                ref.invalidate(boolStateProvider);
              },
              child: const Text('invalidate value'),
            ),
            const Divider(
              height: 20,
              thickness: 5,
              color: Colors.black,
              indent: 0,
              endIndent: 20,
            ),
            const Text(
                '이거 자체가 의미가 없다.\n family modifier 는 주고 새로운 객체들을 생성해서 사용하는건데.. staticProvider 는 간단한 값을 넣는데 family 를 굳이 사용할 필요가 없다.family 는 주로 객체를 초기화 해서 그 객체를 사용하고자 할 때 사용한다.'),
            Text(
                'family modifier 를 사용한 bool provider 의 정해진 값은 $boolUsingFamilyWatch 입니다.'),
            // 이게 말이 안된다. family modifier 는 주고 새로운 객체들을 생성해서 사용하는건데.. staticProvider 는 간단한 값을 넣는데 family 를 굳이 사용할 필요가 없다.
            // family 는 주로 객체를 초기화 해서 그 객체를 사용하고자 할 때 사용한다.
            /*TextButton(
                onPressed: () {
                  ref.read(boolUsingFamilyModifierStateProvider.notifier).state =
                  !ref.read(boolUsingFamilyModifierStateProvider.notifier).state;
                },
                child: const Text('Change value')),*/
            TextButton(
              onPressed: () {
                ref.invalidate(boolStateProvider);
              },
              child: const Text('invalidate value'),
            ),
          ],
        ),
      ),
    );
  }
}
