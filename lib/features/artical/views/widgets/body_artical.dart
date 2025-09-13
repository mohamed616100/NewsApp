import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/core/widgets/titel_of_artical.dart';

import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/widgets/DateHelper.dart';
import '../../../home/data/models/models_top_headline/Artical_Top_Headline.dart';
class BodyArtical extends StatelessWidget {
  const BodyArtical({super.key, required this.model});
  final ArticlesTopheadline model;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 32.w),
        child: Column(
          children: [
            TitelOfArtical(
              title: model.title ?? 'No Title',
              image:  (model.urlToImage != null && model.urlToImage!.isNotEmpty)
                  ? NetworkImage(model.urlToImage!)
                  : const AssetImage(AppImages.homimage) as ImageProvider,
              date: DateHelper.formatDate(model.publishedAt),
              author: model.author ?? 'No Author',
            ),


            SizedBox(height: 24.h),
            Text(
              (model.content != null && model.content!.isNotEmpty)
                  ? model.content!
                  : "No Content Available",
              style: AppTextStyles.heading5,
            ),

            SizedBox(height: 24.h),

          ],
        ),
      ),
    );
  }
}
