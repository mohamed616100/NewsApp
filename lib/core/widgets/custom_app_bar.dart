import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_colors.dart';
import '../utils/app_font_weight.dart';
import '../utils/app_text_style.dart';
class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key,
    required this.wlcome,
    required this.name,
    required this.date,
    required this.dgree,
    this.icon,
    required this.textStyle, this.ontap, required this.image
  });
  final TextStyle textStyle;
  final VoidCallback? ontap;
  final String wlcome;
  final String name;
  final String date;
  final String dgree;
  final String? icon;
  final Image image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 142.h,
      color: AppColors.AppBar,
      child: Padding(
        padding:EdgeInsets.symmetric(horizontal: 32.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60.h),
            Text(wlcome,style: GoogleFonts.radley(
              color: AppColors.Textsecondary,
              fontSize: 14.sp,
              fontWeight: AppFontWeight.regular,
            ),),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(name,style:textStyle),
                  if(image!=null)...[
                  Spacer(),
                  InkWell(
                    onTap: ontap,
                      child:  image),
                  SizedBox(width: 8.w),
                  Text(dgree,style: GoogleFonts.radley(
                    color: AppColors.Textsecondary,
                    fontSize: 14.sp,
                    fontWeight: AppFontWeight.regular,
                  ),),]
                ],
              ),
            ),
            Text(date,style: AppTextStyles.heading5,),
          ],
        ),
      ),
    );
  }
}
