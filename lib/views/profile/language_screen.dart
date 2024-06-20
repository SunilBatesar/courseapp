import 'package:courses_app/components/custom_appbar.dart';
import 'package:courses_app/controllers/language_controller.dart';
import 'package:courses_app/res/i18n/app_languages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageScreen extends StatelessWidget {
  LanguageScreen({super.key});

  final languageController = Get.find<LanguageController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        context: context,
        title: const Text("Language"),
      ),
      body: Column(
        children: [
          ...List.generate(
            AppLanguages.languagelist.length,
            (index) {
              return RadioListTile(
                value: AppLanguages.languagelist[index],
                groupValue: languageController.language,
                onChanged: (v) {
                  languageController.setLanguage(v!);
                  Get.back();
                },
                title: Text(AppLanguages.languagelist[index].languageName),
              );
            },
          )
        ],
      ),
    );
  }
}
