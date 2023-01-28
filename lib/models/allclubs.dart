

import 'package:flutter/material.dart';

class clubModel with ChangeNotifier {
String cid;
String club_name;
String description;
String club_logo;

clubModel(
{required this.cid,
required this.club_name,
required this.description,
required this.club_logo,
});
}
