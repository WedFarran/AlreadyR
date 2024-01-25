import 'dart:async';

import 'package:alreadyr/constants/layout_constant.dart';
import 'package:alreadyr/constants/strings.dart';
import 'package:alreadyr/view/widgets/navigation_bar_widget.dart';
import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class Wellcome extends StatefulWidget {
  static const String id = 'wellcome_screen';

  const Wellcome({super.key});

  @override
  State<Wellcome> createState() => _WellcomeState();
}

class _WellcomeState extends State<Wellcome> {
  @override
  void initState() {
    Timer(const Duration(milliseconds: 2500), () {
      /*var user = FirebaseAuth.instance.currentUser;
      user == null
          ? Navigator.of(context).pushNamed(AccountType.id)
          : user.email!.contains('@wl.a.com')
              ? Navigator.of(context).pushNamed(AdminWasteNavigationBar.id)
              : Navigator.of(context).pushNamed(DriverWasteNavigationBar.id);*/
      Navigator.of(context).pushNamed(NavigationBarWidget.id);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(applicationName, style: splashScreenLogoStyle),
            SizedBox(
              height: size.height * 0.05,
            ),
            CircularProgressIndicator(
              backgroundColor: white,
              color: black,
            )
          ],
        ),
      ),
    );
  }
}
