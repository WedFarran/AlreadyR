import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import '../../constants/layout_constant.dart';
import '../../controller/services/auth.dart';
import '../widgets/auth_widget.dart';
import '../widgets/button.dart';

class AuthC extends StatefulWidget {
  static const String id = 'code_screen';

  @override
  _AuthCState createState() => _AuthCState();
}

class _AuthCState extends State<AuthC> {
  String smsCode = '';
  @override
  Widget build(BuildContext context) {
    AuthenticationService _authenticationService = AuthenticationService();
    Size size = MediaQuery.of(context).size;
    final _arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final number = _arguments['number'];
    // final verificationId = _arguments['verificationid'];
    var verificationId;
    void setData(verifId) {
      setState(() {
        verificationId = verifId;
      });
    }

    return Scaffold(
        backgroundColor: red,
        body: AuthWidget(
          imageAsset: 'assets/images/random/code.png',
          size: size,
          widgett: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "", // '${AppLocale.of(BuildContext, context).getTranslations("verficationcode")} \n966$number',
                textAlign: TextAlign.center,
                style: Lightgrey17,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "",
                ),
              ), //   '(${AppLocale.of(BuildContext, context).getTranslations("edit")})')),
              SizedBox(
                height: size.height * 0.04,
              ),
              Directionality(
                textDirection: TextDirection.ltr,
                child: OTPTextField(
                  length: 6,
                  width: size.width * 1.0,
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldWidth: 50,
                  fieldStyle: FieldStyle.box,
                  outlineBorderRadius: 30,
                  onCompleted: (pin) {
                    print(
                        "Completed:------------------------------------------------------------------------ " +
                            pin);
                    setState(() {
                      smsCode = pin;
                    });
                  },
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "",
                  ), //AppLocale.of(BuildContext, context)
                  // .getTranslations("didntreceive")),
                  TextButton(
                      onPressed: () async {
                        _authenticationService.verifyPhoneNumber(
                            context, '+966 $number', setData);
                      },
                      child: Text(
                        "",
                      )) //'(${AppLocale.of(BuildContext, context).getTranslations("resend")})'))
                ],
              ),
              Button(
                onpress: () {
                  _authenticationService.signinWithPhoneNumber(
                      verificationId, smsCode.trim(), context);
                  print(
                      "Completed:------------------------------------------------------------------------ " +
                          smsCode);
                },
                text: // AppLocale.of(BuildContext, context)
                    "", // .getTranslations("verify"),
                backColour: red,
                textColour: white,
              )
            ],
          ),
        ));
  }
}
