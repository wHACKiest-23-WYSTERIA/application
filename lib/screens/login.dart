
import 'dart:convert';
import 'dart:io';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:whackiest_2023/provider/auth_provider.dart';
import 'package:whackiest_2023/provider/register_provider.dart';
import 'package:whackiest_2023/screens/otp.dart';
import 'package:whackiest_2023/screens/registration.dart';
import 'package:whackiest_2023/utils/colorConstants.dart';



class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
  static const routeName = '/login';

}

class _LoginState extends State<Login> {

  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    bool loading = false;

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      //color set to transperent or set your own color
      statusBarIconBrightness: Brightness.dark,
      //set brightness for icons, like dark background light icons
    ));
    var auth = Provider.of<AuthProvider>(context);
    var reg = Provider.of<RegisterProvider>(context);

    void _showErrorDialog(String message) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Artisec!'),
          content: Text(message),
          actions: <Widget>[
            ElevatedButton(
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(const Size.fromHeight(40.0)),
                backgroundColor: MaterialStateProperty.all(Colors.black),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))),
              ),
              child: const Text('Okay'),
              onPressed: () {
                Navigator.of(ctx).pop();
              },
            )
          ],
        ),
      );
    }



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
                  Row(
                    children:  [
                      GestureDetector(
                        onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> const Registration()));},
                        child: const Text(
                          "Register",
                          style: TextStyle(
                            color: Color(0xff1f1d1d),
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                            fontFamily: "Lato",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
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
                "Let’s Sign you in.",
                style: TextStyle(
                  color: Color(0xff1f1d1d),
                  fontSize: 28,
                  fontFamily: "Playfair Display",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 20),
              child: const Text(
                "Welcome back. You’ve been missed!",
                style: TextStyle(
                  color: Color(0xb21f1d1d),
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 20),
              child: const Text(
                "Phone No",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ConstantColors.text,
                  fontSize: 12,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: width,
              height: 70,
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                controller: auth.phoneController,
                autofocus: true,
               // controller: auth.emailController,

                decoration: const InputDecoration(
                  border: InputBorder.none,

                  fillColor: ConstantColors.button,
                  filled: true,
                  isDense: true
                ),

              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 20),
              child: const Text(
                "Email",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ConstantColors.text,
                  fontSize: 12,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: width,
              height: 70,
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                controller: reg.emailController,
                autofocus: true,
                // controller: auth.emailController,

                decoration: const InputDecoration(
                    border: InputBorder.none,

                    fillColor: ConstantColors.button,
                    filled: true,
                    isDense: true
                ),

              ),
            ),


            Container(
                width: width,
                height: 50,
                padding: const EdgeInsets.only(left: 20, right: 20),
                margin:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: const Color(0x190bd3f6)),
                  onPressed: () async {
                    reg.useruid(context);
                    reg.emailController.text = '';

                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const PinCodeVerificationScreen()));



                  },
                  child: Container(
                    width: 71.13,
                    child: const Text(
                      "GET OTP",
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
            SizedBox(
              height: height / 3,
            ),
            Container(
              width: width / 3,
              height: 30,
              //child: const Image(
              //                 image: AssetImage("assets/icons/Yellowbus Logo.png"),
              //                 height: 100,
              //               ),
            )
          ]),
        ),
      ),
    );
  }
}

