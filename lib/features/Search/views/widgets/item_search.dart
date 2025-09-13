import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/widgets/DateHelper.dart';
import '../../../home/data/models/models_top_headline/Artical_Top_Headline.dart';
class ItemSearch extends StatelessWidget {
  const ItemSearch({super.key, required this.model});
  final ArticlesTopheadline model;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w,vertical: 16.h),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(model.title ?? 'No Title',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 12.r,
                        backgroundImage: model.urlToImage != null && model.urlToImage!.isNotEmpty
                            ? CachedNetworkImageProvider(model.urlToImage!)
                            : AssetImage(AppImages.person) as ImageProvider,
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: Text( model.author ?? 'No Author',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                          color: Colors.grey,
                        ),),
                      ),
                      Expanded(
                        child: Text(
                          DateHelper.formatDate(model.publishedAt ?? ''),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(width: 16.w),
            Container(
              height: 80.h,
              width: 120.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
              ),
              clipBehavior: Clip.hardEdge,
              child: CachedNetworkImage(
                imageUrl: model.urlToImage ?? '',
                fit: BoxFit.cover,
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) =>
                    Icon(Icons.error, size: 20),
              ),
            ),
          ],
        )
    );
  }
}
