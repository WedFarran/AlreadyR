import 'package:alreadyr/controller/provider/menu_providor.dart';
import 'package:alreadyr/controller/provider/offers_provider.dart';
import 'package:alreadyr/controller/provider/order_provider.dart';
import 'package:alreadyr/controller/provider/user_provider.dart';
import 'package:alreadyr/view/screens/cart.dart';
import 'package:alreadyr/view/screens/home.dart';
import 'package:alreadyr/view/screens/lang.dart';
import 'package:alreadyr/view/widgets/navigation_bar_widget.dart';
import 'package:alreadyr/view/screens/my_order.dart';
import 'package:alreadyr/view/screens/offers.dart';
import 'package:alreadyr/view/screens/order_history.dart';
import 'package:alreadyr/view/screens/points.dart';
import 'package:alreadyr/view/screens/resturant_menu.dart';
import 'package:alreadyr/view/screens/resturants.dart';
import 'package:alreadyr/view/screens/support.dart';
import 'package:alreadyr/view/screens/wellcome.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/provider/cart_provider.dart';
import '../controller/provider/resturant_list_provider.dart';
import '../controller/services/category_items_list_provider.dart';
import '../view/screens/account.dart';
import '../view/screens/auth_code.dart';
import '../view/screens/auth_number.dart';
import '../view/screens/profile.dart';

Map<String, Widget Function(BuildContext)> aleadyRoutes = {
  HomeScreen.id: (context) => HomeScreen(),
  MyOrderScreen.id: (context) => MyOrderScreen(),
  ProfileScreen.id: (context) => ProfileScreen(),
  //  Map.id: (context) => Map(),
  OffersScreen.id: (context) => OffersScreen(),
  NavigationBarWidget.id: (context) => NavigationBarWidget(),
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
