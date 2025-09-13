import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:newsapp/features/profile/data/repo/weather_repoimplemnt.dart';
import '../../features/Bookmark/Views/Book_mark_view.dart';
import '../../features/explaor/views/explor_view.dart';
import '../../features/home/views/home_view.dart';
import '../../features/profile/manager/cubit.dart';
import '../../features/profile/views/profile_view.dart';
import '../network/api_service.dart';
import '../network/dio_factory.dart';
import '../utils/app_colors.dart';
import '../utils/app_icons.dart';

class CustomBottomNav extends StatefulWidget {
  final LatLng? selectedLocation;
  final String? username;

  const CustomBottomNav({super.key, this.selectedLocation, this.username});

  @override
  State<CustomBottomNav> createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  int selectedIndex = 0;
  late PageController _pageController;
  late final List<Widget> pages;

  final List<String> icons = [
    AppIcons.home,
    AppIcons.globe,
    AppIcons.bookHeart,
    AppIcons.weatherIcon,
  ];

  final List<String> labels = [
    "Home",
    "Explore",
    "Bookmark",
    "Profile",
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: selectedIndex);
    pages = [
      HomeView(
        selectedLocation: widget.selectedLocation,
        username: widget.username,
      ),
      const ExplorView(),
      const BookMarkView(),
      ProfileView(
        username: widget.username,
        selectedLocation: widget.selectedLocation,
      ),
    ];
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
          create: (context) =>
          WeatherCubit(
              WeatherRepoImplem(ApiService(DioFactory.openWeatherDio))
          )
            ..fetchWeather(lat: widget.selectedLocation!.latitude,
              lon: widget.selectedLocation!.longitude,),
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          children: pages,
        ),
        bottomNavigationBar: Container(
          height: 80.h,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.r),
              topRight: Radius.circular(24.r),
            ),
            color: AppColors.bottomnavgtionbar,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(icons.length, (index) {
              final isSelected = selectedIndex == index;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                    _pageController.jumpToPage(index);
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOutBack,
                  padding: EdgeInsets.symmetric(
                      horizontal: 14.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.black : Colors.transparent,
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        icons[index],
                        width: 24.w,
                        height: 24.h,
                        color: isSelected ? Colors.white : AppColors.black,
                      ),
                      if (isSelected) ...[
                        SizedBox(width: 6.w),
                        Text(
                          labels[index],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ]
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
