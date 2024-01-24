import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants/layout_constant.dart';
import '../../controller/provider/cart_provider.dart';
import '../widgets/cart_items_widget.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/payment_type.dart';
import '../widgets/pickup_time_widget.dart';
import '../widgets/place_order_button.dart';

class Cart extends StatelessWidget {
  static const String id = 'cart_screen';
  static double totalPrice = 0.0;
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    Size size = MediaQuery.of(context).size;
    totalPrice = cart.totalPriceTax;
    return Scaffold(
      appBar: CustomAppBar(
        appBarTitle: "cart",
        leading: IconButton(
          icon: arrowBackIos,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              Container(
                child: Column(
                  children: [
                    CartItemsWidget(
                      length: cart.itemCount,
                      list: cart.items.values.toList(),
                      tax: cart.totalTax.toStringAsFixed(2),
                      total: cart.totalPriceTax.toStringAsFixed(2),
                    ),
                    SizedBox(
                      height: 36,
                    ),
                    PickUpTimeWidget(
                      pickupTime: cart.timeCalculation,
                    ),
                    SizedBox(
                      height: 36,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 100.0),
                      child: PaymentTypeWidget(),
                    ),
                  ],
                ),
              ),
            ],
          ),
          PlaceOrderButton(cart: cart, size: size),
        ],
      ),
    );
  }
}
