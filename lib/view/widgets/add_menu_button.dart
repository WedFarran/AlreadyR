import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants/colors.dart';
import '../../constants/layout_constant.dart';
import '../../controller/provider/cart_provider.dart';

class AddMenuButton extends StatelessWidget {
  final String dichId;
  final double price;
  final String title;
  final double prepTime;

  AddMenuButton({
    required this.prepTime,
    required this.dichId,
    required this.price,
    required this.title,
  });
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
        padding: const EdgeInsets.all(6.0),
        child: Consumer<CartProvider>(
          builder: (context, cart, child) {
            return Container(
              width: size.width * 0.12,
              decoration: BoxDecoration(
                color: cart.showQuantity(dichId) == 0
                    ? bGrey
                    : yellowC, //use the show quantity method
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                      iconSize: 20.0,
                      icon: add,
                      onPressed: () {
                        cart.addItem(dichId, price, title, prepTime);
                      }),
                  Text(cart.showQuantity(dichId).toString(),
                      style: quantityStyle),
                  IconButton(
                      iconSize: 20.0,
                      icon: remove,
                      onPressed: () {
                        cart.removeItem(dichId, price, title);
                      }),
                ],
              ),
            );
          },
        ));
  }
}
