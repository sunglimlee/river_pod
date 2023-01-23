
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 여기서는 이 프로바이더의 올린거고..
final apiServiceTestingFutureIntProvider = Provider<ApiServiceTestingFutureInt>((ref) => ApiServiceTestingFutureInt());
// 이제 FutureIntProvider 를 위에거를 이용해서 만든다.
final futureIntProvider = FutureProvider<int>((ref) {
  // 꼭 기억하자. watch 를 하고 있는 상태에서 원하는 함수를 다시 받아야 한다. 그래야 계속 바뀌니깐..
  final apiServiceTestingFutureInt = ref.watch(apiServiceTestingFutureIntProvider);
  return apiServiceTestingFutureInt.getInt();
});

class ApiServiceTestingFutureInt {
  Future<int> getInt() async {
    return Future.delayed(const Duration(seconds: 3), () {return 10;});
  }

}