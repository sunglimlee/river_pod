import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartStateNotifierProvider = StateNotifierProvider<CartStateNotifier, List<String>>((ref) => CartStateNotifier());

class CartStateNotifier extends StateNotifier<List<String>> {
  CartStateNotifier() : super(['김기옥']); // 반드시 super 에다가 초기값을 넣어 주어야 한다.

  void addProduct(String product) {
    state = [...state, product];
  }

  void removeProduct(String product) {
    state = state.where((p) => p != product).toList();
  }

  void clearCart() {
    state = [];
  } // 보다시피 notifyListeners() 가 필요없다.

}
