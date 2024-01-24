class CartItem {
  static const String ID = 'id';
  static const String TITLE = 'title';
  static const String QUANTITY = 'quantity';
  static const String PREPTIME = 'prepTIme';
  static const String TOTALPRICE = 'totalPrice';

  final String id;
  final String title;
  final int quantity;
  final double price;
  final double prepTime;

  CartItem({
    required this.prepTime,
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
  });
}
