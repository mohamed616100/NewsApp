import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/core/utils/app_text_style.dart';
import '../../../core/helper/my_navgitor.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_icons.dart';
import '../../../core/utils/app_images.dart';
import '../../../core/widgets/Buttonlarge.dart';
import 'Map_view.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xff2249D4),
                  Color(0xFFE9EEFA),
                ], // dark to light blue
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              AppImages.backgroundWelcompage,
              fit: BoxFit.fill,
              height: 540.h,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.only(
                top: 52.h,
                left: 32.w,
                right: 32.w,
                bottom: 52.h,
              ),
              height: 421.h,
              decoration: const BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
             child:Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10.h),
                  Text(
                    "Get The Latest News\nAnd Updates",
                    textAlign: TextAlign.center,
                   style: AppTextStyles.Heading,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    "From Politics to Entertainment: Your One-Stop Source "
                        "for Comprehensive Coverage of the Latest News and "
                        "Developments Across the Glob will be right on your hand.",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.heading2
                  ),
                  SizedBox(height: 24.h),
                  Buttonlarge(
                    text: "Explore",
                    onPressed: () {
                      MyNavigator.goTo(context, MapView(),type: NavigatorType.push);
                    },
                    icon: AppIcons.arrowRight,
                    width: 145.w,
                    height: 56.h,
                    spacebetween: 8.w,
                  )

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
