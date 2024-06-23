import 'package:courses_app/components/style_seet.dart';
import 'package:courses_app/controllers/user_controller.dart';
import 'package:courses_app/data/localdata.dart';
import 'package:courses_app/res/services/appconfig.dart';
import 'package:courses_app/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userprovider = Get.find<UserController>().userdata;
    return Scaffold(
      backgroundColor: AppColor.antiFlashWhite,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GetBuilder<UserController>(
            builder: (controller) {
              return Column(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(1000),
                      child: controller.userdata.image.isNotEmpty
                          ? Image.network(
                              controller.userdata.image,
                              height: 100.sp,
                              width: 100.sp,
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              AppConfig.applogo,
                              height: 100.sp,
                              width: 100.sp,
                              fit: BoxFit.cover,
                            )),
                  Gap(20.h),
                  Text(
                    controller.userdata.name,
                    style: AppTextTheme.fs20Medium,
                  ),
                ],
              );
            },
          ),
          Gap(20.h),
          ...List.generate(
            LocalData.profileDataList.length,
            (index) => ListTile(
              onTap: () {
                setTilevalue(LocalData.profileDataList[index]["id"]);
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

  setTilevalue(String value) {
    switch (value) {
      case "profile":
        return Get.toNamed(RouteName.editProfileScreen);
      case "theme":
        return Get.toNamed(RouteName.themeScreen);
      case "language":
        return Get.toNamed(RouteName.languageScreen);
      case "Log out":
        return Get.find<UserController>().logout();
      default:
    }
  }
}
