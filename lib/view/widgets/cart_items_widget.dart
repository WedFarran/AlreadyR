import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/layout_constant.dart';

class CartItemsWidget extends StatelessWidget {
  final length;
  final List list;
  final String tax;
  final String total;
  CartItemsWidget(
      {required this.length,
      required this.list,
      required this.tax,
      required this.total});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Container(
              child: Text("", // AppLocale.of(BuildContext, context)
                  //   .getTranslations("order_details"),
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
                        itemCount: length,
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${list[index].quantity}x ${list[index].title}',
                                style: Lightgrey17,
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Text(
                                ' ${(list[index].price * list[index].quantity).toStringAsFixed(2)} ',
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
                        tax,
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
                        '', // AppLocale.of(BuildContext, context)
                        // .getTranslations("total"),
                        style: Lightgrey14,
                      ),
                      Text(
                        total,
                        style: Lightgrey17,
                      )
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
