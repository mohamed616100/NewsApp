import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/core/utils/app_colors.dart';
import 'package:newsapp/features/Bookmark/Views/widget/item_listview_bookmark.dart';
import 'package:newsapp/features/Bookmark/Views/widget/item_view_bookmark.dart';
class BookMarkView extends StatelessWidget {
  const BookMarkView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 142.h,
          decoration: BoxDecoration(
            color: AppColors.AppBar,
          ),child: Padding(
            padding:EdgeInsets.only(bottom: 10.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                'Bookmark',style: TextStyle(
                color: Colors.black,
                fontSize: 32.sp,
                fontWeight: FontWeight.w600,

                        ),
                        ),
              ],
            ),
          ),

        ),
        ItemListviewBookmark()
      ],
    );
  }
}
