import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:newsapp/core/utils/app_text_style.dart';
import 'package:newsapp/core/widgets/custom_app_bar.dart';
import 'package:newsapp/features/explaor/data/repo/NewsRepoEverythingImplemnt.dart';
import 'package:newsapp/features/explaor/manager/cubit.dart';
import 'package:newsapp/features/home/views/widgets/cursal_slider_widget.dart';
import 'package:newsapp/features/home/views/widgets/list_gnerat.dart';
import 'package:newsapp/features/home/views/widgets/list_view_most_populer.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/network/api_service.dart';
import '../../../core/network/dio_factory.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_font_weight.dart';
import '../../profile/manager/cubit.dart';
import '../../profile/manager/state.dart';
import '../data/repo/repo_top_headline/Top_headline_repoImplem.dart';
import '../manager/Canhnge_cursual_cubit/cubit.dart';
import '../manager/top_hedline_cubit/cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, this.username, this.selectedLocation});

  final String? username;
  final LatLng? selectedLocation;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
        BlocProvider(
          create: (context) => TopHeadlineCubit(TopHeadlineImplemRepo(
              ApiService(DioFactory.newsApiDio)
          ))..featchgetTopHeadlines(
              query: '',
              category: '',
              country: 'us'
          ),
        ),
        BlocProvider(
          create: (context) => NewsEverythingcubit(Newsrepoeverythingimplemnt(ApiService(
              DioFactory.newsApiDio
          )))..getNewsEveryTing(
              query:'a',
            sortBy: '',
            language: '',
            from: '',
            to: '',

          )


        ),
      ],
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<WeatherCubit, WeatherState>(
              builder: (context, state) {
                if (state is WeatherLoading || state is WeatherInitial) {
                  return Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 8.h),
                      width: double.infinity,
                      height: 80.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                  );
                } else if (state is WeatherError) {
                  return Text(state.message);
                } else if (state is WeatherLoaded) {
                  return CustomAppBar(
                    wlcome: 'Good Morning,',
                    name: username ?? "gust",
                    textStyle: GoogleFonts.radley(
                      color: AppColors.Textsecondary,
                      fontSize: 14.sp,
                      fontWeight: AppFontWeight.regular,
                    ),
                    date: DateFormat('E d MMMM, y').format(
                      DateTime.fromMillisecondsSinceEpoch(
                        (state.weather.dt! + state.weather.timezone!) * 1000,
                        isUtc: true,
                      ),),
                    dgree: state.weather.main!.temp.toString(),
                    image: Image.network(
                      'http://openweathermap.org/img/wn/${state.weather
                          .weather![0].icon}@2x.png',
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
            SizedBox(height: 18.h),
            Coursalsliderwidget(),
            SizedBox(height: 10.h),
            //ListGnerat(),
            SizedBox(height: 18.h),
            Padding(
              padding: EdgeInsets.only(left: 32.w, right: 22.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Most Popular', style: AppTextStyles.Heading.copyWith(
                    fontSize: 24.sp,
                  ),),
                  Text("See more", style: AppTextStyles.Heading.copyWith(
                      fontSize: 16.sp,
                      color: AppColors.Brandblue
                  ))
                ],
              ),
            ),
            SizedBox(height: 18.h),
            ListViewMostPopuler(),


          ],
        ),
      ),
    );
  }
}
