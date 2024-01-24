import 'package:flutter/material.dart';
import '../../constants/layout_constant.dart';
import '../widgets/custom_app_bar.dart';
import 'account.dart';
import 'order_history.dart';
import 'points.dart';

class Support extends StatelessWidget {
  static const String id = 'support_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarTitle: "support",
        leading: IconButton(
          icon: arrowBackIos,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(children: [
        ListTile(
            onTap: () {
              Navigator.of(context).pushNamed(Account.id);
            },
            title: Text(
                "" // AppLocale.of(BuildContext, context).getTranslations("chat"),
                )),
        ListTile(
            onTap: () {
              Navigator.of(context).pushNamed(OrderHistory.id);
            },
            title: Text(
                "" //  AppLocale.of(BuildContext, context).getTranslations("phone"),
                )),
        ListTile(
            onTap: () {
              Navigator.of(context).pushNamed(Points.id);
            },
            title: Text(
                "" //  AppLocale.of(BuildContext, context).getTranslations("email"),
                )),
      ]),
    );
  }
}
