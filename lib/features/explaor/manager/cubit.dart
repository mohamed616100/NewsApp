import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/features/explaor/data/repo/NewsRepoEverything.dart';
import 'package:newsapp/features/explaor/manager/states.dart';

class NewsEverythingcubit extends Cubit<newsstate>{
  NewsEverythingcubit(this.newsrepoeverything):super(initialstate());
  static NewsEverythingcubit get(context)=>BlocProvider.of(context);
  final NewsRepoEverything newsrepoeverything;
  getNewsEveryTing({
    required String query,
    int? pageSize,
    int? page,
    String? language,
    String? from,
    String? to,
    String? sortBy,
})async {
    emit(loadingstate());
    final result= await newsrepoeverything.geteverything(
        query: query,
        pageSize: pageSize,
        page: page,
        language: language,
        from: from,
        to: to,
        sortBy: sortBy
    );
    result.fold(
        ifLeft: (failure) => emit(errorstate(erorrmasge: failure.message)),
        ifRight: (news) => emit(successstate(model: news)),
    );
  }

}
