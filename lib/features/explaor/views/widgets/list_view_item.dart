import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/features/explaor/manager/cubit.dart';
import 'package:newsapp/features/explaor/manager/states.dart';
import 'package:newsapp/features/explaor/views/widgets/item_vew.dart';
import 'package:shimmer/shimmer.dart';

import '../../data/models/ArticalsModel_EveryThing.dart';
class ListViewItem extends StatelessWidget {
  final List<ArticlesEveryThing>? articles;

  const ListViewItem({super.key, this.articles});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsEverythingcubit, newsstate>(
      builder: (context, state) {
        if (state is loadingstate) {

          return SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) => buildShimmerItem(),
              childCount: 6,
            ),
          );
        } else if (state is errorstate) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(state.erorrmasge),
            ),
          );
        } else if (state is successstate) {
          final articlesList = state.model.articles ?? [];
          if (articlesList.isEmpty) {
            return SliverToBoxAdapter(
              child: Center(child: Text('No Data')),
            );
          }

          return SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) => ItemVew(model: articlesList[index]),
              childCount: articlesList.length,
            ),
          );
        }
        return SliverToBoxAdapter(
          child: Container(
            color: Colors.red,
            width: double.infinity,
            height: 100,
          ),
        );
      },
    );
  }
}

Widget buildShimmerItem() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
    child: Row(
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            width: 100,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 12,
                  width: double.infinity,
                  color: Colors.grey[300],
                ),
              ),
              SizedBox(height: 6),
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 12,
                  width: MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width * 0.5,
                  color: Colors.grey[300],
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
