import 'package:flutter/material.dart';

class commiteeModel with ChangeNotifier {
  String id;
  String name;
  String designation;
  String about;
  String profileImage;





  commiteeModel({
    required this.id,
    required this.name,
    required this.designation,
    required this.about,
    required this.profileImage



  });
}
