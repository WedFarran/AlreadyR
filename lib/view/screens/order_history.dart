import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/layout_constant.dart';
import '../../controller/provider/order_provider.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/order_history_widget.dart';

class OrderHistory extends StatelessWidget {
  static const String id = 'orderhistory_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarTitle: "order_history",
        leading: IconButton(
          icon: arrowBackIos,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder(
        future: Provider.of<OrdersProvider>(context, listen: false)
            .fetchAndSetOrders(),
        builder: (ctx, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (dataSnapshot.error != null) {
              // ...
              // Do error handling stuff
              return Center(
                child: Text('An error occurred!'),
              );
            } else {
              return Consumer<OrdersProvider>(
                builder: (ctx, orderData, child) => ListView.builder(
                  itemCount: orderData.orders.length,
                  itemBuilder: (ctx, i) =>
                      OrderHistoryWidget(orderData.orders[i]),
                ),
              );
            }
          }
        },
      ),
    );
  }
}
