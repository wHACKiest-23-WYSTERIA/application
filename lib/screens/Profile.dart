
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whackiest_2023/screens/about_first.dart';



class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  static var _isInit = true;


  @override

  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
     // Provider.of<Profile>(context, listen: false).getProfile();

      setState(() {
        _isInit = false;
      });
    }

  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   // var data = Provider.of<Profile>(context);


    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ));
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;


    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(right: 20, left: 20),
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Profile",
                    style: TextStyle(
                      color: Color(0xff1f1d1d),
                      fontSize: 20,
                      fontFamily: "Lato",
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  Row(
                    children: [

                      Container( decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                        child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                          onPressed: (){
                            _showLogoutAlert();
                          }, child: const Text(
                          "Logout",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xfff6e80b),
                            fontSize: 12,
                            fontFamily: "Lato",
                            fontWeight: FontWeight.w700,
                          ),
                        ),),
                      )


                    ],
                  ),
                ],
              ),
            ),




            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: 100,
                    width: 115,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20),

                    ),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image(
                            fit: BoxFit.cover,
                            height: 100,
                            width: 100,
                            image: Image
                                .asset("data.image")
                                .image,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: GestureDetector(
                            onTap: () async {
                            },

                          ),
                        ),
                      ],
                    ))
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              children: [SizedBox(width: width*0.35,),
                Container(alignment: Alignment.center,
                  child:  Text(
                    "data.name",
                    style: const TextStyle(
                      color: Color(0xff1f1d1d),
                      fontSize: 18,
                      fontFamily: "Lato",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(width: width*0.20,),
                GestureDetector(onTap: (){},
                  child: const Text(
                    "Edit",
                    style: TextStyle(
                      color: Color(0xffe68c44),
                      fontSize: 20,
                      decoration: TextDecoration.underline,
                      fontFamily: "Lato",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
            Container(
              child: Padding(padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Column(mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       const Opacity(
                        opacity: 0.80,
                        child: Text(
                         "Email",
                          style: TextStyle(
                            color: Color(0xff1f1d1d),
                            fontSize: 12,
                          ),
                        ),
                      ),
                       Text(
                        "data.name",
                        style: const TextStyle(
                          color: Color(0xff1f1d1d),
                          fontSize: 14,
                          fontFamily: "Lato",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Divider(indent: 4,),
                      const Opacity(
                        opacity: 0.80,
                        child: Text(
                          "Mobile Number",
                          style: TextStyle(
                            color: Color(0xff1f1d1d),
                            fontSize: 12,
                          ),
                        ),
                      ),
                       Text(
                        "data.mobile",
                        style: const TextStyle(
                          color: Color(0xff1f1d1d),
                          fontSize: 14,
                          fontFamily: "Lato",
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  )),
            ),

          ]
        ),
      )
    );
  }
  void _showLogoutAlert() {
    var alertStyle = AlertStyle(
      animationType: AnimationType.fromBottom,
      isCloseButton: false,
      isOverlayTapDismiss: true,
      descStyle: const TextStyle(fontFamily: "regular", fontSize: 14),
      descTextAlign: TextAlign.start,
      animationDuration: const Duration(milliseconds: 400),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
        side: const BorderSide(
          color: Colors.grey,
        ),
      ),
      titleStyle: const TextStyle(color: Colors.black, fontFamily: "medium", fontSize: 16),
      alertAlignment: Alignment.center,
    );
    Future.delayed(const Duration(milliseconds: 300), () {
      Alert(
        context: context,
        style: alertStyle,
        title: "YellowBus!!",
        desc: "Are you sure ?",
        buttons: [
          DialogButton(
            border:  const Border.fromBorderSide(BorderSide(color: Colors.black, width: 1)),
            color: Colors.transparent,
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop();
            },
            width: 120,
            child: const Text(
              "Cancel",
              style: TextStyle(color: Colors.black, fontSize: 16, fontFamily: "lato"),
            ),
          ),
          DialogButton(
            color: Colors.transparent,
            border: const Border.fromBorderSide(BorderSide(color: Colors.yellowAccent, width: 1)),
            onPressed: () async {
              Navigator.of(context, rootNavigator: true).pop();

              // final profile = Provider.of<UserProvider>(context);
              // profile.profileStatus(false);

              SharedPreferences prefs = await SharedPreferences.getInstance();

              prefs.clear().then((value) {
                if (value) {
                  Future.delayed(const Duration(milliseconds: 800), () {
                    Navigator.of(context).pushAndRemoveUntil(
                      // the new route
                      MaterialPageRoute(
                        builder: (BuildContext context) => const About(),
                      ),

                      // this function should return true when we're done removing routes
                      // but because we want to remove all other screens, we make it
                      // always return false
                          (Route route) => false,
                    );
                  });
                }
              });
            },
            width: 120,
            child: const Text(
              "LOGOUT",
              style: TextStyle(color: Colors.yellowAccent, fontSize: 16, fontFamily: "medium"),
            ),
          )
        ],
      ).show();
    });
  }
}
