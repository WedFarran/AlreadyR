class ResturantList {
  static const String ID = 'id';
  static const String RESTURANTTITLE = 'resturantTitle';
  static const String CATEGORY = 'category';
  static const String IMAGE = 'image';
  static const String BRANCH = 'branch';

  final String id;
  final List<dynamic> category;
  final String image;
  final String restitle;
  final List<Branch> branch;
  const ResturantList(
      {required this.category,
      required this.image,
      required this.branch,
      required this.restitle,
      required this.id});
}

class Branch {
  static const String LATITUDE = 'latitude';
  static const String LONGITUDE = 'longitude';
  final double latitude;
  final double longitude;
  Branch({required this.latitude, required this.longitude});
}
