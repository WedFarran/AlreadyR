import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants/layout_constant.dart';
import '../../controller/menu_providor.dart';
import '../../controller/provider/cart_provider.dart';
import 'add_menu_button.dart';
import 'view_cart_button.dart';

class MenuItemsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _menuData = Provider.of<MenuProvidor>(context);

    final cart = Provider.of<CartProvider>(context);

    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        ListView.builder(
            itemCount: _menuData.menuList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                child: Container(
                  height: size.height * 0.17,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              child: Row(children: [
                            Image(
                                image: AssetImage(
                                    'assets/images/random/fastfood.jpg'), // NetworkImage(_menuData.menuList[index].image),
                                fit: BoxFit.cover,
                                height: size.height * 0.20,
                                width: size.height * 0.10),
                            const SizedBox(width: 15.0),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(_menuData.menuList[index].title,
                                        style: resTitleS),
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Container(
                                    width: size.width * 0.45,
                                    child: Text(
                                        _menuData.menuList[index].discription,
                                        overflow: TextOverflow.visible,
                                        maxLines: 2,
                                        style: descriptionS),
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Text('${_menuData.menuList[index].price} \$',
                                      style: priceS)
                                ])
                          ])),
                        ),
                        AddMenuButton(
                          dichId: _menuData.menuList[index].dichId,
                          price: _menuData.menuList[index].price,
                          title: _menuData.menuList[index].title,
                          prepTime: _menuData.menuList[index].prepTime,
                        ),
                      ]),
                ),
              );
            }),
        ViewCartButton(cart: cart, size: size),
      ],
    );
  }
}
