import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/features/home/manager/top_hedline_cubit/states.dart';
import 'package:newsapp/features/home/views/widgets/shimmer_list.dart';

import '../../manager/top_hedline_cubit/cubit.dart';
import 'most_populer_item.dart';

class ListViewMostPopuler extends StatelessWidget {
  const ListViewMostPopuler({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopHeadlineCubit, TopheadlineStates>(
      builder: (context, state) {
       if(state is LoadingStateTopHeadline||state is InitialStateTopHeadline){
         return ShimmerList();
       }else if(state is ErrorStateTopHeadline){
         return Center(
           child: Text(state.message),
         );
       }else if(state is SuccessStateTopHeadline){
         return SizedBox(
           height: 320.h,
           child: ListView.builder(itemBuilder: (context, index) {
             return MostPopulerItem(
               model:state.news.articles![index],
             );
           }, itemCount: state.news.articles!.length, scrollDirection: Axis.horizontal,),
         );
       }
       else{
         return Container();
       }
      },
    );
  }
}

