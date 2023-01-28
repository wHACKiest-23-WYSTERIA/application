import 'package:flutter/material.dart';
import 'package:whackiest_2023/models/members_model.dart';

class achivementModel with ChangeNotifier {
  String id;
  String title;
  String description;
  List<memberModel>members;
  String image;



  achivementModel({
    required this.id,
    required this.title,
    required this.description,
    required this.members,
    required this.image,




  });
}
