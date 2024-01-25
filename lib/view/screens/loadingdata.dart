import 'package:alreadyr/view/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import '../../constants/colors.dart';
import 'offers.dart';
import 'profile.dart';
import 'my_order.dart';

class LoadingScreen extends StatefulWidget {
  static const String id = 'loading_screen';
  @override
  _LoadingScreen createState() => _LoadingScreen();
}

class _LoadingScreen extends State<LoadingScreen> {
  var _currentindex = 0;

  List<Widget> _screenlist = [
    Home(),
    Offers(),
    MyOrder(),
    /*Map(),*/ Profile()
  ];

  @override
  Widget build(BuildContext context) {
    void _changeontap(int value) {
      if (ModalRoute.of(context)!.settings.arguments == null) {
        setState(() {
          _currentindex = value;
          print(_currentindex);
        });
      } else {
        _currentindex = 2;
        setState(() {
          _currentindex = value;
          print(_currentindex);
        });
      }
    }

    return Scaffold(
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: white,
        activeColor: primaryColor,
        color: Colors.blue,
        items: [
          TabItem(
            icon: Icon(
              Icons.home,
              color: Colors.grey[400],
            ),
          ),
          TabItem(
              icon: Icon(
            Icons.star,
            color: Colors.grey[400],
          )),
          TabItem(icon: Icon(Icons.timer, color: Colors.grey[400])),
          TabItem(
              icon: Icon(
            Icons.pin_drop,
            color: Colors.grey[400],
          )),
          TabItem(
              icon: Icon(
            Icons.person,
            color: Colors.grey[400],
          )),
        ],
        initialActiveIndex: _currentindex,
        onTap: _changeontap,
      ),
      body: _screenlist.elementAt(_currentindex),
    );
  }
}
