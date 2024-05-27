import 'package:courses_app/components/style_seet.dart';
import 'package:courses_app/model/all_model.dart';
import 'package:courses_app/services/app_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CourseDetailScreen extends StatelessWidget {
  final CourseModel model;
  const CourseDetailScreen({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.antiFlashWhite,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0.sp),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.r),
                        child: Image.network(
                          model.images!.first,
                          height: 240.h,
                          width: AppServices.screenWidth(context),
                          fit: BoxFit.fill,
                        ),
                      ),
                      Positioned(
                        left: 15.w,
                        top: 15.sp,
                        child: InkWell(
                          onTap: () {
                            AppServices.popView(context);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 15.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r),
                                color: AppColor.white),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                  color: AppColor.raisinBlack,
                                  size: 15.sp,
                                ),
                                Gap(10.w),
                                Text(
                                  "Back",
                                  style: AppTextTheme.fs14Medium
                                      .copyWith(color: AppColor.raisinBlack),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
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
                      ),
                      Positioned(
                        right: 10.w,
                        bottom: -22.sp,
                        child: Container(
                          height: 50.h,
                          padding: EdgeInsets.symmetric(
                              vertical: 5.h, horizontal: 10.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              color: AppColor.white),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "\$16",
                                style: AppTextTheme.fs15Normal.copyWith(
                                    decoration: TextDecoration.lineThrough),
                              ),
                              Gap(5.w),
                              Text(
                                "\$${model.price}",
                                style: AppTextTheme.fs16Medium,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Gap(30.h),
                  Text(
                    model.name!,
                    style: AppTextTheme.fs25SemiBold
                        .copyWith(color: AppColor.raisinBlack),
                  ),
                  Gap(15.h),
                  // Text(
                  //   "${model.sections} Sections .${model.time} Hours",
                  //   style: AppTextTheme.fs16Medium
                  //       .copyWith(color: AppColor.frenchGray),
                  // ),
                  Gap(20.h),
                  // Stack(
                  //   clipBehavior: Clip.none,
                  //   children: [
                  //     Row(
                  //       children: List.generate(
                  //         model.studentimage!.length >= 4
                  //             ? 4
                  //             : model.studentimage!.length,
                  //         (index) => Transform(
                  //             transform:
                  //                 Matrix4.translationValues(index * -25, 0, 0),
                  //             child: StudentImageDp(
                  //                 imagepath: model.studentimage![index])),
                  //       ),
                  //     ),
                  //     model.studentimage!.length >= 5
                  //         ? Positioned(
                  //             left: 100.sp,
                  //             child: Container(
                  //               alignment: Alignment.center,
                  //               padding: EdgeInsets.all(5.sp),
                  //               height: 50.sp,
                  //               width: 50.sp,
                  //               decoration: const BoxDecoration(
                  //                   color: AppColor.white,
                  //                   shape: BoxShape.circle),
                  //               child: ClipRRect(
                  //                 borderRadius: BorderRadius.circular(1000),
                  //                 child: Text(
                  //                     "+${model.studentimage!.length >= 4 ? (model.studentimage!.length) - 4 : model.studentimage!.length}"),
                  //               ),
                  //             ),
                  //           )
                  //         : const SizedBox()
                  //   ],
                  // ),
                  // Gap(25.h),
                  Text(
                    "Description",
                    style: AppTextTheme.fs18Medium
                        .copyWith(color: AppColor.raisinBlack),
                  ),
                  Gap(10.h),
                  Text(
                    model.description!,
                    style: AppTextTheme.fs16Medium
                        .copyWith(color: AppColor.frenchGray),
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 20.sp, left: 20.0.sp, right: 20.0.sp),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                height: 60.sp,
                width: 60.sp,
                padding: EdgeInsets.all(10.sp),
                decoration: const BoxDecoration(
                    color: AppColor.raisinBlack, shape: BoxShape.circle),
                child: Icon(
                  Icons.card_travel,
                  color: AppColor.white,
                  size: 24.sp,
                ),
              ),
            ),
            Gap(20.w),
            Expanded(
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: 60.h,
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  decoration: BoxDecoration(
                      color: AppColor.raisinBlack,
                      borderRadius: BorderRadius.circular(40.r)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Start Learning",
                        style: AppTextTheme.fs18Medium
                            .copyWith(color: AppColor.white),
                      ),
                      Container(
                        padding: EdgeInsets.all(5.sp),
                        decoration: const BoxDecoration(
                            color: AppColor.raisinBlack50,
                            shape: BoxShape.circle),
                        child: Icon(
                          Icons.keyboard_arrow_right_rounded,
                          color: AppColor.white,
                          size: 24.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
