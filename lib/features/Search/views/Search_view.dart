import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newsapp/core/helper/my_navgitor.dart';
import 'package:newsapp/core/network/api_service.dart';
import 'package:newsapp/core/network/dio_factory.dart';
import 'package:newsapp/features/Search/views/widgets/Textformfaild_search.dart';
import 'package:newsapp/features/Search/views/widgets/list_catgory_widget.dart';
import 'package:newsapp/features/Search/views/widgets/list_view_search.dart';
import 'package:newsapp/features/home/data/repo/repo_top_headline/Top_headline_repoImplem.dart';
import 'package:newsapp/features/home/manager/top_hedline_cubit/cubit.dart';
import 'package:newsapp/features/home/manager/top_hedline_cubit/states.dart';

import '../../../core/utils/app_icons.dart';
import '../../home/data/models/models_top_headline/Artical_Top_Headline.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
        TopHeadlineCubit(TopHeadlineImplemRepo(
            ApiService(DioFactory.newsApiDio)
        ))
          ..featchgetTopHeadlines(
              query: '',
              category: '',
              country: 'us'
          ),
        child: BlocBuilder<TopHeadlineCubit, TopheadlineStates>(
          builder: (context, state) {
            List<ArticlesTopheadline> newsList = [];
            if (state is SuccessStateTopHeadline) newsList = state.news.articles!;
            return SafeArea(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(child: SizedBox(height: 20.h)),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32.w),
                      child: Row(
                        children: [
                          IconButton(onPressed: () {
                            MyNavigator.goBack(context);
                          }, icon: SvgPicture.asset(AppIcons.arrowLeft,)),
                          SizedBox(width: 82.w),
                          Text('Search results',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                            ),),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(child: SimpleSearchBar()),
                  SliverToBoxAdapter(child: SizedBox(height: 16.h)),
                  SliverToBoxAdapter(child: ListCatgoryWidget(
                    onCategorySelected: (category){
                      TopHeadlineCubit.get(context).featchgetTopHeadlines(
                        category: category,
                        query: '',
                        country: 'us',
                      );
                    },
                  )),
                  SliverToBoxAdapter(child: SizedBox(height: 24.h)),
                  ListViewSearch(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
