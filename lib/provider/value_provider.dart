import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/user.dart';

final valueProvider = Provider<int>((ref) {
  return ValueProvider()._initValue;
});

class ValueProvider {
  final int _initValue;

  ValueProvider({int initValue = 6}) : _initValue = initValue;

  int get initValue => _initValue;
}

final userProvider = Provider<User>((ref) => User(name: '김기옥', age: 76));