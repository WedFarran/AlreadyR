import 'package:flutter/foundation.dart';

import '../../model/cart_item.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  double get totalTax {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += (0.15 * (cartItem.price * cartItem.quantity));
    });

    return total;
  }

  double get totalPrice {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += (cartItem.price * cartItem.quantity);
    });
    return total;
  }

  double get totalPriceTax {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += ((cartItem.price * cartItem.quantity) +
          (0.15 * (cartItem.price * cartItem.quantity)));
    });
    return total;
  }

  int get itemCount {
    // ignore: unnecessary_null_comparison
    return _items == null ? 0 : _items.length;
  }

  int showQuantity(String dichId) {
    int idQuantity = 0;
    _items.containsKey(dichId)
        ? _items.forEach((key, items) {
            if (key == dichId) {
              idQuantity = items.quantity;
            }
          })
        : idQuantity = 0;
    return idQuantity;
  }

  double get timeCalculation {
    double totalTime = 0;
    _items.forEach((key, cartItem) {
      totalTime += (cartItem.prepTime * cartItem.quantity);
      print(totalTime);
      print('item length ${_items.length}');
    });
    double avg = totalTime / _items.length;
    return avg;
  }

  void addItem(String dichId, double price, String title, double prepTime) {
    if (_items.containsKey(dichId)) {
      _items.update(
        dichId,
        (existingCartItem) => CartItem(
          id: existingCartItem.id,
          title: existingCartItem.title,
          price: existingCartItem.price,
          quantity: existingCartItem.quantity + 1,
          prepTime: existingCartItem.prepTime,
        ),
      );
    } else {
      _items.putIfAbsent(
        dichId,
        () => CartItem(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          quantity: 1,
          prepTime: prepTime,
        ),
      );
    }
    notifyListeners();
  }

  void deleteItem() {
    _items.forEach((key, cartItem) {
      if (cartItem.quantity == 0) {
        _items.removeWhere((key, cartItem) => cartItem.quantity == 0);
      }
    });
    notifyListeners();
  }

  void removeItem(
    String dichId,
    double price,
    String title,
  ) {
    if (_items.containsKey(dichId)) {
      _items.update(
        dichId,
        (existingCartItem) => CartItem(
          id: existingCartItem.id,
          title: existingCartItem.title,
          price: existingCartItem.price,
          quantity: existingCartItem.quantity == 0
              ? existingCartItem.quantity
              : existingCartItem.quantity - 1,
          prepTime: existingCartItem.prepTime,
        ),
      );
    }

    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
