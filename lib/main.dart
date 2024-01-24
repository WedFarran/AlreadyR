import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'controller/provider/cart_provider.dart';
import 'controller/provider/lang.dart';
import 'controller/provider/menu_providor.dart';
import 'controller/provider/offers_provider.dart';
import 'controller/provider/order_provider.dart';
import 'controller/provider/resturant_list_provider.dart';
import 'controller/provider/user_provider.dart';
import 'controller/services/category_items_list_provider.dart';
import 'translations/app_locale.dart';
import 'view/screens/account.dart';
import 'view/screens/auth_code.dart';
import 'view/screens/auth_number.dart';
import 'view/screens/cart.dart';
import 'view/screens/home.dart';
import 'view/screens/lang.dart';
import 'view/screens/loadingdata.dart';
import 'view/screens/my_order.dart';
import 'view/screens/offers.dart';
import 'view/screens/order_history.dart';
import 'view/screens/points.dart';
import 'view/screens/profile.dart';
import 'view/screens/resturant_menu.dart';
import 'view/screens/resturants.dart';
import 'view/screens/support.dart';
import 'view/screens/wellcome.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  bool? firstVisit = sharedPreferences.getBool('first') ?? true;
  print(sharedPreferences.getString('lang'));
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ResturantListProvider()),
          ChangeNotifierProvider(create: (_) => CategoryItemListService()),
          ChangeNotifierProvider(create: (_) => MenuProvidor()),
          ChangeNotifierProvider(create: (_) => CartProvider()),
          ChangeNotifierProvider(create: (_) => OffersProvider()),
          ChangeNotifierProvider(create: (_) => OrdersProvider()),
          ChangeNotifierProvider(create: (_) => UserProvider()),
          ChangeNotifierProvider(create: (_) => LanguageSet()),
        ],
        child: MyApp(
          visitFlag: firstVisit,
        )),
  );
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  bool? visitFlag;
  MyApp({this.visitFlag});
  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageSet>(
      builder: (BuildContext context, langlocale, _) {
        return MaterialApp(
          theme: ThemeData(primarySwatch: Colors.red),
          supportedLocales: [
            Locale('en', ''),
            Locale('ar', ''),
          ],
          localeResolutionCallback: (currentLocale, supportedLocales) {
            if (currentLocale != null) {
              for (Locale locale in supportedLocales) {
                if (currentLocale.languageCode == locale.languageCode) {
                  return currentLocale;
                }
              }
            }
            return supportedLocales.first;
          },
          locale: langlocale.locale,
          localizationsDelegates: [
            // GlobalMaterialLocalizations.delegate,
            // GlobalWidgetsLocalizations.delegate,
            AppLocale.delegate
          ],
          debugShowCheckedModeBanner: false,
          title: 'PAGER',
          initialRoute: visitFlag! ? Wellcome.id : LoadingScreen.id,
          routes: {
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
          },
        );
      },
    );
  }
}
