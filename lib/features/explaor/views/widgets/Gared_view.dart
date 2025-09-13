import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/core/utils/app_images.dart';
import 'package:newsapp/core/widgets/titel_of_artical.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/widgets/DateHelper.dart';
import '../../data/models/ArticalsModel_EveryThing.dart';
class GaredView extends StatelessWidget {
  final ArticlesEveryThing? firstArticle;
  const GaredView({super.key, this.firstArticle});
  @override
  Widget build(BuildContext context) {
    if (firstArticle == null) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            height: 390.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: Colors.grey[300],
            ),
            child: Column(
              children: [
                Container(
                  height: 300.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: Colors.grey[300],
                  ),
                ),
                SizedBox(height: 16.h),
                Container(
                  height: 40.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: Colors.grey[300],
                  ),
                ),
                SizedBox(height: 8.h),
                Container(
                  height: 20.h,
                  width: 150.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: Colors.grey[300],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      child: Container(
        height: 500.h,
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: Container(
                height:300.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: firstArticle!.urlToImage != null
                        ? NetworkImage(firstArticle!.urlToImage!)
                        : AssetImage(AppImages.homimage),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            TitelOfArtical(
              title: firstArticle!.title ?? "No Title",
              image: firstArticle!.author != null
                  ? NetworkImage(firstArticle!.urlToImage!)
                  : AssetImage(AppImages.person),
              date: DateHelper.formatDate(firstArticle!.publishedAt),
              author: firstArticle!.author ?? "Unknown",
            ),
          ],
        ),
      ),
    );
  }
}
