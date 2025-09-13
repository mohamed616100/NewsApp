import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_icons.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../manager/cubit.dart';
import '../../manager/state.dart';

class DataAndDgree extends StatelessWidget {
  const DataAndDgree({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoading || state is WeatherInitial) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is WeatherError) {
          return Text(state.message);
        } else if (state is WeatherLoaded) {
          final weather = state.weather;
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${weather.name} - ${weather.sys?.country ?? ''}",
                  style: AppTextStyles.Heading,
                ),
                SizedBox(height: 24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${weather.main?.temp?.toStringAsFixed(0)}°",
                      style: AppTextStyles.Heading.copyWith(
                        fontSize: 48.sp,
                      ),
                    ),
                    IconButton(
                      onPressed: null,
                      icon: Image.network(
                        "http://openweathermap.org/img/wn/${weather.weather![0].icon}@2x.png",
                        width: 60.w,
                        height: 60.h,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 19.h),
                Text(
                  "${weather.weather?.first.main} - ${weather.weather?.first.description}",
                  style: AppTextStyles.Heading,
                ),
                SizedBox(height: 12.h),
                Text(
                  "Feels like ${weather.main?.feelsLike?.toStringAsFixed(0)}°",
                  style: AppTextStyles.heading2,
                ),
              ],
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
