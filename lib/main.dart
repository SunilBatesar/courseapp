import 'package:courses_app/Preferences/sharedpreferences.dart';
import 'package:courses_app/classes/main_class.dart';
import 'package:courses_app/controllers/app_initialbinding.dart';
import 'package:courses_app/controllers/class_controller.dart';
import 'package:courses_app/firebase_options.dart';
import 'package:courses_app/res/services/appconfig.dart';
import 'package:courses_app/utils/routes/routes.dart';
import 'package:courses_app/utils/routes/routes_name.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

late MainClass maindata;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  maindata = MainClass.instance;
  await SPref.getpref();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ClassController(),
        ),
      ],
      child: ScreenUtilInit(
        builder: (context, child) => GetMaterialApp(
          initialBinding: AppInitialbinding(),
          initialRoute: RouteName.splashScreen,
          getPages: getXRouteList,
        ),
        designSize: Size(AppConfig.screenWidth, AppConfig.screenHeight),
      ),
    );
  }
}
