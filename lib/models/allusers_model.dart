import 'package:flutter/material.dart';

class usersModel with ChangeNotifier {
  String id;
  String name;
  String usn;
  String password;
  String email;
  String burning_desire;
  String passion;
 List <String> tech_stack;
List <String> programming_languages;
  List<String> interests;
  List<String> hobbies;
  String profileImage;

  usersModel({

    required this.id,
    required this.name,
    required this.usn,
    required this.email,
    required this.password,
    required this.passion,
    required this.hobbies,
    required this.burning_desire,
    required this.interests,
    required this.programming_languages,
    required this.tech_stack,
    required this.profileImage
  });
}
