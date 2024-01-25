import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../constants/layout_constant.dart';
import '../../controller/provider/user_provider.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/text_field_widget.dart';

class Account extends StatelessWidget {
  static const String id = 'account_screen';
  @override
  Widget build(BuildContext context) {
    late final TextEditingController userName;
    late final TextEditingController phone;
    late final TextEditingController email;
    late final TextEditingController password;
    late final TextEditingController confirmPassword;
    final userIn = Provider.of<UserProvider>(context, listen: true);
    userName = TextEditingController(text: userIn.userinfo.name);
    phone = TextEditingController(text: userIn.userinfo.number);
    email = TextEditingController(text: userIn.userinfo.email);
    password = TextEditingController(text: userIn.userinfo.password);
    confirmPassword = TextEditingController(text: userIn.userinfo.password);
    return Scaffold(
      appBar: CustomAppBar(
          leading: IconButton(
            icon: arrowBackIos,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          appBarTitle: "account"),
      body: ListView(
        children: [
          TextFieldWidget(
            controller: userName,
            hintTextKey: userIn.userinfo.name,
          ),
          TextFieldWidget(
            hintTextKey: userIn.userinfo.number,
            controller: phone,
          ),
          TextFieldWidget(
            controller: email,
            hintTextKey: userIn.userinfo.email,
          ),
          TextFieldWidget(
            controller: password,
            hintTextKey: userIn.userinfo.password,
          ),
          TextFieldWidget(
            controller: confirmPassword,
            hintTextKey: userIn.userinfo.password,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: primaryColor,
                  primary: Colors.grey.shade600,
                  minimumSize: Size(10.0, 59.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0))),
              onPressed: () {
                print(userIn.userinfo.email);
              },
              child: Text(
                "", //  AppLocale.of(BuildContext, context).getTranslations("save"),
                style: TextStyle(color: white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
