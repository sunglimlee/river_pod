import 'package:flutter_riverpod/flutter_riverpod.dart';

final valueProvider = Provider<int>((ref) {
  return ValueProvider()._initValue;
});

class ValueProvider {
  final int _initValue;

  ValueProvider({int initValue = 6}) : _initValue = initValue;

  int get initValue => _initValue;
}
