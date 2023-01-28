import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:whackiest_2023/utils/url.dart';
class HomeRepository {

  Future<String> register(
      String profileImage,
      String userName,
      String password,
      String usn,
      String email,
      String phone_number,
      String interests,
      String hobbies,
      String burning_desire,
      String passion,
      String tech_stack,
      String programming_languages,
      String age,
      String gender,

      ) async {
    final url = Uri.parse('https://us-central1-coderithack-d8666.cloudfunctions.net/app/api/client/registeruser/');
    //https://us-central1-coderithack-d8666.cloudfunctions.net/app/api/client
    print(url);
    try {
      var request = http.MultipartRequest('POST', url);
      if (profileImage.isNotEmpty) {
        request.files.add(
            await http.MultipartFile.fromPath('file', profileImage));
      }

      request.fields['name'] = userName;
      request.fields['usn'] = usn;
      request.fields['email'] = email;
      request.fields['phone_number'] = phone_number;
      request.fields['interests'] = interests;
      request.fields['burning_desire'] = burning_desire;
      request.fields['passion'] = passion;
      request.fields['tech_stack'] = tech_stack;
      request.fields['programming_languages'] = programming_languages;
      request.fields['hobbies'] = tech_stack;
      request.fields['password'] = password;
      request.fields['age'] = age;
      request.fields['gender'] = gender;


      var res = await request.send();
      final respStr = await res.stream.bytesToString();

      return respStr;
    } catch (error) {
      print(error);
      rethrow;
    }
  }
  Future<String> fetchAndCommitte(String club_id) async {
    final url = Uri.parse('https://us-central1-coderithack-d8666.cloudfunctions.net/app/api/client/getallcommitte/?club_id=${club_id}');
    try {
      final response = await http.get(url);

      print(response.body);

      return response.body;
    } catch (error) {
      throw (error);
    }
  }

  Future<String> fetchAndOngoingEvent(String club_id) async {
    final url = Uri.parse('https://us-central1-coderithack-d8666.cloudfunctions.net/app/api/client/getongoingevents/?club_id=a93c832a-d870-40de-a7b5-7a459c5db9fc');
    try {
      final response = await http.get(url);

      print(response.body);

      return response.body;
    } catch (error) {
      throw (error);
    }
  }

  Future<String> fetchAndUpcomingEvent(String club_id) async {
    final url = Uri.parse('https://us-central1-coderithack-d8666.cloudfunctions.net/app/api/client/getupcomingevents/?club_id=${club_id}');
    try {
      final response = await http.get(url);

      print(response.body);

      return response.body;
    } catch (error) {
      throw (error);
    }
  }

  getUserwithemail(String email) async {
    final url = Uri.parse('https://us-central1-coderithack-d8666.cloudfunctions.net/app/api/client/getuser/');

    try {
      final response = await http.post(url, body: {
        "email" : email,


      });

      print(url);

      return response.body;
    } catch (error) {
      throw (error);
    }



  }
  getUserRecommendations(String keywords) async {
    final url = Uri.parse('  https://us-central1-coderithack-d8666.cloudfunctions.net/app/api/client/getclubrecommendations');

    try {
      final response = await http.post(url, body: {
        "keywords" : ["computers","coding"],


      });

      print(url);

      return response.body;
    } catch (error) {
      throw (error);
    }



  }


  Future<String> fetchAndCompletedEvent(String club_id) async {
    final url = Uri.parse('https://us-central1-coderithack-d8666.cloudfunctions.net/app/api/client/getcompletedevents/?club_id=${club_id}');
    try {
      final response = await http.get(url);

      print(response.body);

      return response.body;
    } catch (error) {
      throw (error);
    }
  }

  Future<String> fetchAndAchievements(String club_id) async {
    final url = Uri.parse('https://us-central1-coderithack-d8666.cloudfunctions.net/app/api/client/getallachievements/?club_id=a93c832a-d870-40de-a7b5-7a459c5db9fc');
    print(url);
    try {
      final response = await http.get(url);

      print(response.body);

      return response.body;
    } catch (error) {
      throw (error);
    }
  }

  Future<String> fetchAndAllUsers() async {
    final url = Uri.parse('https://us-central1-coderithack-d8666.cloudfunctions.net/app/api/client/getallusers/');
    try {
      final response = await http.get(url);

      print(response.body);

      return response.body;
    } catch (error) {
      throw (error);
    }
  }

  Future<String> getClubnames() async {
    final url = Uri.parse('https://us-central1-coderithack-d8666.cloudfunctions.net/app/api/client/getallclubs/');
    try {
      final response = await http.get(url);

      print(response.body);

      return response.body;
    } catch (error) {
      throw (error);
    }
  }
  Future<String> getClubannouncemnts(String cid) async {
    final url = Uri.parse('https://us-central1-coderithack-d8666.cloudfunctions.net/app/api/client/getannouncements?club_id=fe62ab9f-17e1-4488-91f7-261680e301a9');
    print(cid);
    try {
      final response = await http.get(url);

      print(response.body);

      return response.body;
    } catch (error) {
      throw (error);
    }
  }
}