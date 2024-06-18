import 'package:courses_app/components/style_seet.dart';
import 'package:courses_app/controllers/course_controller.dart';
import 'package:courses_app/views/BottomNavigationbar/user_type_screen.dart';
import 'package:courses_app/views/chart_screen.dart';
import 'package:courses_app/views/home/home_screen.dart';
import 'package:courses_app/views/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppBottomNavigationBar extends StatefulWidget {
  const AppBottomNavigationBar({super.key});

  @override
  State<AppBottomNavigationBar> createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  int index = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const ChartScreen(),
    const UserTypeScreen(),
    const ProfileScreen(),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data();
  }

  data() async {
    if (!await rebuild()) return;
    // Courses Data Get Function Call
    await Get.find<CourseController>().getCourses(context);
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
    return PopScope(
      // canPop: false,
      // onPopInvoked: (didPop) {
      //   print("--------$didPop");
      //   if (index == 0 && context.mounted) {
      //     print("---------");
      //     Get.back();
      //     Navigator.pop(context);
      //     print("-----====----");
      //   } else {
      //     index = 0;
      //     setState(() {});
      //   }
      // },
      child: Scaffold(
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(color: AppColor.raisinBlack, blurRadius: 5)
              ],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r))),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r)),
            child: BottomNavigationBar(
                currentIndex: index,
                onTap: (value) => setState(() {
                      index = value;
                    }),
                selectedLabelStyle: const TextStyle(fontSize: 0),
                unselectedLabelStyle: const TextStyle(fontSize: 0),
                selectedItemColor: AppColor.raisinBlack,
                unselectedItemColor: AppColor.frenchGray,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home,
                        size: 24.sp,
                      ),
                      label: ""),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.explore,
                        size: 24.sp,
                      ),
                      label: ""),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.menu_book_outlined,
                        size: 24.sp,
                      ),
                      label: ""),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.person,
                        size: 24.sp,
                      ),
                      label: ""),
                ]),
          ),
        ),
        body: screens[index],
      ),
    );
  }
}
