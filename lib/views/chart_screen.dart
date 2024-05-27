import 'package:courses_app/components/style_seet.dart';
import 'package:courses_app/components/tile/performance_tile.dart';
import 'package:courses_app/data/localdata.dart';
import 'package:courses_app/services/app_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ChartScreen extends StatelessWidget {
  const ChartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.antiFlashWhite,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "This Week",
                style: AppTextTheme.fs20SemiBold,
              ),
              Gap(15.h),
              Container(
                padding: EdgeInsets.all(15.sp),
                width: AppServices.screenWidth(context),
                decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(20.r)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "34.2 Hours",
                      style: AppTextTheme.fs30SemiBold,
                    ),
                    Text(
                      "Time spent in the app",
                      style: AppTextTheme.fs13Normal
                          .copyWith(color: AppColor.frenchGray50),
                    ),
                    Gap(20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                          LocalData.chartData.length,
                          (index) => Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    alignment: Alignment.bottomCenter,
                                    width: 35.w,
                                    height: 200.h,
                                    decoration: BoxDecoration(
                                        color: AppColor.frenchGray,
                                        borderRadius:
                                            BorderRadius.circular(10.r)),
                                    child: Container(
                                      width: 35.w,
                                      height: ((LocalData.chartData[index]
                                              ["value"]) as double)
                                          .h,
                                      decoration: BoxDecoration(
                                          color: AppColor.raisinBlack,
                                          borderRadius:
                                              BorderRadius.circular(10.r)),
                                    ),
                                  ),
                                  Gap(5.h),
                                  Text(
                                    LocalData.chartData[index]["title"],
                                    style: AppTextTheme.fs12Normal
                                        .copyWith(color: AppColor.frenchGray),
                                  ),
                                ],
                              )),
                    ),
                  ],
                ),
              ),
              Gap(20.h),
              Text(
                "Your Performance",
                style: AppTextTheme.fs16Medium
                    .copyWith(color: AppColor.raisinBlack50),
              ),
              Gap(10.h),
              PerformanceTile(
                icon: Icons.abc_outlined,
                timetext: "Study Time",
                studyhour: "672 Houres",
              ),
              Gap(10.h),
              PerformanceTile(
                icon: Icons.watch_later_outlined,
                timetext: "Average/Day",
                studyhour: "4.6 Houres",
              )
            ],
          ),
        ),
      )),
    );
  }
}
