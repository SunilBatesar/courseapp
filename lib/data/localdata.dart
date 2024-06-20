import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalData {
  static List<Map<String, dynamic>> filterlist = [
    {"title": "Dart", "type": "Dart"},
    {"title": "Android Development", "type": "Android Development"},
    {"title": "React JS", "type": "React JS"},
    {"title": "Java", "type": "Java"}
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
    {"title": "MyProfile".tr, "icon": Icons.person, "id": "profile"},
    {"title": "Theme".tr, "icon": Icons.dark_mode_sharp, "id": "theme"},
    {"title": "Language".tr, "icon": Icons.language, "id": "language"},
    {
      "title": "HelpSupport".tr,
      "icon": Icons.question_mark_rounded,
      "id": "help"
    },
    {"title": "Aboutus".tr, "icon": Icons.error_outlined, "id": "Aboutus"},
    {"title": "Logout".tr, "icon": Icons.exit_to_app_rounded, "id": "Log out"},
  ];
}
