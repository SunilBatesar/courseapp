import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColor {
  static const Color raisinBlack = Color(0xff24272f);
  static const Color raisinBlack50 = Color(0xff3F4148);
  static const Color antiFlashWhite = Color(0xffefeced);
  static const Color carnationPink = Color(0xfff0a3c7);
  static const Color oringe = Color(0xffff5500);
  static const Color yellow = Color(0xffffdc00);
  static const Color lightGreen = Color(0xff95eb8e);
  static const Color white = Color(0xffffffff);
  static const Color seasalt = Color(0xfff7f8f8);
  static const Color frenchGray = Color(0xffcccfda);
  static const Color frenchGray50 = Color.fromARGB(90, 204, 207, 218);
}

class AppTextTheme {
  //-------- Normal ------
  static TextStyle fs12Normal =
      GoogleFonts.poppins(fontSize: 12.sp, fontWeight: FontWeight.w400);
  static TextStyle fs13Normal =
      GoogleFonts.poppins(fontSize: 13.sp, fontWeight: FontWeight.w400);
  static TextStyle fs14Normal =
      GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w400);
  static TextStyle fs15Normal =
      GoogleFonts.poppins(fontSize: 15.sp, fontWeight: FontWeight.w400);
  static TextStyle fs16Normal =
      GoogleFonts.poppins(fontSize: 16.sp, fontWeight: FontWeight.w400);

  //-------- Medium ------
  static TextStyle fs14Medium =
      GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w500);
  static TextStyle fs16Medium =
      GoogleFonts.poppins(fontSize: 16.sp, fontWeight: FontWeight.w500);
  static TextStyle fs18Medium =
      GoogleFonts.poppins(fontSize: 18.sp, fontWeight: FontWeight.w500);
  static TextStyle fs20Medium =
      GoogleFonts.poppins(fontSize: 20.sp, fontWeight: FontWeight.w500);
  static TextStyle fs35Medium =
      GoogleFonts.poppins(fontSize: 35.sp, fontWeight: FontWeight.w500);

  //-------- Semi Bold ------
  static TextStyle fs20SemiBold =
      GoogleFonts.poppins(fontSize: 20.sp, fontWeight: FontWeight.w600);
  static TextStyle fs25SemiBold =
      GoogleFonts.poppins(fontSize: 25.sp, fontWeight: FontWeight.w600);
  static TextStyle fs30SemiBold =
      GoogleFonts.poppins(fontSize: 30.sp, fontWeight: FontWeight.w600);

  //-------- Bold ------
  static TextStyle fs25Bold =
      GoogleFonts.poppins(fontSize: 25.sp, fontWeight: FontWeight.w700);
}
