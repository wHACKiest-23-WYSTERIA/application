import 'dart:convert';
import 'dart:core';
import 'dart:core';


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whackiest_2023/repo/home_repo.dart';

class RegisterProvider with ChangeNotifier {
  final HomeRepository _homeRepo = HomeRepository();
  HomeRepository get homeRepo => _homeRepo;
  String uid ="";
  String recommendations = "";

String age = "Age";
  String gender = "Male";
  String interests = "space";
  String techstack = "flutter";
  String programming_languages = "python";
  void updateinterests(String value) {
    interests = value;
    notifyListeners();
  }
  void updatetechstack(String value) {
    techstack = value;
    notifyListeners();
  }
  void updateprogramming_languages(String value) {
    programming_languages = value;
    notifyListeners();
  }








  final TextEditingController _nameController = TextEditingController();

  TextEditingController get nameController => _nameController;
  final TextEditingController _emailController = TextEditingController();

  TextEditingController get emailController => _emailController;

  final TextEditingController _phoneController = TextEditingController();

  TextEditingController get phoneController => _phoneController;

  final TextEditingController _usnController = TextEditingController();

  TextEditingController get usnController => _usnController;



  final TextEditingController _hobbiesController = TextEditingController();

  TextEditingController get hobbiesController => _hobbiesController;

  final TextEditingController _burning_desireController = TextEditingController();

  TextEditingController get burning_desireController => _burning_desireController;

  final TextEditingController _passionController = TextEditingController();

  TextEditingController get passionController => _passionController;





  final TextEditingController _passwordController = TextEditingController();

  TextEditingController get passwordController => _passwordController;

  void updateGender(String value) {
    gender = value;
    notifyListeners();
  }
  void updateAge(String value) {
    age = value;
    notifyListeners();
  }


  String profileImage = '';

  bool instituteNameError = false;
  bool city_idError = false;
  bool nameError = false;
  bool emailError = false;
  bool usnError = false;
  bool phoneError = false;
  bool passwordError = false;



  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void _showDialog(String message, BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Artisec!'),
        content: Text(message),
        actions: <Widget>[
          ElevatedButton(
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(const Size.fromHeight(40.0)),
              backgroundColor: MaterialStateProperty.all(Colors.blue),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0))),
            ),
            child: const Text('Okay'),
            onPressed: () {
              profileImage = "";
              nameController.text = "";
              age = "Age";
              gender ="Male";
              usnController.text = "";
              hobbiesController.text = "";
              phoneController.text = "";
              burning_desireController.text= "";
              passionController.text= "";
              notifyListeners();
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  }
  uploadProfileImage(String filepath) async {
    profileImage = filepath;
    notifyListeners();
  }

  register(BuildContext context) async {
    //bool emailValid = RegExp(
    //             r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
    //         .hasMatch(emailController.text);
    //     nameError = false;
    //     emailError = false;
    //     usnError = false;
    //     passwordError=false;
    //
    //     notifyListeners();
    //     if (nameController.text.isEmpty &&
    //         emailValid == true &&
    //         emailController.text.isEmpty&& usnController.text.isEmpty && passwordController.text.isEmpty ) {
    //       nameError = true;
    //       emailError = true;
    //       usnError = true;
    //       passwordError=true;
    //     } else if (nameController.text.isEmpty) {
    //       nameError = true;
    //     } else if (emailController.text.isEmpty && emailValid == false) {
    //       emailError = true;
    //     }
    //     else if (usnController.text.isEmpty) {
    //       usnError = true;
    //     }
    //     else if (passwordController.text.isEmpty) {
    //       passwordError = true;
    //     }
    //   else {
      await _homeRepo
          .register(profileImage,nameController.text, usnController.text, emailController.text, phoneController.text, interests, hobbiesController.text,
              burning_desireController.text, passionController.text, techstack, programming_languages,passwordController.text,age,gender)
          .then((response) async {
        final responseData = json.decode(response);
        print(responseData);
        print(responseData["message"]);

          _showDialog(responseData["message"], context);
       //    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainScreen()));




      });
   // }
    notifyListeners();
  }




  useruid(BuildContext context) async {

    await _homeRepo.getUserwithemail(emailController.text)
        .then((response) async {
      final responseData = json.decode(response);
      print(responseData);
      print(responseData["message"]);
      uid = responseData['uid'];


      await SharedPreferences.getInstance().then((prefs) {
        // prefs.setString('_id', _id);
        prefs.setString("uid", uid);
        print(uid);

        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainScreen()));
      });

    });
    // }
    notifyListeners();
  }









  reommendationsclub(BuildContext context) async {

    await _homeRepo.getUserRecommendations("coding")
        .then((response) async {
      final responseData = json.decode(response);
      print(responseData);
      print(responseData["message"]);
      recommendations = responseData['keywords'];


      await SharedPreferences.getInstance().then((prefs) {
        // prefs.setString('_id', _id);
        prefs.setString("keyword", recommendations);

        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainScreen()));
      });

    });
    // }
    notifyListeners();
  }












}





