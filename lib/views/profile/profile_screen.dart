import 'package:courses_app/components/style_seet.dart';
import 'package:courses_app/data/localdata.dart';
import 'package:courses_app/utils/routes/routes_name.dart';
import 'package:courses_app/view_model/user_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userprovider = Provider.of<UserViewModel>(context).userdata;
    return Scaffold(
      backgroundColor: AppColor.antiFlashWhite,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(1000),
              child: Image.asset(
                "assets/images/me_4.jpg",
                height: 100.sp,
                width: 100.sp,
                fit: BoxFit.cover,
              )),
          Gap(20.h),
          Text(
            userprovider.name!,
            style: AppTextTheme.fs20Medium,
          ),
          Gap(20.h),
          ...List.generate(
            LocalData.profileDataList.length,
            (index) => ListTile(
              onTap: () {
                setTilevalue(LocalData.profileDataList[index]["id"], context);
              },
              leading: Icon(
                LocalData.profileDataList[index]["icon"],
                size: 24.sp,
                color: AppColor.raisinBlack50,
              ),
              title: Text(
                LocalData.profileDataList[index]["title"],
                style: AppTextTheme.fs16Medium
                    .copyWith(color: AppColor.raisinBlack50),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 20.sp,
                color: AppColor.raisinBlack50,
              ),
            ),
          ),
        ],
      )),
    );
  }

  setTilevalue(String value, BuildContext context) {
    switch (value) {
      case "profile":
        return Navigator.pushNamed(context, RouteName.editProfileScreen);
      case "help":
        return;
      case "Aboutus":
        return;
      case "Log out":
        return;
      default:
    }
  }
}
