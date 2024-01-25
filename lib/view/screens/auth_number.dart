import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/colors.dart';
import '../../constants/layout_constant.dart';
import '../../controller/services/auth.dart';
import '../widgets/auth_widget.dart';
import '../widgets/button.dart';
import 'auth_code.dart';

class AuthN extends StatefulWidget {
  static const String id = 'auth_screen';

  @override
  _AuthNState createState() => _AuthNState();
}

class _AuthNState extends State<AuthN> {
  String smsCode = '';
  String verificationId = '';
  String _number = '';
  @override
  Widget build(BuildContext context) {
    AuthenticationService _authenticationService = AuthenticationService();
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: primaryColor,
      body: AuthWidget(
        size: size,
        imageAsset: 'assets/images/random/phone.png',
        widgett: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "", //  AppLocale.of(BuildContext, context)
              //    .getTranslations("enternumber"),
              style: Lightgrey17,
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            Container(
              height: size.height * 0.06,
              width: size.width * 0.8,
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: TextField(
                  //controller: _number,
                  onChanged: (value) {
                    _number = value;
                    print(_number);
                  },
                  maxLength: 9,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    counterText: "",
                    border: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(const Radius.circular(22.0)),
                    ),
                    prefix: Text(
                        '+966 | '), //////////////////////maight need to add here too direction
                    hintText: "", // AppLocale.of(BuildContext, context)
                    // .getTranslations("enternumber"),
                    hintStyle: resTitleS,
                    contentPadding: EdgeInsets.only(left: 30.0, right: 30.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Button(
              onpress: _number == ''
                  ? () {
                      print(_number);
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(""
                                  // AppLocale.of(BuildContext, context)
                                  //  .getTranslations("emptynumber"),
                                  ),
                              content:
                                  Text(//AppLocale.of(BuildContext, context)
                                      ""), // .getTranslations("numberalert")),
                            );
                          });
                    }
                  : () async {
                      _authenticationService.verifyPhoneNumber(
                          context, '+966 $_number', setData);
                      Navigator.pushNamed(context, AuthC.id, arguments: {
                        'number': _number.toString(),
                        'verificationid': verificationId
                      });
                    },
              text:
                  "", //AppLocale.of(BuildContext, context).getTranslations("save"),
              backColour: primaryColor,
              textColour: white,
            )
          ],
        ),
      ),
    );
  }

  void setData(verifId) {
    setState(() {
      verificationId = verifId;
    });
  }
}
