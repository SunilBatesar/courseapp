import 'package:courses_app/model/language_model.dart';
import 'package:courses_app/res/i18n/app_languages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController {
  final Rx<LanguageModel> _language = AppLanguages.englishUS.obs;
  LanguageModel get language => _language.value;

  setLanguage(LanguageModel model) {
    final localeValue = Locale(model.languageCode, model.countryCode);
    Get.updateLocale(localeValue);
    _language(model);
    // SPref.setSharedPrefs(
    //     SPref.themeKey, "${model.languageCode}_${model.countryCode}");
  }
}
