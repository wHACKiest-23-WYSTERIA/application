import 'package:flutter/material.dart';

class memberModel with ChangeNotifier {
  String mid;
  String name;
  String usn;
  String dept;
  String year;

  memberModel(
      {required this.mid,
      required this.name,
      required this.usn,
      required this.dept,
      required this.year});
}
