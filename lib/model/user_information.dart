class UserInformation {
  static const String NAME = 'name';
  static const String EMAIL = 'email';
  static const String PASSWORD = 'password';
  static const String NUMBER = 'number';

  String name;
  String email;
  String password;
  String number;
  UserInformation(
      {required this.email,
      required this.name,
      required this.number,
      required this.password});
}
