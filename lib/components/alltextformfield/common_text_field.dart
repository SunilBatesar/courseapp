import 'package:courses_app/components/style_seet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonTextField extends StatelessWidget {
  final String text;
  final IconData? suffixicon, prefixicon;
  final TextEditingController? controller;
  final Function(String)? validator, fieldSubmitted;
  final FocusNode? focusnode;
  final int? maxlines;
  const CommonTextField(
      {super.key,
      required this.text,
      this.suffixicon,
      this.prefixicon,
      this.controller,
      this.validator,
      this.fieldSubmitted,
      this.focusnode,
      this.maxlines});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator == null ? null : (v) => validator!(v!),
      onFieldSubmitted:
          fieldSubmitted != null ? (value) => fieldSubmitted!(value) : null,
      controller: controller,
      focusNode: focusnode,
      maxLines: maxlines ?? 1,
      decoration: InputDecoration(
          prefixIcon: prefixicon == null
              ? null
              : Icon(
                  prefixicon,
                  color: AppColor.frenchGray,
                ),
          suffixIcon: suffixicon == null
              ? null
              : Icon(
                  suffixicon,
                  color: AppColor.frenchGray,
                ),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.frenchGray)),
          border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColor.frenchGray,
              ),
              borderRadius: BorderRadius.circular(10.sp)),
          hintText: text,
          hintStyle:
              AppTextTheme.fs16Normal.copyWith(color: AppColor.raisinBlack50)),
    );
  }
}
