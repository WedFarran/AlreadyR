import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/layout_constant.dart';
import '../../controller/provider/lang.dart';
import '../widgets/custom_app_bar.dart';

class Lang extends StatefulWidget {
  static const String id = 'lang_screen';

  @override
  _LangState createState() => _LangState();
}

class _LangState extends State<Lang> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          leading: IconButton(
            icon: arrowBackIos,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          appBarTitle: "language"),
      body: ListView(
        children: [
          ListTile(
            title: Text('English'),
            onTap: () async {
              // setLang('en');
              Provider.of<LanguageSet>(context, listen: false).setLang('en');
            },
          ),
          ListTile(
            title: Text('عربي'),
            onTap: () async {
              // setLang('ar');
              Provider.of<LanguageSet>(context, listen: false).setLang('ar');
            },
          ),
        ],
      ),
    );
  }
}
