import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:whackiest_2023/models/members_model.dart';
import 'package:whackiest_2023/models/studentachivements_model.dart';
import 'package:whackiest_2023/repo/home_repo.dart';

class AchievementProvider with ChangeNotifier {
  final HomeRepository _homeRepo = HomeRepository();

  HomeRepository get homeRepo => _homeRepo;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String ccid = "";

  String id = '';
  String title = '';
  String designation = '';
  String description = '';
  List<memberModel> _members = [];

  List<achivementModel> _Items = [];

  List<achivementModel> get Items {
    return [..._Items];
  }

  List<memberModel> get members {
    return [..._members];
  }
  void updatedcid(BuildContext context,
      String value1,

      ) {

    ccid = value1;

    notifyListeners();
  }

  getAchievement() async {
    _isLoading = true;

    _Items = [];

    await _homeRepo.fetchAndAchievements(ccid).then((response) {
      final responseData = json.decode(response);
      responseData['all_achievements'].forEach((prodData) {
        _Items.add(achivementModel(
          id: prodData['_id'],
          title: prodData['title'],
          description: prodData['description'], members: [], image: prodData['image1'],
        ));
      });
    });
    _isLoading = false;

    notifyListeners();
  }
}
