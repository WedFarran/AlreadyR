import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../../constants/db_constant.dart';
import '../../model/menu_model.dart';

class MenuProvidor with ChangeNotifier {
  late List<Menu> _menuList = [];
  List<Menu> get menuList {
    return [..._menuList];
  }

  Future<void> fetchMenu(String resId) async {
    try {
      final response = await http
          .get(Uri.parse('$DB_URL$DB_RESTURANTS/$resId/$DB_MENU.json'));
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Menu> loadedMenu = [];

      extractedData.forEach((menuId, menuData) {
        loadedMenu.add(
          Menu(
            dichId: menuId,
            title: menuData[Menu.TITLE],
            image: menuData[Menu.IMAGE_CODE],
            discription: menuData[Menu.DESCRIPTION],
            prepTime: menuData[Menu.PREPTIME],
            price: menuData[Menu.PRICE],
          ),
        );
      });

      _menuList = loadedMenu;
      notifyListeners();
    } catch (error) {
      print(error);
      throw (error);
    }
  }
}
