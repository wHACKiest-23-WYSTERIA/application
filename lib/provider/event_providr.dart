import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:whackiest_2023/models/eventModel.dart';
import 'package:whackiest_2023/repo/home_repo.dart';

class EventProvider with ChangeNotifier {
  final HomeRepository _homeRepo = HomeRepository();

  HomeRepository get homeRepo => _homeRepo;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String id = '';
  String title = '';
  String description = '';
  String aim = '';
  String state = '';
  String start_date = '';
  String end_date = '';
  String ccid = "";


  List<OngoingModel> _ongoingitems = [];

  List<OngoingModel> get ongoingitems {
    return [..._ongoingitems];
  }
  void updatedcid(BuildContext context,
      String value1,

      ) {

    ccid = value1;

    notifyListeners();

  }


  List<completedModel> _completeditems = [];

  List<completedModel> get completeditems {
    return [..._completeditems];
  }



  List<UpcomingModel> _upcomingitems = [];

  List<UpcomingModel> get upcomingitems {
    return [..._upcomingitems];
  }
  void fetchData(int type) {
    if (type == 0) {
      getOngoingEvent();
    } else if(type == 1) {
      getUpcoming();
    }
    else
      getCompleted();

    notifyListeners();
  }

  getOngoingEvent() async {
    _isLoading = true;

    _ongoingitems = [];

    await _homeRepo.fetchAndOngoingEvent(ccid).then((response) {
      final responseData = json.decode(response);
      responseData['ongoing_events'].forEach((prodData) {
        _ongoingitems.add(OngoingModel(
            id: prodData['_id'],
            description: prodData['description'],
            title: prodData['title'],
            end_date: prodData['end_date'],
            aim: prodData['aim'],
            state: prodData['state'],
            start_date: prodData['start_date'],image:prodData['image1']));
      });
    });
    _isLoading = false;

    notifyListeners();
  }



  getCompleted() async {
    _isLoading = true;

    _completeditems = [];

    await _homeRepo.fetchAndCompletedEvent(ccid).then((response) {
      final responseData = json.decode(response);
      responseData['completed_events'].forEach((prodData) {
        _completeditems.add(completedModel(
            id: prodData['_id'],
            description: prodData['description'],
            title: prodData['title'],
            end_date: prodData['end_date'],
            aim: prodData['aim'],
            state: prodData['state'],
            start_date: prodData['start_date'], image:prodData['image1'] ));
      });
    });
    _isLoading = false;

    notifyListeners();
  }


  getUpcoming() async {
    _isLoading = true;

    _upcomingitems = [];

    await _homeRepo.fetchAndUpcomingEvent(ccid).then((response) {
      final responseData = json.decode(response);
      responseData['upcoming_events'].forEach((prodData) {
        _upcomingitems.add(UpcomingModel(
            id: prodData['_id'],
            description: prodData['description'],
            title: prodData['title'],
            end_date: prodData['end_date'],
            aim: prodData['aim'],
            state: prodData['state'],
            start_date: prodData['start_date'],image:prodData['image1']));
      });
    });
    _isLoading = false;

    notifyListeners();
  }


}


