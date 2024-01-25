import 'package:alreadyr/view/screens/loadingdata.dart';
import 'package:alreadyr/view/screens/wellcome.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'view/screens/my_order.dart';
import 'view/screens/offers.dart';
import 'view/screens/order_history.dart';
import 'view/screens/points.dart';
import 'view/screens/profile.dart';
import 'view/screens/resturant_menu.dart';
import 'view/screens/resturants.dart';
import 'view/screens/support.dart';
import 'view/screens/account.dart';
import 'view/screens/auth_code.dart';
import 'view/screens/auth_number.dart';
import 'view/screens/cart.dart';
import 'view/screens/home.dart';
import 'view/screens/lang.dart';

import 'controller/provider/cart_provider.dart';
import 'controller/provider/menu_providor.dart';
import 'controller/provider/offers_provider.dart';
import 'controller/provider/order_provider.dart';
import 'controller/provider/resturant_list_provider.dart';
import 'controller/provider/user_provider.dart';
import 'controller/services/category_items_list_provider.dart';

Map<String, Widget Function(BuildContext)> aleadyRoutes = {
  Home.id: (context) => Home(),
  MyOrder.id: (context) => MyOrder(),
  Profile.id: (context) => Profile(),
  //  Map.id: (context) => Map(),
  Offers.id: (context) => Offers(),
  LoadingScreen.id: (context) => LoadingScreen(),
  Resturants.id: (context) => Resturants(),
  ResturantMenu.id: (context) => ResturantMenu(),
  Cart.id: (context) => Cart(),
  Points.id: (context) => Points(),
  Support.id: (context) => Support(),
  Lang.id: (context) => Lang(),
  OrderHistory.id: (context) => OrderHistory(),
  Account.id: (context) => Account(),
  Wellcome.id: (context) => Wellcome(),
  AuthN.id: (context) => AuthN(),
  AuthC.id: (context) => AuthC(),
};

List providers = [
  ChangeNotifierProvider(create: (_) => ResturantListProvider()),
  ChangeNotifierProvider(create: (_) => CategoryItemListService()),
  ChangeNotifierProvider(create: (_) => MenuProvidor()),
  ChangeNotifierProvider(create: (_) => CartProvider()),
  ChangeNotifierProvider(create: (_) => OffersProvider()),
  ChangeNotifierProvider(create: (_) => OrdersProvider()),
  ChangeNotifierProvider(create: (_) => UserProvider()),
];
