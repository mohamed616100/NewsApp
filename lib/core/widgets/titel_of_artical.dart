import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_images.dart';
import '../utils/app_text_style.dart';

class TitelOfArtical extends StatelessWidget {
  const TitelOfArtical({
    super.key,
    required this.title,
    required this.date,
    required this.author,
    this.image,
  });

  final String? title;
  final String? date;
  final String? author;
  final ImageProvider? image;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title ?? 'No Title',
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.Heading,
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            CircleAvatar(
              radius: 12.r,
              backgroundImage: image ?? const AssetImage(AppImages.person),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      author ?? 'No Author',
                      style: const TextStyle(color: Colors.grey),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    date ?? 'No Date',
                    style: const TextStyle(color: Colors.grey),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
