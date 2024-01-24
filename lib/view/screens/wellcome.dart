import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/layout_constant.dart';
import '../../controller/provider/lang.dart';
import '../widgets/button.dart';
import 'loadingdata.dart';

class Wellcome extends StatelessWidget {
  static const String id = 'wellcome_screen';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/home/logo.jpeg'),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 400.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Button(
                    text: ' English ',
                    onpress: () async {
                      Provider.of<LanguageSet>(context, listen: false)
                          .setLang('en');
                      Navigator.of(context).pushNamed(LoadingScreen.id);
                      SharedPreferences sharedPreferences =
                          await SharedPreferences.getInstance();
                      sharedPreferences.setBool('first', false);
                    },
                    backColour: white,
                    textColour: darkGrey,
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Button(
                    text: ' عربي ',
                    onpress: () async {
                      Provider.of<LanguageSet>(context, listen: false)
                          .setLang('ar');
                      SharedPreferences sharedPreferences =
                          await SharedPreferences.getInstance();
                      sharedPreferences.setBool('first', false);
                      Navigator.of(context).pushNamed(LoadingScreen.id);
                    },
                    backColour: white,
                    textColour: darkGrey,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
