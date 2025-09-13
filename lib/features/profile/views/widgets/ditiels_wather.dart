import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_icons.dart';
import '../../manager/cubit.dart';
import '../../manager/state.dart';
import 'data_widget.dart';

class DitielsWather extends StatelessWidget {
  const DitielsWather({super.key});

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
            padding: EdgeInsets.symmetric(horizontal: 34.w),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DataWidget(
                      dgree: "${weather.main?.temp?.toStringAsFixed(0)}°C",
                      icon: AppIcons.temperature,
                      text: 'Temperature',
                    ),
                    DataWidget(
                      dgree: "${weather.wind?.speed?.toStringAsFixed(1)} m/s",
                      icon: AppIcons.windicon,
                      text: 'Wind',
                    ),
                  ],
                ),
                SizedBox(height: 45.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DataWidget(
                      dgree: "—",
                      icon: AppIcons.UVicon,
                      text: 'UV Index',
                    ),
                    DataWidget(
                      dgree: "${weather.main?.humidity?.toString()}%",
                      icon: AppIcons.humidity,
                      text: 'Humidity',
                    ),
                  ],
                )
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
