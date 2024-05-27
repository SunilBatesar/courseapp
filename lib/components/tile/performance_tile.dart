import 'package:courses_app/components/style_seet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class PerformanceTile extends StatelessWidget {
  final IconData icon;
  final String timetext;
  final String studyhour;
  PerformanceTile(
      {super.key,
      required this.icon,
      required this.timetext,
      required this.studyhour});
  final font = AppTextTheme();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(18.r)),
          color: AppColor.white),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.r)),
                      shape: BoxShape.rectangle,
                      color: AppColor.frenchGray50),
                  child: Icon(
                    icon,
                    color: AppColor.raisinBlack,
                  )),
              Gap(15.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    timetext,
                    style: AppTextTheme.fs13Normal
                        .copyWith(color: AppColor.frenchGray),
                  ),
                  Gap(3.h),
                  Row(
                    children: [
                      Text(
                        studyhour,
                        style: AppTextTheme.fs14Medium,
                      ),
                    ],
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
