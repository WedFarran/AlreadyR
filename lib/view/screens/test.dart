import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../constants/layout_constant.dart';
import '../../controller/provider/cart_provider.dart';
import '../../controller/provider/order_provider.dart';
import '../../model/cart_item.dart';
import '../widgets/custom_app_bar.dart';
import 'cart.dart';

class Test extends StatelessWidget {
  static const String id = 'Testscreen';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: CustomAppBar(
        appBarTitle: 'tax',
      ),
      body: Center(
        child: Ttest(
          size: size,
          cart: cart,
          i: 0,
        ),
      ),
    );
  }
}

class Ttest extends StatelessWidget {
  const Ttest({required this.size, this.cart, this.order, required this.i});

  final Size size;
  final CartProvider? cart;
  final OrdersProvider? order;
  final int i;

  @override
  Widget build(BuildContext context) {
    final Map<String, CartItem> cati = i == 0 ? cart!.items : {};
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Container(
              child: Text("", //  AppLocale.of(BuildContext, context)
                  //  .getTranslations("order_details"),
                  style: Lightgrey20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 30.0,
              right: 30.0,
              top: 10.0,
            ),
            child: Container(
              height: size.height * 0.4,
              decoration: BoxDecoration(
                  color: white,
                  boxShadow: [
                    BoxShadow(
                        color: grey, blurRadius: 8.0, offset: Offset(0.0, 10.0))
                  ],
                  borderRadius: BorderRadius.circular(20.0)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount:
                            i == 0 ? cart!.itemCount : order!.orders.length,
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${i == 0 ? cati.values.toList()[index].quantity : order!.orders[index].items[index].quantity}x ${i == 0 ? cati.values.toList()[index].title : order!.orders[index].items[index].title}',
                                style: Lightgrey17,
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Text(
                                ' ${((i == 0 ? cati.values.toList()[index].price : order!.orders[index].items[index].price) * (i == 0 ? cati.values.toList()[index].quantity : order!.orders[index].items[index].quantity))} ',
                                style: Lightgrey17,
                              ),
                            ],
                          );
                        }),
                  ),
                  Container(
                    height: size.height * 0.001,
                    decoration: BoxDecoration(color: black),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "", // AppLocale.of(BuildContext, context).getTranslations(
                        //  "tax"), //dont know how to calculate it
                        style: Lightgrey14,
                      ),
                      Text(
                        '35.0',
                        style: Lightgrey17,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "", // AppLocale.of(BuildContext, context)
                        // .getTranslations("total"),
                        style: Lightgrey14,
                      ),
                      Text(
                        i == 0
                            ? cart!.totalPriceTax.toString()
                            : Cart.totalPrice.toString(),
                        style: Lightgrey17,
                      ),
                    ],
                  )
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
