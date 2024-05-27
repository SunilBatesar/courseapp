import 'package:courses_app/components/style_seet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  final String title;
  final double? borderRadius;
  final Color? backGroundColor;
  final Function onPressed;
  final FocusNode? focusnode;
  final Function? onFocusChange;
  final bool isExpanded;
  final bool isloading;
  final TextStyle? titleStyle;
  const AppButton(
      {super.key,
      required this.title,
      required this.onPressed,
      this.focusnode,
      this.onFocusChange,
      this.borderRadius,
      this.backGroundColor,
      this.isExpanded = false,
      this.isloading = false,
      this.titleStyle});

  @override
  Widget build(BuildContext context) {
    final button = TextButton(
        onPressed: () {
          isloading ? null : onPressed();
        },
        focusNode: focusnode,
        onFocusChange: onFocusChange != null ? (v) => onFocusChange!(v) : null,
        style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
            backgroundColor: backGroundColor != null
                ? backGroundColor!
                : AppColor.raisinBlack,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    borderRadius != null ? borderRadius!.r : 8.r))),
        child: isloading
            ? SizedBox(
                height: 20.sp,
                width: 20.sp,
                child: const CircularProgressIndicator(
                  color: AppColor.white,
                ),
              )
            : Text(
                title,
                style: titleStyle != null
                    ? titleStyle!
                    : AppTextTheme.fs16Medium.copyWith(color: AppColor.white),
              ));
    if (isExpanded) {
      return Expanded(child: button);
    } else {
      return button;
    }
  }
}
