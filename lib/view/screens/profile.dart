import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';
import 'account.dart';
import 'auth_number.dart';
import 'lang.dart';
import 'loadingdata.dart';
import 'order_history.dart';
import 'points.dart';
import 'support.dart';

class Profile extends StatelessWidget {
  static const String id = 'profile_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarTitle: "profile"),
      body: ListView(children: [
        ListTile(
            onTap: () {
              Navigator.of(context).pushNamed(Account.id);
            },
            title: Text(
              "", // AppLocale.of(BuildContext, context).getTranslations("account"),
            )),
        ListTile(
            onTap: () {
              Navigator.of(context).pushNamed(OrderHistory.id);
            },
            title: Text(
              "", //  AppLocale.of(BuildContext, context)
              // .getTranslations("order_details"),
            )),
        ListTile(
            onTap: () {
              Navigator.of(context).pushNamed(Points.id);
            },
            title: Text(
                "" // AppLocale.of(BuildContext, context).getTranslations("points"),
                )),
        ListTile(
            onTap: () {
              Navigator.of(context).pushNamed(Lang.id);
            },
            title: Text(
                "" // AppLocale.of(BuildContext, context).getTranslations("language"),
                )),
        ListTile(
            onTap: () {
              Navigator.of(context).pushNamed(Support.id);
            },
            title: Text(
                "" // AppLocale.of(BuildContext, context).getTranslations("support"),
                )),
        ListTile(
          onTap: () {
            FirebaseAuth.instance.currentUser == null
                ? Navigator.of(context).pushNamed(AuthN.id)
                : showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(
                            //  AppLocale.of(BuildContext, context)
                            "" //    .getTranslations("log_out"),
                            ),
                        content: Text(
                          //AppLocale.of(BuildContext, context)
                          "",
                        ), //.getTranslations("confirm_logout")),
                        actions: [
                          TextButton(
                              onPressed: () {
                                FirebaseAuth.instance.signOut();
                                Navigator.pushNamed(context, LoadingScreen.id);
                              },
                              child: Text("")
                              //AppLocale.of(BuildContext, context)
                              //.getTranslations("confirm")),
                              ),
                        ],
                      );
                    });
            //log out
            //show dialog
          },
          title: Text(FirebaseAuth.instance.currentUser == null
                  ? "" //AppLocale.of(BuildContext, context).getTranslations("sign_in")
                  : "" // AppLocale.of(BuildContext, context)
              //.getTranslations("log_out"),
              ),
        ),
      ]),
    );
  }
}
