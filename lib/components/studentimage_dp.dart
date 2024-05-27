import 'package:courses_app/components/style_seet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StudentImageDp extends StatelessWidget {
  final String imagepath;
  const StudentImageDp({
    super.key,
    required this.imagepath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.sp),
      height: 50.sp,
      width: 50.sp,
      decoration:
          const BoxDecoration(color: AppColor.white, shape: BoxShape.circle),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(1000),
        child: Image.asset(
          imagepath,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
