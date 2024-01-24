import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/layout_constant.dart';
import '../../controller/provider/cart_provider.dart';
import '../../controller/provider/order_provider.dart';
import '../screens/auth_number.dart';
import '../screens/loadingdata.dart';

class PlaceOrderButton extends StatefulWidget {
  const PlaceOrderButton({
    required this.cart,
    required this.size,
  });

  final CartProvider cart;
  final Size size;

  @override
  _PlaceOrderButtonState createState() => _PlaceOrderButtonState();
}

class _PlaceOrderButtonState extends State<PlaceOrderButton> {
  var _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(right: 50.0, left: 50.0, bottom: 8.0, top: 600),
      child: InkWell(
        onTap: (widget.cart.totalPriceTax <= 0 || _isLoading)
            ? null
            : FirebaseAuth.instance.currentUser == null
                ? () {
                    Navigator.pushNamed(context, AuthN.id);
                  }
                : () async {
                    setState(() {
                      _isLoading = true;
                    });
                    Navigator.pushNamed(context, LoadingScreen.id,
                        arguments: 2);
                    await Provider.of<OrdersProvider>(context, listen: false)
                        .addOrder(
                      widget.cart.items.values.toList(),
                      widget.cart.totalPriceTax,
                      widget.cart.timeCalculation,
                      widget.cart.totalTax,
                    );
                    Provider.of<OrdersProvider>(context, listen: false)
                        .displayOrder(
                      widget.cart.items.values.toList(),
                      widget.cart.totalPriceTax,
                      widget.cart.timeCalculation,
                      widget.cart.totalTax,
                    );

                    setState(() {
                      _isLoading = false;
                    });
                    widget.cart.clear();
                    print(widget.cart.items);
                  },
        child: Container(
          height: widget.size.height * 0.06,
          width: widget.size.width * 0.8,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(color: grey, blurRadius: 8.0, offset: Offset(0.0, 10.0))
            ],
            color: green,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
                top: 13.0, bottom: 8.0, right: 8.0, left: 8.0),
            child: _isLoading
                ? CircularProgressIndicator()
                : Text(
                    "", // '${AppLocale.of(BuildContext, context).getTranslations("place_order")} ( ${widget.cart.totalPriceTax.toStringAsFixed(2)} SR )',
                    textAlign: TextAlign.center,
                    style: cartBS,
                  ),
          ),
        ),
      ),
    );
  }
}
