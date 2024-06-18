import 'package:courses_app/Preferences/sharedpreferences.dart';
import 'package:courses_app/components/style_seet.dart';
import 'package:courses_app/controllers/user_controller.dart';
import 'package:courses_app/res/services/appconfig.dart';
import 'package:courses_app/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

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
    final userProvider = Get.find<UserController>();
    final id = SPref.getSharedPrefs(SPref.userIDKey);
    Future.delayed(const Duration(milliseconds: 2), () async {
      if (id.isNotEmpty) {
        // NEW FUNCTIONS
        await userProvider.getUserDataFirebase(id, context);

        // OFF ALL Next Screen (App Bottom NavigationBar)
        Get.offAllNamed(RouteName.appBottomNavigationBar);
      } else {
        // OFF ALL Next Screen (Login Screen)
        Get.offAllNamed(RouteName.loginScreen);
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
