import 'package:courses_app/components/custom_appbar.dart';
import 'package:courses_app/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeScreen extends StatelessWidget {
  ThemeScreen({super.key});

  final themecontroller = Get.find<ThemeController>();
  List<ThemeMode> themeList = [
    ThemeMode.light,
    ThemeMode.dark,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        context: context,
        title: const Text("Theme"),
      ),
      body: Column(
        children: [
          ...List.generate(
            themeList.length,
            (index) => RadioListTile(
              value: themeList[index],
              groupValue: themecontroller.appTheme,
              onChanged: (v) {
                themecontroller.setTheme(v!);
                Get.back();
              },
              title: Text(themeList[index].name.toString()),
            ),
          )
        ],
      ),
    );
  }
}
