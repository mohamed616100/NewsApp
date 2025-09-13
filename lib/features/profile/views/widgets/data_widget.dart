import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_icons.dart';
class DataWidget extends StatelessWidget {
  const DataWidget({super.key,
    required this.dgree,
    required this.icon,
    required this.text
    });
final String dgree;
final String icon;
final String text;

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        SvgPicture.asset(icon,width: 43.w,height: 45.h),
        SizedBox(width: 16.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(dgree,style: TextStyle(
              fontSize: 16.sp,
              color: AppColors.Brandblue,
              fontWeight: FontWeight.w400,
            ),),
            Text(text,style: TextStyle(
              fontSize: 12.sp,
              color: Colors.grey,
              fontWeight: FontWeight.w400,
            ),),
          ],
        )
      ],
    );
  }
}
