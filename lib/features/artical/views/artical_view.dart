import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/features/artical/views/widgets/app_bar_artical.dart';
import 'package:newsapp/features/artical/views/widgets/body_artical.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_images.dart';
import '../../home/data/models/models_top_headline/Artical_Top_Headline.dart';

class ArticalView extends StatelessWidget {
  const ArticalView({super.key, required this.model});
  final ArticlesTopheadline model;

  @override
  Widget build(BuildContext context) {
    final String? imageUrl = model.urlToImage;
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: (imageUrl != null && imageUrl.isNotEmpty)
                ? Image.network(
              imageUrl,
              fit: BoxFit.cover,
              height: 316.h,
              width: double.infinity,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    height: 316.h,
                    width: double.infinity,
                    color: Colors.white,
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  AppImages.homimage,
                  fit: BoxFit.cover,
                  height: 316.h,
                  width: double.infinity,
                );
              },
            )
                : Image.asset(
              AppImages.homimage,
              fit: BoxFit.cover,
              height: 316.h,
              width: double.infinity,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 645.h,
              decoration: const BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: Column(
                children: [
                  AppBarArtical(model: model),
                  SizedBox(height: 6.h),
                  Expanded(
                    child: BodyArtical(model: model),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
