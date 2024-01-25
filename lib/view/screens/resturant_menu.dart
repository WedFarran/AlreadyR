import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../constants/layout_constant.dart';
import '../../controller/provider/cart_provider.dart';
import '../../controller/provider/menu_providor.dart';
import '../widgets/menu_items_list.dart';

class ResturantMenu extends StatelessWidget {
  static const String id = 'resturant_screen';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final routeArguments = ModalRoute.of(context)!.settings.arguments
        as Map<String, dynamic>; // need to be fixed
    final resturantName = routeArguments['resturanttitle'];
    final resturantId = routeArguments['resturantid'];

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: arrowBackIos,
            onPressed: () {
              cart.clear();
              Navigator.pop(context);
            },
          ),
          backgroundColor: white,
          title: Center(
            child: Text(
              resturantName,
              style: appBarS,
            ),
          ),
        ),
        body: Scaffold(
            body: FutureBuilder(
                future: Provider.of<MenuProvidor>(context, listen: false)
                    .fetchMenu(resturantId.toString()),
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
                      return SafeArea(
                          child: Container(
                        child: MenuItemsList(),
                      ));
                    }
                  }
                })));
  }
}
