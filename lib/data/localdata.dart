import 'package:flutter/material.dart';

class LocalData {
  static List<Map<String, dynamic>> filterlist = [
    {"title": "Design", "type": "Design"},
    {"title": "3D Modeling", "type": "3D Modeling"},
    {"title": "Motion", "type": "Motion"},
    {"title": "Adobe", "type": "Adobe"}
  ];
  static List<Map<String, dynamic>> chartData = [
    {"title": "Mon", "value": 120.0},
    {"title": "Tue", "value": 180.0},
    {"title": "Wed", "value": 165.0},
    {"title": "Thu", "value": 155.0},
    {"title": "Fri", "value": 60.0},
    {"title": "Sat", "value": 170.0},
    {"title": "Sun", "value": 0.0}
  ];
  // Create Profile Tile Data
 static List<Map<String, dynamic>> profileDataList = [
    {"title": "My Profile", "icon": Icons.person, "id": "profile"},
    {
      "title": "Help Support",
      "icon": Icons.question_mark_rounded,
      "id": "help"
    },
    {"title": "About us", "icon": Icons.error_outlined, "id": "Aboutus"},
    {"title": "Log out", "icon": Icons.exit_to_app_rounded, "id": "Log out"},
  ];
}
