import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/features/home/manager/top_hedline_cubit/states.dart';

import '../../data/repo/repo_top_headline/To_headline_repo.dart';

class TopHeadlineCubit extends Cubit<TopheadlineStates> {
  TopHeadlineCubit(this.topHeadlineRepo) : super(InitialStateTopHeadline());
  static TopHeadlineCubit get(context) => BlocProvider.of(context);
   final TopHeadlineRepo topHeadlineRepo;
    Future<void>featchgetTopHeadlines({
          required String query,
          required String category,
           int? pageSize,
           int? page,
          required String country,
    })
    async{
      emit(LoadingStateTopHeadline());
      final result= await topHeadlineRepo.getTopHeadlines(
          query: query,
          category: category,
          pageSize: pageSize,
          page: page,
          country: country
      );
      result.fold(
          ifLeft: (failure) => emit(ErrorStateTopHeadline(failure.message)),
          ifRight: (news) => emit(SuccessStateTopHeadline(news)),
      );

    }
}