import 'package:courses_app/components/style_seet.dart';
import 'package:courses_app/main.dart';
import 'package:courses_app/services/appconfig.dart';
import 'package:courses_app/utils/routes/routes_name.dart';
import 'package:courses_app/view_model/class_viewmodel.dart';
import 'package:courses_app/view_model/course_viewmodel.dart';
import 'package:courses_app/view_model/user_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

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
    final courseProvider = Provider.of<CourseViewModel>(context, listen: false);
    final classProvider = Provider.of<ClassViewModel>(context, listen: false);
    final id = pref.getSharedPrefs("userid");
    Future.delayed(const Duration(milliseconds: 2), () async {
      if (id != null) {
        // NEW FUNCTIONS
        await UserViewModel().getUserDataFirebase(id, context);
        // Courses Data Get Function Call
        await courseProvider.getCourses(context);
        // Class Data Get Function Call
        await classProvider.getClass(context);
        // Push Named And RemoveUntil Next Screen (App Bottom NavigationBar)
        Navigator.pushNamedAndRemoveUntil(
            context, RouteName.appBottomNavigationBar, (route) => false);
      } else {
        // Push Named And RemoveUntil Next Screen (Login Screen)
        Navigator.pushNamedAndRemoveUntil(
            context, RouteName.loginScreen, (route) => false);
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
