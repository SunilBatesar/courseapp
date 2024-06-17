import 'package:courses_app/utils/routes/routes_name.dart';
import 'package:courses_app/views/BottomNavigationbar/appbottomnavigationbar.dart';
import 'package:courses_app/views/BottomNavigationbar/user_type_screen.dart';
import 'package:courses_app/views/auth/login_screen.dart';
import 'package:courses_app/views/auth/singnup_screen.dart';
import 'package:courses_app/views/chart_screen.dart';
import 'package:courses_app/views/course_screens/course_detail_screen.dart';
import 'package:courses_app/views/course_screens/add_class_screen.dart';
import 'package:courses_app/views/course_screens/add_course_screen.dart';
import 'package:courses_app/views/home/home_screen.dart';
import 'package:courses_app/views/profile/edit_profile_screen.dart';
import 'package:courses_app/views/profile/profile_screen.dart';
import 'package:courses_app/views/splash/splash_screen.dart';
import 'package:get/get.dart';

// class AppRoutes {
//   static Route<dynamic> generatrRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case RouteName.homeScreen:
//         return MaterialPageRoute(
//           builder: (context) => const HomeScreen(),
//         );

//       case RouteName.appBottomNavigationBar:
//         return MaterialPageRoute(
//           builder: (context) => const AppBottomNavigationBar(),
//         );
//       case RouteName.chartScreen:
//         return MaterialPageRoute(
//           builder: (context) => const ChartScreen(),
//         );
//       case RouteName.courseDetailScreen:
//         {
//           dynamic arguments = settings.arguments as MainCoursesModel;
//           return MaterialPageRoute(
//               builder: (context) => CourseDetailScreen(
//                     model: arguments,
//                   ));
//         }
//       // Splash Screen Route
//       case RouteName.splashScreen:
//         return MaterialPageRoute(
//           builder: (context) => const SplashScreen(),
//         );
//       // Auth Route
//       case RouteName.loginScreen:
//         return MaterialPageRoute(
//           builder: (context) => const LoginScreen(),
//         );
//       case RouteName.singnupScreen:
//         return MaterialPageRoute(
//           builder: (context) => const SingnupScreen(),
//         );
//       // Profile Route
//       case RouteName.profileScreen:
//         return MaterialPageRoute(
//           builder: (context) => const ProfileScreen(),
//         );
//       case RouteName.editProfileScreen:
//         return MaterialPageRoute(
//           builder: (context) => const EditProfileScreen(),
//         );
//       // Course  Route
//       case RouteName.addCourseScreen:
//         return MaterialPageRoute(
//           builder: (context) => const AddCourseScreen(),
//         );
//       case RouteName.addClassScreen:
//         {
//           final String courseid = settings.arguments.toString();
//           return MaterialPageRoute(
//             builder: (context) => AddClassScreen(
//               courseid: courseid,
//             ),
//           );
//         }
// BottomNavigationbar  Route
// case RouteName.userTypeScreen:
//   return MaterialPageRoute(
//     builder: (context) => const UserTypeScreen(),
//   );

//       default:
//         return MaterialPageRoute(
//           builder: (context) => const Scaffold(
//             body: SafeArea(
//                 child: Center(
//               child: Text("No Routes"),
//             )),
//           ),
//         );
//     }
//   }
// }

final getXRouteList = [
  GetPage(name: RouteName.splashScreen, page: () => const SplashScreen()),
  GetPage(name: RouteName.homeScreen, page: () => const HomeScreen()),
  GetPage(
      name: RouteName.appBottomNavigationBar,
      page: () => const AppBottomNavigationBar()),
  GetPage(name: RouteName.chartScreen, page: () => const ChartScreen()),
  GetPage(name: RouteName.courseDetailScreen, page: () => CourseDetailScreen()),
  GetPage(name: RouteName.loginScreen, page: () => const LoginScreen()),
  GetPage(name: RouteName.singnupScreen, page: () => const SingnupScreen()),
  GetPage(name: RouteName.profileScreen, page: () => const ProfileScreen()),
  GetPage(
      name: RouteName.editProfileScreen, page: () => const EditProfileScreen()),
  GetPage(name: RouteName.addCourseScreen, page: () => const AddCourseScreen()),
  GetPage(name: RouteName.addClassScreen, page: () => const AddClassScreen()),
  GetPage(name: RouteName.userTypeScreen, page: () => const UserTypeScreen()),
];
