import 'package:courses_app/components/style_seet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class SearchTextField extends StatelessWidget {
  String text;
  IconData? icon;
  TextEditingController? controller;

  Function(String)? validator, onchanged;
  SearchTextField({
    super.key,
    required this.text,
    this.icon,
    this.controller,
    this.validator,
    this.onchanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator == null ? null : (v) => validator!(v!),
      onChanged: onchanged == null ? null : (v) => onchanged!(v),
      controller: controller,
      decoration: InputDecoration(
          isDense: true,
          filled: true,
          fillColor: AppColor.white,
          // ignore: unnecessary_null_comparison
          suffixIcon: Icon == null
              ? const SizedBox()
              : Icon(
                  icon,
                  color: AppColor.antiFlashWhite,
                ),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(30.r)),
          hintText: text,
          hintStyle:
              AppTextTheme.fs14Medium.copyWith(color: AppColor.raisinBlack)),
    );
  }
}
