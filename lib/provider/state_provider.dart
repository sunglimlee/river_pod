import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/data/user.dart';

// 하나의 값을 제공하는 간단한 형태의 Provider
final boolStateProvider = StateProvider<bool>((ref) => false);
// family modifier 를 사용해서 bool 형 StateProvider 를 하나 더 만들어 사용해 본다.
final boolUsingFamilyModifierStateProvider =
    StateProvider.autoDispose.family<bool, bool>((ref, initValue) => initValue);

final countStateProvider = StateProvider<int>((ref) => 0);

final userStateProvider = StateProvider<User>((ref) => User(name: '이성림', age: 52));


