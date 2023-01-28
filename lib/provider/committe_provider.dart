import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:whackiest_2023/models/committe_model.dart';
import 'package:whackiest_2023/repo/home_repo.dart';

class CommitteeProvider with ChangeNotifier {
  final HomeRepository _homeRepo = HomeRepository();

  HomeRepository get homeRepo => _homeRepo;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String id = '';
  String name = '';
  String designation = '';
  String about = '';
  String ccid = "";

  List<commiteeModel> _commiteeItems = [];

  List<commiteeModel> get commiteeItems {
    return [..._commiteeItems];
  }
  void updatedcid(BuildContext context,
      String value1,

      ) {

    ccid = value1;

    notifyListeners();

  }

  getCommittee() async {
    _isLoading = true;

    _commiteeItems = [];

    await _homeRepo.fetchAndCommitte(ccid).then((response) {
      final responseData = json.decode(response);
      responseData['all_committe'].forEach((prodData) {
        _commiteeItems.add(commiteeModel(
            id: prodData['_id'],
            name: prodData['name'],
            about: prodData['about'],
            designation: prodData['designation'], profileImage: prodData['profile_pic']));
      });
    });
    _isLoading = false;

    notifyListeners();
  }
}
