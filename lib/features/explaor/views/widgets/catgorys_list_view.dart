import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CatgorysListView extends StatefulWidget {
  final Function(String)? onCategorySelected;

  const CatgorysListView({super.key, this.onCategorySelected});

  @override
  State<CatgorysListView> createState() => _CatgorysListViewState();
}

class _CatgorysListViewState extends State<CatgorysListView> {
  int selectedIndex = -1;

  final List<String> categories = [
    'business',
    'entertainment',
    'general',
    'health',
    'science',
    'sports',
    'technology',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32.h,
      child: ListView.builder(
        itemCount: categories.length,
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setState(() => selectedIndex = index);
              if (widget.onCategorySelected != null) {
                widget.onCategorySelected!(categories[index]);
              }
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              margin: EdgeInsets.only(right: 12.w),
              alignment: Alignment.center,
              height: 32.h,
              decoration: BoxDecoration(
                color: selectedIndex == index ? Color(0XffE9EEFA) : Colors.white,
                borderRadius: BorderRadius.circular(56.r),
                border: Border.all(
                  color: Color(0xffE9EEFA),
                  width: 1.w,
                ),
              ),
              child: Text(
                categories[index],
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
