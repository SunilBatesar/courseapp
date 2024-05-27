import 'package:courses_app/model/all_model.dart';
import 'package:courses_app/utils/routes/routes_name.dart';
import 'package:courses_app/views/appbottomnavigationbar.dart';
import 'package:courses_app/views/auth/login_screen.dart';
import 'package:courses_app/views/auth/singnup_screen.dart';
import 'package:courses_app/views/chart_screen.dart';
import 'package:courses_app/views/course_detail_screen.dart';
import 'package:courses_app/views/course_screens/add_class_screen.dart';
import 'package:courses_app/views/course_screens/add_course_screen.dart';
import 'package:courses_app/views/home/home_screen.dart';
import 'package:courses_app/views/profile/edit_profile_screen.dart';
import 'package:courses_app/views/profile/profile_screen.dart';
import 'package:courses_app/views/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic> generatrRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );

      case RouteName.appBottomNavigationBar:
        return MaterialPageRoute(
          builder: (context) => const AppBottomNavigationBar(),
        );
      case RouteName.chartScreen:
        return MaterialPageRoute(
          builder: (context) => const ChartScreen(),
        );
      case RouteName.courseDetailScreen:
        {
          dynamic arguments = settings.arguments as CourseModel;
          return MaterialPageRoute(
              builder: (context) => CourseDetailScreen(
                    model: arguments,
                  ));
        }
      // Splash Screen Route
      case RouteName.splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      // Auth Route
      case RouteName.loginScreen:
        return MaterialPageRoute(
          builder: (context) => LoginScreen(),
        );
      case RouteName.singnupScreen:
        return MaterialPageRoute(
          builder: (context) => const SingnupScreen(),
        );
      // Profile Route
      case RouteName.profileScreen:
        return MaterialPageRoute(
          builder: (context) => const ProfileScreen(),
        );
      case RouteName.editProfileScreen:
        return MaterialPageRoute(
          builder: (context) => EditProfileScreen(),
        );
      // Course  Route
      case RouteName.addCourseScreen:
        return MaterialPageRoute(
          builder: (context) => const AddCourseScreen(),
        );
      case RouteName.addClassScreen:
        {
          final String courseid = settings.arguments.toString();
          return MaterialPageRoute(
            builder: (context) => AddClassScreen(
              courseid: courseid,
            ),
          );
        }

      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: SafeArea(
                child: Center(
              child: Text("No Routes"),
            )),
          ),
        );
    }
  }
}
