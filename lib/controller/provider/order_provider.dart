import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../../constants/db_constant.dart';
import '../../model/cart_item.dart';
import '../../model/order.dart';

class OrdersProvider with ChangeNotifier {
  User? mAuth = FirebaseAuth.instance.currentUser;
  final storage = new FlutterSecureStorage();
  Order? currentOrder;
  List<Order> _orders = [];

  List<Order> get orders {
    return [..._orders];
  }

  void displayOrder(List<CartItem> cartItems, double totalPrice,
      double totalTime, double tax) {
    currentOrder = Order(
        totalTime: totalTime,
        dateTime: DateTime.now(),
        id: DateTime.now().toString(),
        items: cartItems,
        totalPrice: totalPrice,
        tax: tax);
  }

  Future<void> addOrder(List<CartItem> cartItems, double totalPrice,
      double totalTime, double tax) async {
    final timestamp = DateTime.now();
    final response =
        await http.post(Uri.parse('${DB_URL}orders/${mAuth!.uid}.json'),
            body: json.encode({
              Order.DATETIME: timestamp.toIso8601String(),
              Order.TOTALTIME: totalTime,
              Order.TAX: tax.toStringAsFixed(2),
              Order.TOTALPRICE: totalPrice.toStringAsFixed(2),
              Order.ITEMS: cartItems
                  .map((e) => {
                        CartItem.ID: e.id,
                        CartItem.TITLE: e.title,
                        CartItem.QUANTITY: e.quantity,
                        CartItem.PREPTIME: e.prepTime,
                        CartItem.TOTALPRICE: e.price,
                      })
                  .toList(),
            }));
    _orders.insert(
        0,
        Order(
            dateTime: timestamp,
            id: json.decode(response.body)['name'].toString(),
            totalPrice: totalPrice,
            items: cartItems,
            totalTime: totalTime,
            tax: tax));

    notifyListeners();
  }

  Future<void> fetchAndSetOrders() async {
    final response =
        await http.get(Uri.parse('$DB_URL$DB_ORDERS/${mAuth!.uid}.json'));
    final List<Order> loadedOrders = [];
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    print('errrrrrrrrrrrror$extractedData');
    // ignore: unnecessary_null_comparison
    if (extractedData == null) {
      return;
    }

    extractedData.forEach((orderId, orderData) {
      loadedOrders.add(
        Order(
          id: orderId,
          totalPrice: double.parse(orderData[Order.TOTALPRICE]),
          dateTime: DateTime.parse(orderData[Order.DATETIME]),
          totalTime: orderData[Order.TOTALTIME],
          tax: double.parse(orderData[Order.TAX]),
          items: (orderData[Order.ITEMS] as List<dynamic>)
              .map(
                (item) => CartItem(
                  id: item[CartItem.ID],
                  price: item[CartItem.TOTALPRICE],
                  quantity: item[CartItem.QUANTITY],
                  title: item[CartItem.TITLE],
                  prepTime: item[CartItem.PREPTIME],
                ),
              )
              .toList(),
        ),
      );
    });
    _orders = loadedOrders.reversed.toList();
    notifyListeners();
  }
}
