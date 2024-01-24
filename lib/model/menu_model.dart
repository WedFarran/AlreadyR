class Menu {
  static const String TITLE = 'title';
  static const String DESCRIPTION = 'description';
  static const String IMAGE_CODE = 'image';
  static const String PRICE = 'price';
  static const String PREPTIME = 'prepTime';
  static const String DICHID = 'dichId';

  final dynamic dichId;
  final String image;
  final double price;
  final String title;
  final double prepTime;
  final String discription;

  const Menu({
    required this.image,
    required this.price,
    required this.title,
    required this.dichId,
    required this.prepTime,
    required this.discription,
  });
}
