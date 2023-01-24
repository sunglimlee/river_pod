import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/provider/api_service_testing_future_int.dart';

class FutureProviderScreen extends ConsumerWidget {
  const FutureProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final futureIntWatch = ref.watch(futureIntProvider);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder(
            future: ref.watch(futureIntProvider.future),
            // or ref.watch(apiServiceTestingFutureIntProvider).getInt()
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                return Container(
                  alignment: Alignment.center,
                  child: Text('Future 에서 불러온 int 값은 ${snapshot.data} 입니다.'),
                );
              } else if (snapshot.hasData == false) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Text('스냅샷 에러');
              } else {
                return const Text('혹시 몰라서 else 문 추가');
              }
            },
          ),
          Center(
            child: futureIntWatch.when(
                data: (int data) {
                  return Text(data.toString());
                },
                error: (error, stackTrace) {},
                loading: () => const CircularProgressIndicator()),
          ),
        ],
      ),
    );
  }
}
