import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shimmer/shimmer.dart';

import '../../manager/Canhnge_cursual_cubit/cubit.dart';
import '../../manager/Canhnge_cursual_cubit/states.dart';
import '../../../explaor/manager/cubit.dart';
import '../../../explaor/manager/states.dart';
import 'artical_home_item.dart';

class Coursalsliderwidget extends StatelessWidget {
  const Coursalsliderwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsEverythingcubit, newsstate>(
      builder: (context, state) {
        if (state is loadingstate) {
          return SizedBox(
            height: 274.h,
            child: CarouselSlider.builder(
              itemCount: 3, // عدد placeholders
              itemBuilder: (context, index, realIndex) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 8.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                height: 274.h,
                autoPlay: false,
                viewportFraction: 1.0,
                enlargeCenterPage: false,
              ),
            ),
          );
        } else if (state is successstate) {
          var articles = state.model.articles;

          return BlocBuilder<HomeCubit, HomeState>(
            builder: (context, _) {
              var cubit = HomeCubit.get(context);
              return CarouselSlider.builder(
                carouselController: cubit.controller,
                itemCount: articles!.length,
                itemBuilder: (context, index, realIndex) {
                  final article = articles[index];
                  return ArticalHomeItem(model: article);
                },
                options: CarouselOptions(
                  height: 274.h,
                  autoPlay: true,
                  viewportFraction: 1.0,
                  enlargeCenterPage: false,
                  onPageChanged: cubit.onPageChanged,
                ),
              );
            },
          );
        } else if (state is errorstate) {
          return SizedBox(
            height: 274.h,
            child: Center(child: Text(state.erorrmasge)),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
