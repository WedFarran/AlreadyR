import 'package:alreadyr/view/screens/home.dart';
import 'package:alreadyr/view/screens/map.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import '../../constants/colors.dart';
import '../screens/offers.dart';
import '../screens/profile.dart';
import '../screens/my_order.dart';

class NavigationBarWidget extends StatefulWidget {
  static const String id = 'HomeScreen';
  const NavigationBarWidget({super.key});

  @override
  State<NavigationBarWidget> createState() => _NavigationBarWidgetState();
}

class _NavigationBarWidgetState extends State<NavigationBarWidget> {
  var _currentindex = 0;

  final List<Widget> _screenlist = [
    HomeScreen(),
    OffersScreen(),
    MyOrderScreen(),
    const MapScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    void changeontap(int value) {
      if (ModalRoute.of(context)!.settings.arguments == null) {
        setState(() {
          _currentindex = value;
        });
      } else {
        _currentindex = 2;
        setState(() {
          _currentindex = value;
        });
      }
    }

    return Scaffold(
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: white,
        activeColor: primaryColor,
        items: [
          navigationIcons(Icons.home_rounded),
          navigationIcons(Icons.star_rounded),
          navigationIcons(Icons.av_timer_rounded),
          navigationIcons(Icons.map_rounded),
          navigationIcons(Icons.person_2_rounded),
        ],
        initialActiveIndex: _currentindex,
        onTap: changeontap,
      ),
      body: _screenlist.elementAt(_currentindex),
    );
  }

  TabItem<dynamic> navigationIcons(IconData icon) {
    return TabItem(
        icon: Icon(
          icon,
          size: 35,
          color: secondPrimaryColor,
        ),
        activeIcon: Icon(
          size: 40,
          icon,
          color: white,
        ));
  }
}
