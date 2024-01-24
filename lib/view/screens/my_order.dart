import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../controller/provider/order_provider.dart';
import '../widgets/cart_items_widget.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/direction_widget.dart';
import '../widgets/timer_widget.dart';

class MyOrder extends StatelessWidget {
  static const String id = 'timerr_screen';

  @override
  Widget build(BuildContext context) {
    final _order = Provider.of<OrdersProvider>(context, listen: true);

    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: CustomAppBar(appBarTitle: "myOrder"),
        body: (_order.currentOrder == null)
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Theres no order ',
                  ),
                  Center(child: CircularProgressIndicator()),
                ],
              )
            : SingleChildScrollView(
                child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: TimerWidget(
                            totalTime: _order.currentOrder!.totalTime,
                          ),
                        ),
                        CartItemsWidget(
                          length: _order.currentOrder!.items
                              .length, // _order.orders[0].items.length,
                          list: _order
                              .currentOrder!.items, //_order.orders[0].items,
                          tax: _order.currentOrder!.tax.toStringAsFixed(2),
                          total: _order.currentOrder!.totalPrice
                              .toStringAsFixed(
                                  2), // Cart.totalPrice.toStringAsFixed(2),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        /* QrImage(
                          data: "1234567890",
                          version: QrVersions.auto,
                          size: 100.0,
                          embeddedImage:
                              AssetImage('assets/images/profile/logo.jpeg'),
                        ),*/
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        DirectionWidget(),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        DirectionWidget(),
                        SizedBox(
                          height: size.height * 0.06,
                        )
                      ]),
                ),
              ));
  }
}
