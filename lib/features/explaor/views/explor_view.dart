import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/core/helper/my_navgitor.dart';
import 'package:newsapp/core/network/api_service.dart';
import 'package:newsapp/core/network/dio_factory.dart';
import 'package:newsapp/core/utils/app_images.dart';
import 'package:newsapp/features/explaor/manager/cubit.dart';
import 'package:newsapp/features/explaor/views/widgets/catgorys_list_view.dart';
import 'package:newsapp/features/explaor/views/widgets/Gared_view.dart';
import 'package:newsapp/features/explaor/views/widgets/list_view_item.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../Search/views/Search_view.dart';
import '../data/models/ArticalsModel_EveryThing.dart';
import '../data/repo/NewsRepoEverythingImplemnt.dart';
import '../manager/states.dart';
class ExplorView extends StatelessWidget {
  const ExplorView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsEverythingcubit(
          Newsrepoeverythingimplemnt(ApiService(DioFactory.newsApiDio))
      )..getNewsEveryTing(
        query: 'general',
        language: 'en',
        sortBy: 'popularity',
      ),
      child: BlocBuilder<NewsEverythingcubit, newsstate>(
        builder: (context, state) {
          List<ArticlesEveryThing> newsList = [];
          if (state is successstate) newsList = state.model.articles!;
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: CustomAppBar(
                  date: '',
                  dgree: '',
                  name: 'Explore',
                  ontap: () {
                    MyNavigator.goTo(context, SearchView());
                  },
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  wlcome: '',
                  image: Image.asset(AppImages.search),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 16.h)),
              SliverToBoxAdapter(
                child: CatgorysListView(
                  onCategorySelected: (category) {
                    NewsEverythingcubit.get(context).getNewsEveryTing(
                        query:category,
                        language: 'en',
                        sortBy: 'popularity',
                    );
                  },
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 24.h)),
              SliverToBoxAdapter(
                child: GaredView(
                  firstArticle: newsList.isNotEmpty ? newsList[0] : null,
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 24.h)),
              ListViewItem(),
            ],
          );
        },
      ),
    );
  }
}
