import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'file:///D:/Flutter%20Apss/frontliners_task/lib/views/custom_toast.dart';
import 'package:front_task/screens/authScreen/otpInputScreen.dart';
import 'package:front_task/utils.dart';


class EnterMobileNumberScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  var phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: colorBlue),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(left: 30.0, right: 30.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "Login with phone",
                      style: text_Style(Colors.grey, 16.0, FontWeight.w500),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Enter your mobile number",
                      style: text_Style(Colors.black, 20.0, FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      height: 50.0,
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 2.0), borderRadius: BorderRadius.circular(7.0)),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: Text("+88", style: text_Style(Colors.black, 16.0, FontWeight.w400)),
                          ),
                          Container(
                            height: 40,
                            width: 1.0,
                            color: Colors.grey,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: TextFormField(
                                controller: phoneNumberController,
                                keyboardType: TextInputType.number,
                                inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
                                decoration: InputDecoration(
                                    hintText: "01999999999",
                                    hintStyle: text_Style(Colors.grey, 16.0, FontWeight.w400),
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none),
                                onSaved: (value) {
                                  phoneNumberController.text = value;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "By continuing you will receive an SMS with verification code.",
                    style: text_Style(Colors.black, 16.0, FontWeight.w300),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (phoneNumberController.text.isEmpty) {
                        showToast("Enter your phone number");
                        return;
                      }
                      if (phoneNumberController.text.length > 11 || phoneNumberController.text.length < 11) {
                        showToast("Invalid phone number");
                        return;
                      } else {
                        print("number:" + phoneNumberController.text);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => OtpInputScreen(phoneNumber: phoneNumberController.text)),
                        );
                      }
                    },
                    child: Container(
                      height: 50.0,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(7.0)),
                      child: Center(
                        child: Text(
                          "Next",
                          style: text_Style(Colors.white, 18.0, FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
