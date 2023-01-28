

import 'package:flutter/material.dart';

class announcementModel with ChangeNotifier {
  String title;
  String doc_link;
  String description;

  announcementModel(
      {required this.title,
        required this.doc_link,
        required this.description,
      });
}


