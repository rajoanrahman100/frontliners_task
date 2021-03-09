import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:front_task/screens/splashScreen.dart';
import 'package:front_task/utils.dart';
import 'package:front_task/views/pinDecoration.dart';

import '../../views/custom_toast.dart';


class OtpInputScreen extends StatefulWidget {
  var phoneNumber;

  OtpInputScreen({this.phoneNumber});

  @override
  _OtpInputScreenState createState() => _OtpInputScreenState();
}

class _OtpInputScreenState extends State<OtpInputScreen> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  /// Control the input text field.
  TextEditingController _pinEditingController = TextEditingController();

  /// Decorate the outside of the Pin.
  PinDecoration _pinDecoration = BoxLooseDecoration(enteredColor: Colors.black, hintText: '------');

  bool isCodeSent = false;
  String _verificationId;
  int _counter = 60;
  Timer _timer;

  @override
  void initState() {
    // TODO: implement initState
    _startTimer();
    _onVerifyCode();
  }

  void _onVerifyCode() async {
    setState(() {
      isCodeSent = true;
    });
    final PhoneVerificationCompleted verificationCompleted = (AuthCredential phoneAuthCredential) {
      _firebaseAuth.signInWithCredential(phoneAuthCredential).then((value) {
        if (value.user != null) {
          print("Numbers::::" + value.user.phoneNumber);
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => SplashScreenPage(),
              ),
              (Route<dynamic> route) => false);
        } else {
          showErrorToast("Error validating OTP, try again");
        }
      }).catchError((error) {
        showErrorToast("Try again in sometime");
      });
    };
    final PhoneVerificationFailed verificationFailed = (authException) {
      showErrorToast(authException.message);
      setState(() {
        isCodeSent = false;
      });
    };

    final PhoneCodeSent codeSent = (String verificationId, [int forceResendingToken]) async {
      _verificationId = verificationId;
      print("message Verification ID: $_verificationId");
      setState(() {
        _verificationId = verificationId;
      });
    };
    final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout = (String verificationId) {
      _verificationId = verificationId;
      print("message Verification ID: $_verificationId");

      setState(() {
        _verificationId = verificationId;
      });
    };

    // TODO: Change country code

    await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: "+88${widget.phoneNumber}",
        timeout: const Duration(seconds: 60),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  }

  void _onFormSubmitted() async {
    AuthCredential _authCredential = PhoneAuthProvider.credential(verificationId: _verificationId, smsCode: _pinEditingController.text);

    _firebaseAuth.signInWithCredential(_authCredential).then((value) {
      if (value.user != null) {
        print(value.user.phoneNumber);

        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => SplashScreenPage(),
            ),
            (Route<dynamic> route) => false);
      } else {
        showErrorToast("Error validating OTP, try again");
      }
    }).catchError((error) {
      showErrorToast("Something went wrong");
    });
  }

  void _startTimer() {
    _counter = 60;
    if (_timer != null) _timer.cancel();

    _timer = Timer.periodic(Duration(seconds: 1), (_timer) {
      setState(() {
        if (_counter > 0)
          _counter--;
        else
          _timer.cancel();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print(widget.phoneNumber);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: colorBlue),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Enter the 6-digit code that sent you at",
                    style: text_Style(colorBlack, 16.0, FontWeight.w400),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "+88${widget.phoneNumber}",
                    style: text_Style(colorBlack, 20.0, FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  PinInputTextField(
                    pinLength: 6,
                    decoration: _pinDecoration,
                    controller: _pinEditingController,
                    autoFocus: true,
                    textInputAction: TextInputAction.done,
                    onSubmit: (pin) {
                      if (pin.length == 6) {
                        _onFormSubmitted();
                      } else {
                        showErrorToast("Invalid OTP");
                      }
                    },
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _counter > 0
                          ? Text(
                              'Resend code in $_counter s',
                              style: text_Style(colorBlack, 16.0, FontWeight.w400),
                            )
                          : GestureDetector(
                              onTap: () {
                                _startTimer();
                                _onVerifyCode();
                              },
                              child: Text("Resend code", style: TextStyle(decoration: TextDecoration.underline, color: colorBlack, fontWeight: FontWeight.w500))),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    if (_pinEditingController.text.length == 6) {
                      _onFormSubmitted();
                    } else {
                      showErrorToast("Invalid OTP");
                    }
                  },
                  child: Container(
                    height: 50.0,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(color: colorBlue, borderRadius: BorderRadius.circular(7.0)),
                    child: Center(
                      child: Text(
                        "Login",
                        style: text_Style(Colors.white, 18.0, FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
