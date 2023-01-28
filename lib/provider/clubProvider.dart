import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:whackiest_2023/models/allclubs.dart';
import 'package:whackiest_2023/models/announcements.dart';
import 'package:whackiest_2023/repo/home_repo.dart';
import 'package:whackiest_2023/screens/main_class.dart';

class clubProvider with ChangeNotifier {
  final HomeRepository _homeRepo = HomeRepository();
  String ccid = "";

  HomeRepository get homeRepo => _homeRepo;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String id = '';
  String title = '';
  String designation = '';
  String description = '';
  List<clubModel> _members = [];

  List<clubModel> _Items = [];

  List<clubModel> get Items {
    return [..._Items];
  }
  List<announcementModel> _Items1 = [];

  List<announcementModel> get Items1 {
    return [..._Items1];
  }
  getclubs() async {
    _isLoading = true;

    _Items = [];
    await _homeRepo.getClubnames().then((response) {
      final responseData = json.decode(response);
      responseData['all_clubs'].forEach((prodData) {
        _Items.add(clubModel(
            cid: prodData['club_id'],
            description: prodData['description'],
            club_logo: prodData['club_logo'],
            club_name: prodData['club_name']));
      });
    });
    _isLoading = false;

    notifyListeners();
  }


  void updatedcid(BuildContext context,
      String value1,

      ) {

    ccid = value1;

    notifyListeners();
    Navigator.push(context, MaterialPageRoute(builder: (context)=>MainScreen()));

  }

  getAnnouncements() async {
    _isLoading = true;

    _Items1 = [];
    await _homeRepo.getClubannouncemnts(ccid).then((response) {
      final responseData = json.decode(response);
      responseData['all_announcements'].forEach((prodData) {
        _Items1.add(announcementModel(
            title: prodData['title'],
            doc_link: prodData['doc_link'],
            description: prodData['description'],
         ));
      });
    });
    _isLoading = false;

    notifyListeners();
  }


}
