import 'package:flutter/material.dart';

class OngoingModel with ChangeNotifier {
  String id;
  String title;
  String description;
  String aim;
  String state;
  String start_date;
  String end_date;
  String image;


  OngoingModel({
    required this.id,
    required this.title,
    required this.description,
    required this.aim,
    required this.end_date,
    required this.state,
    required this.start_date,
    required this.image,

  });
}

class UpcomingModel with ChangeNotifier {
  String id;
  String title;
  String description;
  String aim;
  String state;
  String start_date;
  String end_date;
  String image;


  UpcomingModel({
    required this.id,
    required this.title,
    required this.description,
    required this.aim,
    required this.end_date,
    required this.state,
    required this.start_date,
    required this.image,



  });
}
class completedModel with ChangeNotifier {
  String id;
  String title;
  String description;
  String aim;
  String state;
  String start_date;
  String end_date;
  String image;

  completedModel({
    required this.id,
    required this.title,
    required this.description,
    required this.aim,
    required this.end_date,
    required this.state,
    required this.start_date,
    required this.image,

  });
}
