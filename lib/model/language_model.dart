class LanguageModel {
  String languageName;
  String languageCode;
  String countryCode;
  LanguageModel(
      {required this.languageName,
      required this.languageCode,
      required this.countryCode});

  @override
  String toString() {
    return "${languageCode}_$countryCode";
  }
}
