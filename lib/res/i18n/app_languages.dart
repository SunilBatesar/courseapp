import 'package:courses_app/model/language_model.dart';

class AppLanguages {
  // ALL LANGUAGE
  static LanguageModel englishUS = LanguageModel(
      languageName: "English", languageCode: "en", countryCode: "US");
  static LanguageModel hindi = LanguageModel(
      languageName: "Hindi", languageCode: "hi", countryCode: "IN");
  static LanguageModel french = LanguageModel(
      languageName: "French", languageCode: "fr", countryCode: "FR");
  static LanguageModel urda = LanguageModel(
      languageName: "Urdu", languageCode: "ur", countryCode: "PK");

  //   LANGUAGE LIST
  static List<LanguageModel> languagelist = [
    englishUS,
    hindi,
    french,
    urda,
  ];
}
