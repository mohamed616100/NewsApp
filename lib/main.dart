import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/core/utils/app_colors.dart';
import 'package:newsapp/features/explaor/manager/cubit.dart';

import 'core/network/dio_factory.dart';
import 'features/onbording/views/splash_view.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DioFactory.initialize();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
     return ScreenUtilInit(
        designSize: const Size(430, 932),
    builder:  (context , child)=> MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor:AppColors.background,
      ),
      home: SplashView(),
    ),
    );
  }
}
