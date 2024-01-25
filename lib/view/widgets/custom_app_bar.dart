import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/layout_constant.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(55);

  final String appBarTitle;
  final List<Widget>? action;
  final Widget? leading;
  const CustomAppBar(
      {required this.appBarTitle, this.action, this.leading}); //not required

  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading: leading,
        backgroundColor: white,
        centerTitle: true,
        title: Text(
          "", // AppLocale.of(BuildContext, context).getTranslations(appBarTitle),
          style: appBarS,
        ),
        actions: action);
  }
}
