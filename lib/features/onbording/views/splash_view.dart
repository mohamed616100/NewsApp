import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newsapp/core/helper/my_navgitor.dart';
import 'package:newsapp/core/utils/app_icons.dart';
import 'package:newsapp/core/utils/app_text_style.dart';
import '../../../core/utils/app_colors.dart';
import 'Welcome_view.dart';
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    goNextpage();
    super.initState();
  }
  goNextpage(){
    Future.delayed(Duration(seconds: 2),() {
      if (mounted) {
        MyNavigator.goTo(context, WelcomeView(),
          type: NavigatorType.pushAndRemoveUntil,);
      }
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.AppBar,
      body : Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Khab",style:AppTextStyles.splashstyle),
            SvgPicture.asset(AppIcons.splashIcon,width: 30.w,height:32.5.h,),
            Text('r',style:AppTextStyles.splashstyle)
          ],
        ),
      )
    );
  }
}
