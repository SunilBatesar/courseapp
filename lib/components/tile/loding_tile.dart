import 'package:courses_app/res/services/app_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';

class LodingTile extends StatelessWidget {
  const LodingTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppServices.screenWidth(context),
      height: AppServices.screenHeight(context),
      child: Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.white,
        // enabled: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            10,
            (index) => Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10.h),
                  height: 70,
                  width: 70,
                  color: Colors.red,
                ),
                Gap(10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 20.h,
                      width: 200.w,
                      color: Colors.red,
                    ),
                    Gap(5.h),
                    Container(
                      height: 20.h,
                      width: 100.w,
                      color: Colors.red,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
