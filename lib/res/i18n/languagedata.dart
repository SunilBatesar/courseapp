import 'package:courses_app/res/i18n/app_languages.dart';
import 'package:get/get.dart';

class Languagedata extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        AppLanguages.englishUS.toString(): {
          "hello": "Hello",
          "welcome": "Welcome \n back",
          "MyProfile": "My Profile",
          "Theme": "Theme",
          "Language": "Language",
          "HelpSupport": "Help Support",
          "Aboutus": "About us",
          "Logout": "Log out",
        },
        AppLanguages.hindi.toString(): {
          "hello": "नमस्ते",
          "welcome": "वापसी पर\n स्वागत है",
          "MyProfile": "मेरी प्रोफाइल",
          "Theme": "विषय",
          "Language": "भाषा",
          "HelpSupport": "मदद समर्थन",
          "Aboutus": "हमारे बारे में",
          "Logout": "लॉग आउट",
        },
        AppLanguages.french.toString(): {
          "hello": "Bonjour",
          "welcome": "Content de\n te revoir",
          "MyProfile": "Mon profil",
          "Theme": "Thème",
          "Language": "Langue",
          "HelpSupport": "Support d'aide",
          "Aboutus": "À propos de nous",
          "Logout": "Se déconnecter",
        },
        AppLanguages.urda.toString(): {
          "hello": "ہیلو",
          "welcome": "خوش \nآمدید",
          "MyProfile": "میری پروفائل",
          "Theme": "خیالیہ",
          "Language": "زبان",
          "HelpSupport": "مدد کی حمایت",
          "Aboutus": "ہمارے بارے میں",
          "Logout": "لاگ آوٹ",
        },
      };
}
