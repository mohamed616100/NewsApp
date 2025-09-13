import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_font_weight.dart';
class ListCatgoryWidget extends StatefulWidget {
  final Function(String)? onCategorySelected;
  const ListCatgoryWidget({super.key, this.onCategorySelected});
  @override
  State<ListCatgoryWidget> createState() => _CatgorysListViewState();
}
class _CatgorysListViewState extends State<ListCatgoryWidget> {
   int selectedIndex=-1;
  final List<String> categories = [
    'business',
    'entertainment',
    'health',
    'science',
    'sports',
    'technology',
  ];
  final List<String> categoryCounts = [
    '68',
    '45',
    '69',
    '53',
    '49',
    '68',
  ];
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 32.h,
      child: ListView.builder(itemBuilder: (context,index){
        return InkWell(
          onTap: () {
            setState(() => selectedIndex = index);
            if (widget.onCategorySelected != null) {
              widget.onCategorySelected!(categories[index]);
            }
          },
          child: Container(
            margin: EdgeInsets.only(right: 12.w),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            alignment: Alignment.center,
            height: 32.h,

            decoration: BoxDecoration(
              color: selectedIndex==index?Color(0XffE9EEFA):Colors.white,
              borderRadius: BorderRadius.circular(56.r),
              border: Border.all(
                color: Color(0xffE9EEFA),
                width: 1.w,
              ),
            ),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(categories[index],style: TextStyle(
                  color: AppColors.Textsecondary,
                  fontSize: 14.sp,
                  fontWeight:AppFontWeight.bold,
                ),),
                SizedBox(width: 5.w),
                Text(categoryCounts[index],style: TextStyle(
                  color: AppColors.Textsecondary,
                  fontSize: 14.sp,
                  fontWeight:AppFontWeight.bold,
                ),)
              ],
            ),
          ),
        );
      },itemCount: categories.length,
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        scrollDirection: Axis.horizontal,),
    );
  }
}
