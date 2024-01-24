// ignore_for_file: constant_identifier_names

import 'cart_item.dart';

class Order {
  static const String ID = 'id';
  static const String DATETIME = 'dateTime';
  static const String TOTALTIME = 'totalTime';
  static const String TAX = 'tax';
  static const String TOTALPRICE = 'totalPrice';
  static const String ITEMS = 'items';

  final String id;
  final double totalPrice;

  final double tax;
  final List<CartItem> items;
  final DateTime dateTime;
  final double totalTime;
  Order(
      {required this.totalTime,
      required this.dateTime,
      required this.id,
      required this.items,
      required this.totalPrice,
      required this.tax});
}
