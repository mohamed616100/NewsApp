import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/core/helper/my_navgitor.dart';
import 'package:newsapp/features/artical/views/artical_view.dart';

import '../../../../core/utils/app_text_style.dart';
import '../../data/models/models_top_headline/Artical_Top_Headline.dart';
class MostPopulerItem extends StatelessWidget {
  const MostPopulerItem({super.key, required this.model});
  final ArticlesTopheadline model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 32.w,right: 22.w),
      child: InkWell(
        onTap: (){
          MyNavigator.goTo(context, ArticalView(model: model),type: NavigatorType.push);
        },
        child: SizedBox(
          width: 240.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 232.h,
                width: 240.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                clipBehavior: Clip.hardEdge,
                child: (model.urlToImage != null && model.urlToImage!.isNotEmpty)
                    ? CachedNetworkImage(
                  imageUrl: model.urlToImage!,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: Colors.grey[300],
                    child: Icon(Icons.image_not_supported, size: 50),
                  ),
                )
                    : Container(
                  color: Colors.grey[300],
                  child: Icon(Icons.image_not_supported, size: 50),
                ),
              ),
              SizedBox(height: 5.h),
              Text(model.title??'No Title',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.Heading.copyWith(
                  fontSize: 20.sp,
                ),),
              SizedBox(height: 5.h),
              Text(model.source!.name??'No Source',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.heading2.copyWith(
                  fontSize: 14.sp,
                ),),
            ],
          ),
        ),
      ),
    );
  }
}
