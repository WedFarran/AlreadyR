import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../../constants/db_constant.dart';
import '../../model/user_information.dart';

class UserProvider with ChangeNotifier {
  User? mAuth = FirebaseAuth.instance.currentUser;

  UserInformation _userInfo = UserInformation(
      email: 'pager@.com',
      name: 'name',
      number: 'phone number',
      password: 'password');

  UserInformation get userinfo {
    return _userInfo;
  }

  Future<void> fetchUserInformation() async {
    final response =
        await http.get(Uri.parse('$DB_URL$DB_USER/${mAuth!.uid}.json'));
    final UserInformation loadedUserInformation;
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    print('errrrrrrrrrrrror$extractedData');
    // ignore: unnecessary_null_comparison
    if (extractedData == null) {
      return;
    }

    loadedUserInformation = UserInformation(
        email: extractedData[UserInformation.EMAIL],
        name: extractedData[UserInformation.NAME],
        number: extractedData[UserInformation.NUMBER],
        password: extractedData[UserInformation.PASSWORD]);

    _userInfo = loadedUserInformation;
    notifyListeners();
  }

  /* Future<void> updateUserInfo(
      String password, String email, String name) async {
    // ignore: unused_local_variable
    /*  final response =
        await http.post(Uri.parse('$DB_URL$user/${mAuth!.uid}.json$token'),
            body: json.encode({
              'name': name,
              'email': email,
              'password': password,
            }));*/

    notifyListeners();
  }*/
}
