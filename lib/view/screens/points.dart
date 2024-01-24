import 'package:flutter/material.dart';
import '../../constants/layout_constant.dart';
import '../widgets/custom_app_bar.dart';

class Points extends StatelessWidget {
  static const String id = 'points_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarTitle: "points",
        leading: IconButton(
          icon: arrowBackIos,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
