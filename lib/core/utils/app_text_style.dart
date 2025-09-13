import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/core/utils/app_font_weight.dart';
import 'app_colors.dart';
abstract class AppTextStyles {
  static  TextStyle splashstyle = TextStyle(
    color: AppColors.Brandblue,
    fontSize: 48.sp,
    fontWeight: AppFontWeight.bold,
  );
  static TextStyle Heading=TextStyle(
    color: AppColors.Textprimary,
    fontSize: 32.sp,
    fontWeight: AppFontWeight.semiBold,
  );
  static TextStyle heading2=TextStyle(
    fontSize: 18.sp,
    fontWeight: AppFontWeight.regular,
    color: AppColors.Textsecondary,
  );
  static TextStyle Buttonlarge=TextStyle(
    fontSize: 20.sp,
    fontWeight: AppFontWeight.semiBold,
    color: AppColors.background,
  );
  static TextStyle heading5 =TextStyle(
    fontSize: 18.sp,
    fontWeight: AppFontWeight.semiBold,
    color: AppColors.black,
  );

}