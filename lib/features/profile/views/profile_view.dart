import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:newsapp/core/helper/my_navgitor.dart';
import 'package:newsapp/core/utils/app_icons.dart';
import 'package:newsapp/core/widgets/Buttonlarge.dart';
import 'package:newsapp/features/onbording/views/Map_view.dart';
import 'package:newsapp/features/profile/views/widgets/data_and_dgree.dart';
import 'package:newsapp/features/profile/views/widgets/ditiels_wather.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_font_weight.dart';
import '../../../core/widgets/custom_app_bar.dart';

import '../manager/cubit.dart';
import '../manager/state.dart';
class ProfileView extends StatelessWidget {
  const ProfileView({super.key, this.username, this.selectedLocation});
  final String? username;
  final  LatLng? selectedLocation;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if(state is WeatherLoading){
            return Center(child: CircularProgressIndicator(),);
          }else if(state is WeatherError){
            return Text(state.message);
          }else if(state is WeatherLoaded){
            String getWeatherIcon(String iconCode) {
              return 'http://openweathermap.org/img/wn/$iconCode@2x.png';
            }
            return Column(
              children: [
                CustomAppBar(wlcome: 'Good Morning,',
                  name: username??"Gust",
                  textStyle: GoogleFonts.radley(
                    color: AppColors.Textsecondary,
                    fontSize: 14.sp,
                    fontWeight: AppFontWeight.regular,
                  ),
                  date:DateFormat('E d MMMM, y').format(
                    DateTime.fromMillisecondsSinceEpoch(
                      (state.weather.dt! + state.weather.timezone!) * 1000,
                      isUtc: true,
                    ),
                  ),
                  dgree: state.weather.main!.temp.toString(),
                  image: Image.network(getWeatherIcon(state.weather.weather![0].icon!)),
                ),
                SizedBox(height: 29.h),
                DataAndDgree(),
                SizedBox(height: 45.h),
                DitielsWather(),
                Spacer(),
                Buttonlarge(text: 'Change Location', onPressed: (){
                  MyNavigator.goTo(context,MapView(),type: NavigatorType.push);
                }, width: 244.w, height: 56.h,icon: AppIcons.Location,spacebetween: 8.w,),
                SizedBox(height: 107.h),



              ],
            );
          }else{
            return Container();
          }
        },
    );
  }
}