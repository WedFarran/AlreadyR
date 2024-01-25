import 'package:flutter/material.dart';
import '../../constants/layout_constant.dart';
import '../../model/resturantsearch.dart';
import '../widgets/catigory_items.dart';
import '../widgets/custom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  static const String id = 'home_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(action: [
        IconButton(
          iconSize: 35,
          icon: search,
          onPressed: () {
            showSearch(context: context, delegate: RsturantSearch());
          },
        ),
      ], appBarTitle: "home"),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            children: <Widget>[
              Expanded(child: CatigoryItem()),
            ],
          ),
        ),
      ),
    );
  }
}
