import 'package:courses_app/firebase_options.dart';
import 'package:courses_app/services/appconfig.dart';
import 'package:courses_app/utils/routes/routes.dart';
import 'package:courses_app/utils/routes/routes_name.dart';
import 'package:courses_app/view_model/boolsetter.dart';
import 'package:courses_app/view_model/class_viewmodel.dart';
import 'package:courses_app/view_model/course_viewmodel.dart';
import 'package:courses_app/view_model/maincourse_viewmodel.dart';
import 'package:courses_app/view_model/user_viewmodel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences sharedPrefs;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  sharedPrefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MaincourseViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => CourseViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => ClassViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => BoolSetter(),
        ),
      ],
      child: ScreenUtilInit(
        builder: (context, child) => const MaterialApp(
          initialRoute: RouteName.splashScreen,
          onGenerateRoute: AppRoutes.generatrRoute,
        ),
        designSize: Size(AppConfig.screenWidth, AppConfig.screenHeight),
      ),
    );
  }
}
