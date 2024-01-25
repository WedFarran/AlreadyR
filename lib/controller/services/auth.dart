import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../view/widgets/navigation_bar_widget.dart';

class AuthenticationService {
  final storage = const FlutterSecureStorage();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void storeTokenAndData(UserCredential userCredential) async {
    print("storing token and data");
    await storage.write(
        key: "token", value: userCredential.credential!.token.toString());
    print("the user tokennnnnnnnn : ${userCredential.credential!.token}");
    await storage.write(
        key: "usercredential", value: userCredential.toString());
  }

  Future<void> verifyPhoneNumber(
      BuildContext context, String phoneNumber, Function setData) async {
    PhoneVerificationCompleted verificationCompleted =
        (PhoneAuthCredential phoneAuthCredential) async {
      showSnackBar(context, 'verification completed');
    };
    PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException exception) {
      showSnackBar(context, exception.toString());
    };
    PhoneCodeSent codeSent =
        (String verificationID, [int? forceresendingtoken]) {
      print("the user token : $forceresendingtoken");
      showSnackBar(
          context, 'verification code have been sent to the phone number');
      setData(verificationID);
    };
    PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationID) {
      showSnackBar(context, "tome out");
    };
    try {
      await _auth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
          timeout: Duration(seconds: 120));
    } catch (error) {
      showSnackBar(context, error.toString());
    }
  }

  Future<void> signinWithPhoneNumber(
      String verificationId, String smsCode, BuildContext context) async {
    try {
      AuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);
      UserCredential userCredential = await _auth.signInWithCredential(
        credential,
      );
      storeTokenAndData(userCredential);

      Navigator.pushAndRemoveUntil(
          context,
          // ignore: non_constant_identifier_names
          MaterialPageRoute(builder: (Builder) => NavigationBarWidget()),
          (route) => false);

      showSnackBar(context, 'logged in');
    } catch (error) {
      showSnackBar(context, error.toString());
    }
  }

  void showSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
