import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../constants/layout_constant.dart';
import '../../controller/provider/cart_provider.dart';
import '../screens/cart.dart';

class ViewCartButton extends StatelessWidget {
  const ViewCartButton({
    required this.cart,
    required this.size,
  });

  final CartProvider cart;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: cart.totalPriceTax == 0 ? false : true,
      child: Padding(
        padding: const EdgeInsets.only(
            right: 50.0, left: 50.0, bottom: 8.0, top: 600),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, Cart.id);
            Provider.of<CartProvider>(context, listen: false).deleteItem();
          },
          child: Container(
            height: size.height * 0.06,
            width: size.width * 0.8,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: grey, blurRadius: 8.0, offset: Offset(0.0, 10.0))
              ],
              color: green,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 13.0, bottom: 8.0, right: 8.0, left: 8.0),
              child: Text(
                "", // '${AppLocale.of(BuildContext, context).getTranslations("view_cart")} ( ${cart.totalPrice.toStringAsFixed(2)} SR )',
                style: cartBS,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
