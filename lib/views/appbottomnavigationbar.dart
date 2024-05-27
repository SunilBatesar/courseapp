import 'package:courses_app/components/style_seet.dart';
import 'package:courses_app/views/chart_screen.dart';
import 'package:courses_app/views/course_screens/add_course_screen.dart';
import 'package:courses_app/views/home/home_screen.dart';
import 'package:courses_app/views/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    const AddCourseScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r)),
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
                      Icons.dark_mode,
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
    );
  }
}
