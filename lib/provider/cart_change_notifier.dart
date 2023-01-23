import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartChangeNotifierProvider = ChangeNotifierProvider((ref) => CartChangeNotifier());

class CartChangeNotifier extends ChangeNotifier {
  final List<String> _cart = ['이성림'];

  List<String> get cart => _cart; // get 을 사용할 땐 로케트 ㅎ

  void addProduct(String product) {
    _cart.add(product);
    notifyListeners();// 이게 너무 중요하다.
  }

  void deleteProduct(String product) {
    _cart.remove(product);
    notifyListeners();// 이게 너무 중요하다.
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();// 이게 너무 중요하다.
  }
}