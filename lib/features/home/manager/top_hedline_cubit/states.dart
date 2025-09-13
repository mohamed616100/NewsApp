import '../../data/models/models_top_headline/TopheadlineModel.dart';

abstract class TopheadlineStates{}
class InitialStateTopHeadline extends TopheadlineStates{}
class LoadingStateTopHeadline extends TopheadlineStates{}
class SuccessStateTopHeadline extends TopheadlineStates{
  final TopheadlineModel news;
  SuccessStateTopHeadline(this.news);
}
class ErrorStateTopHeadline extends TopheadlineStates{
  final String message;
  ErrorStateTopHeadline(this.message);
}
class SuccessCategoryCountsState extends TopheadlineStates {
  final Map<String, int> counts;
  SuccessCategoryCountsState(this.counts);
}
class LoadingCategoryCountsState extends TopheadlineStates {}

