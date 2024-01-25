import 'package:alreadyr/controller/provider/cart_provider.dart';
import 'package:alreadyr/controller/provider/menu_providor.dart';
import 'package:alreadyr/controller/provider/offers_provider.dart';
import 'package:alreadyr/controller/provider/order_provider.dart';
import 'package:alreadyr/controller/provider/resturant_list_provider.dart';
import 'package:alreadyr/controller/provider/user_provider.dart';
import 'package:alreadyr/l10n/l10n.dart';
import 'package:alreadyr/view/screens/wellcome.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'controller/services/category_items_list_provider.dart';
import 'language.dart';
import 'routes_providers.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const AlreadyR());
}

class AlreadyR extends StatefulWidget {
  const AlreadyR({super.key});
  static void setLocale(BuildContext context, Locale newLocale) {
    _AlreadyRState? state = context.findAncestorStateOfType<_AlreadyRState>();
    state?.setLocale(newLocale);
  }

  @override
  State<AlreadyR> createState() => _AlreadyRState();
}

final navigatorKey = GlobalKey<NavigatorState>();

class _AlreadyRState extends State<AlreadyR> {
  Locale? _locale;
  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) => setLocale(locale));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ResturantListProvider()),
        ChangeNotifierProvider(create: (_) => CategoryItemListService()),
        ChangeNotifierProvider(create: (_) => MenuProvidor()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => OffersProvider()),
        ChangeNotifierProvider(create: (_) => OrdersProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.red),
        supportedLocales: L10n.allLocals,
        locale: _locale,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        debugShowCheckedModeBanner: false,
        title: 'Already',
        initialRoute: Wellcome.id,
        routes: aleadyRoutes,
      ),
    );
  }
}
