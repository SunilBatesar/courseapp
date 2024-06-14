import 'package:courses_app/components/style_seet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomAppbar extends AppBar {
  final BuildContext context;
  CustomAppbar({
    super.key,
    super.title,
    required this.context,
    super.automaticallyImplyLeading,
  });

  @override
  Widget? get leading => automaticallyImplyLeading
      ? IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios))
      : null;

  @override
  Color? get backgroundColor => Colors.transparent;
  @override
  double? get elevation => 0;
  @override
  TextStyle? get titleTextStyle =>
      AppTextTheme.fs18Medium.copyWith(color: AppColor.raisinBlack);
  @override
  bool? get centerTitle => true;
  @override
  IconThemeData? get iconTheme =>
      IconThemeData(color: AppColor.raisinBlack, size: 24.sp);
  @override
  Color? get foregroundColor => AppColor.raisinBlack;
}
