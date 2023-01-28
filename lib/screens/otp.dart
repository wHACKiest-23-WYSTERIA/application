import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:provider/provider.dart';
import 'package:whackiest_2023/provider/auth_provider.dart';
import 'package:whackiest_2023/provider/register_provider.dart';
import 'package:whackiest_2023/screens/all_clubs.dart';
import 'package:whackiest_2023/screens/main_class.dart';
import 'package:whackiest_2023/utils/colorConstants.dart';


// ignore: use_key_in_widget_constructors


class PinCodeVerificationScreen extends StatefulWidget {

  const PinCodeVerificationScreen({
    Key? key,
  }) : super(key: key);

  @override
  _PinCodeVerificationScreenState createState() =>
      _PinCodeVerificationScreenState();
}

class _PinCodeVerificationScreenState extends State<PinCodeVerificationScreen> {
  // ..text = "123456";

  // ignore: close_sinks

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;



  @override


  // snackBar Widget
  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var auth2 = Provider.of<AuthProvider>(context);
    var reg = Provider.of<RegisterProvider>(context);


    //   var auth = Provider.of<AuthProvider>(context);

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      //color set to transperent or set your own color
      statusBarIconBrightness: Brightness.dark,
      //set brightness for icons, like dark background light icons
    ));
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
              padding: const EdgeInsets.only(right: 20, left: 20),
              height: 60,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image(
                          image: Image.asset('lib/assets/icons/goback.png').image,
                          height: 20.0,
                          width: 20.0,
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),

            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 20,
              ),
              alignment: Alignment.centerLeft,
              child: const Text(
                "Enter OTP",
                style: TextStyle(
                  color: Color(0xff1f1d1d),
                  fontSize: 28,
                  fontFamily: "Playfair Display",
                  fontWeight: FontWeight.w600,
                ),
              ),

            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 20),
              child: const Text(
                "We’ve sent an otp To Your Registered no",
                style: TextStyle(
                  color: Color(0xff1f1d1d),
                  fontSize: 14,
                ),
              ),

            ),
        const SizedBox(height: 50,),
//denter=
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PinCodeTextField(
                  controller: auth2.otpController,
                  pinBoxColor: ConstantColors.button,
                  autofocus: true,
                  highlight: true,
                //  controller: auth.otpController,
                  highlightColor: ConstantColors.button,
                 defaultBorderColor: Colors.grey,
                  maxLength: 6,
               //   hasError: auth.otpError,
                  onTextChanged: (text) {
                    setState(() {
                      // hasError = false;
                    });
                  },
                  onDone: (text) {
                    print("DONE $text");
                    //auth.updateOTPStatus(context);

                    //  print("DONE CONTROLLER ${controller.text}");
                  },
                  pinBoxWidth: 40,
                  pinBoxHeight: 40,
                  hasUnderline: false,
                  wrapAlignment: WrapAlignment.spaceEvenly,
                  pinBoxDecoration: ProvidedPinBoxDecoration.defaultPinBoxDecoration,
                  pinBoxBorderWidth: 1.0,
                  pinBoxRadius: 5.0,
                  pinTextStyle: const TextStyle(fontSize: 18.0),
                  pinTextAnimatedSwitcherTransition: ProvidedPinBoxTextAnimation.scalingTransition,
                  pinTextAnimatedSwitcherDuration: const Duration(milliseconds: 300),
                 highlightAnimationBeginColor: Color(0xfffffde7),
                 hasTextBorderColor: Color(0xfffffde7),
                  highlightAnimationEndColor: Colors.white12,
                  pinBoxOuterPadding: const EdgeInsets.symmetric(horizontal: 10),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Visibility(
               // visible: auth.otpError,
                child: const Text(
                  "*Invalid OTP. Please enter a valid OTP.",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                  ),
                )),



        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Didn’t receive an email? Resend",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
            TextButton(
              onPressed: () => snackBar("OTP resend!!"),
              child: const Text(
                "RESEND",
                style: TextStyle(
                    color: Color(0xFF91D3B3),
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            )
          ],
        ),
            const SizedBox(height:20),


            Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

            Container(
                width: width,
                height: 50,
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: ConstantColors.button),
                  onPressed: () async{
                    reg.reommendationsclub;


                    Navigator.push(context, MaterialPageRoute(builder: (context)=>AllClubs()));
                 //   if (auth.otpController.text.isEmpty || auth.otpController.text.length < 4) {
                    //                       auth.showOTPError();
                    //                     } else {
                    //                       auth.updateOTPStatus(context);
                    //                     }
                  },

                  child: Container(
                    width: 71.13,
                    child: const Text(
                      "Verify",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ConstantColors.text,
                        fontSize: 16,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                )),

          ]),
            SizedBox(
              height: height / 3,
            ),

        ]

      ),
    ))
    );
  }
}
