import 'package:courses_app/components/style_seet.dart';
import 'package:courses_app/model/all_model.dart';
import 'package:courses_app/res/services/app_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CoursesTile extends StatelessWidget {
  final MainCoursesModel model;
  final Function onPressed;
  const CoursesTile({super.key, required this.model, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Container(
        padding: EdgeInsets.all(10.sp),
        width: AppServices.screenWidth(context),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r), color: AppColor.seasalt),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: Image.network(
                    model.coursemodel.images!.first,
                    height: 150.h,
                    width: AppServices.screenWidth(context),
                    fit: BoxFit.cover,
                  ),
                ),
                UserModel.checkIsStudent(context)
                    ? Positioned(
                        bottom: -22.sp,
                        left: 10.w,
                        child: Container(
                          height: 50.h,
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              color: AppColor.white),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // ClipRRect(
                              //     borderRadius: BorderRadius.circular(1000),
                              //     child: Image.asset(
                              //       model.ownerimage!,
                              //       fit: BoxFit.contain,
                              //       width: 40.sp,
                              //       height: 40.sp,
                              //     )),
                              Gap(10.w),
                              // Text(
                              //   model.ownername!,
                              //   style: AppTextTheme.fs14Normal,
                              // ),
                            ],
                          ),
                        ),
                      )
                    : const SizedBox(),
                Positioned(
                  right: 10.w,
                  bottom: -22.sp,
                  child: Container(
                    height: 50.h,
                    padding:
                        EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: AppColor.white),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "\$16",
                          style: AppTextTheme.fs15Normal
                              .copyWith(decoration: TextDecoration.lineThrough),
                        ),
                        Gap(5.w),
                        Text(
                          "\$${model.coursemodel.price}",
                          style: AppTextTheme.fs16Medium,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Gap(25.h),
            Text(
              model.coursemodel.name!,
              style:
                  AppTextTheme.fs18Medium.copyWith(color: AppColor.raisinBlack),
            ),
            Gap(5.h),
            Text(
              "${model.classmodel.length} Sections .${model.coursemodel.duration} Hours",
              style:
                  AppTextTheme.fs14Normal.copyWith(color: AppColor.frenchGray),
            ),
          ],
        ),
      ),
    );
  }
}
