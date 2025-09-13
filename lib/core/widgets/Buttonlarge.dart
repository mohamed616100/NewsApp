import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_style.dart';
class Buttonlarge extends StatelessWidget {
  const Buttonlarge({super.key,
    required this.text,
     this.icon,
    required this.onPressed,
    required this.width,
    required this.height,  this.spacebetween,
  });
  final double? spacebetween;
  final String text;
  final String? icon;
  final VoidCallback onPressed;
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed ,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: AppColors.Brandblue,
          borderRadius: BorderRadius.circular(128.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text,style: AppTextStyles.Buttonlarge),
           if(icon!=null)...[
             SizedBox(width: spacebetween),
             SvgPicture.asset(icon!),
           ]
          ],
        ),
      ),
    );
  }
}
