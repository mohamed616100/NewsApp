/*
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../manager/Canhnge_cursual_cubit/cubit.dart';
import '../../manager/Canhnge_cursual_cubit/states.dart';

class ListGnerat extends StatelessWidget {
  const ListGnerat({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var currentIndex = HomeCubit.get(context).currentIndex;
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            5, (index) =>
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  width: 9.w,
                  height: 9.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentIndex == index
                        ? AppColors.Brandblue
                        : AppColors.Grey1,
                  ),
                ),
          ),
        );
      },
    );
  }
}
*/
