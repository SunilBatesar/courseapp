import 'package:courses_app/components/SharedPreferences/usersharedpreferences.dart';
import 'package:courses_app/components/style_seet.dart';
import 'package:courses_app/services/appconfig.dart';
import 'package:courses_app/utils/routes/routes_name.dart';
import 'package:courses_app/view_model/class_viewmodel.dart';
import 'package:courses_app/view_model/course_viewmodel.dart';
import 'package:courses_app/view_model/user_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    nextScreen();
  }

  nextScreen() async {
    if (!await rebuild()) return;
    // UserSharedPreferences().removUserSharedPrefs();
    final id = UserSharedPreferences().getuserSharedPrefs();
    print(id);
    Future.delayed(const Duration(milliseconds: 2), () async {
      if (id != null) {
        // OLD Functions
        // await FirebaseFirestoreFunction().getUserData(id, context);
        // await FirebaseFirestoreFunction().getCoursesDataFirestore(context);

        // NEW FUNCTIONS
        await UserViewModel().getUserDataFirebase(id, context);
        await CourseViewModel().getCoursesDataFirestore(context);
        await ClassViewModel().getClassDataFirebase(context);
        Navigator.pushNamed(context, RouteName.appBottomNavigationBar);
      } else {
        Navigator.pushNamed(context, RouteName.loginScreen);
      }
    });
  }

  Future<bool> rebuild() async {
    if (!mounted) return false;
    // if there's a current frame,
    if (SchedulerBinding.instance.schedulerPhase != SchedulerPhase.idle) {
      // wait for the end of that frame.
      await SchedulerBinding.instance.endOfFrame;
      if (!mounted) return false;
    }

    setState(() {});
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration:
            const BoxDecoration(color: Color.fromARGB(146, 234, 217, 183)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AppConfig.applogo,
              height: 200.sp,
              width: 200.sp,
            ),
            Gap(20.h),
            Text(
              AppConfig.appName,
              style: AppTextTheme.fs20SemiBold,
            )
          ],
        ),
      ),
    );
  }
}
