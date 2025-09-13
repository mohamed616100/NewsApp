import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/app_font_weight.dart';
import '../../../../core/utils/app_images.dart';
import '../../../explaor/data/models/ArticalsModel_EveryThing.dart';
class ArticalHomeItem extends StatelessWidget {
  const ArticalHomeItem({super.key, required this.model});
  final ArticlesEveryThing model;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(left: 32.w,right: 22.w),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: GestureDetector(
          onTap: (){},
          child: Container(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 66.h,
              color: Colors.black54,
              child: Padding(
                padding:EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(model.title??'No titel',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis
                        ,style:
                        TextStyle(
                          fontWeight: AppFontWeight.medium
                          ,fontSize: 14.sp,
                          color: Colors.white,
                          height: 2,
                        ),),
                    ),
                    Text(model.author??'No auther',style:
                    GoogleFonts.abhayaLibre(fontWeight:AppFontWeight.medium,
                        fontSize: 14.sp,
                        color: Colors.white),),
                  ],
                ),
              ),
            ),
            width: double.infinity,
            height: 274.h,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(model.urlToImage??'https://placehold.net/400x400.png'),fit: BoxFit.cover),
            ),
          ),
        ),
      ),
    );
  }
}
