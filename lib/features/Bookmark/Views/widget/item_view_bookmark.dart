import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_images.dart';
class ItemViewBookmark extends StatelessWidget {
  final Map<String, dynamic> article;
  const ItemViewBookmark({super.key, required this.article});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article['title'] ?? 'No Title',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  article['author'] ?? 'Uncategorized',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),

          Container(
            width: 112.w,
            height: 80.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: article['urlToImage'] != null
                    ? NetworkImage(article['urlToImage'])
                    : AssetImage(AppImages.homimage)
                as ImageProvider,
              ),
            ),
          )
        ],
      ),
    );
  }
}
