import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:whackiest_2023/models/allusers_model.dart';
import 'package:whackiest_2023/repo/home_repo.dart';

class UserProvider with ChangeNotifier {
  final HomeRepository _homeRepo = HomeRepository();

  HomeRepository get homeRepo => _homeRepo;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String id = '';
  String name = '';
  String usn = '';
  String password = '';
  String email = '';
  String burning_desire = '';
  String passion = '';
  List<String> tech_stack = [];
  List<String> programming_languages = [];
  List<String> interests = [];
  List<String> hobbies = [];

  List<usersModel> _Items = [];

  List<usersModel> get Items {
    return [..._Items];
  }

  Future<List<usersModel>> getUser() async {
    _isLoading = true;

    _Items = [];

    await _homeRepo.fetchAndAllUsers().then((response) {
      final responseData = json.decode(response);
      responseData['all_users'].forEach((prodData) {
        _Items.add(usersModel(
            id: prodData['_id'],
            name: prodData['name'],
            usn: prodData['usn'],
            email: prodData['email'],
            password: prodData['password'],
            passion: prodData['passion'],
            hobbies: prodData['hobbies'].cast<String>(),
            burning_desire: prodData['burning_desire'],
            interests: prodData['interests'].cast<String>(),
            programming_languages: prodData['programming_languages'].cast<String>(),
            tech_stack: prodData['tech_stack'].cast<String>(), profileImage: prodData['profile_pic']));
      });
    });
    _isLoading = false;


    notifyListeners();
    return Items;
  }
}
