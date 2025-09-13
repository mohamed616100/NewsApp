import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../explaor/views/widgets/list_view_item.dart';
import '../../../home/manager/top_hedline_cubit/cubit.dart';
import '../../../home/manager/top_hedline_cubit/states.dart';
import 'item_search.dart';
class ListViewSearch extends StatelessWidget {
  const ListViewSearch({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopHeadlineCubit,TopheadlineStates>
      (builder:(context,state){
        if (state is LoadingStateTopHeadline){
          return SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) => buildShimmerItem(),
              childCount: 6,
            ),
          );
        }else if(state is ErrorStateTopHeadline){
          return SliverToBoxAdapter(
            child: Center(
              child: Text(state.message),
            ),
          );
        }else if (state is SuccessStateTopHeadline){
          final articlesList = state.news.articles ?? [];
          if (articlesList.isEmpty) {
            return SliverToBoxAdapter(
              child: Center(child: Text('No Data')),
            );
          }
          return SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) => ItemSearch(model: articlesList[index]),
              childCount: articlesList.length,
            ),
          );
        }
        return SliverToBoxAdapter(
          child: Container(
            color: Colors.white,
            width: double.infinity,
            height: 100,
          ),
        );

    } );
  }
}
