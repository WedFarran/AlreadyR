class Offer {
  static const String OFFERID = 'offerId';
  static const String RESTURANTID = 'resId';
  static const String IMAGE = 'image';

  final dynamic offerId;
  final dynamic resurantId;
  final String image;
  const Offer(
      {required this.image, required this.resurantId, required this.offerId});
}
