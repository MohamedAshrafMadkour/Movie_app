part of 'fetch_and_search_category_cubit.dart';

sealed class FetchAndSearchCategoryState extends Equatable {
  const FetchAndSearchCategoryState();

  @override
  List<Object> get props => [];
}

final class FetchAndSearchCategoryInitial extends FetchAndSearchCategoryState {}

final class FetchAndSearchCategoryLoading extends FetchAndSearchCategoryState {}

final class FetchAndSearchCategorySuccess extends FetchAndSearchCategoryState {
  final List<CategoryModel> categoryList;
  const FetchAndSearchCategorySuccess({required this.categoryList});
}

final class FetchAndSearchCategoryFailure extends FetchAndSearchCategoryState {
  final String message;
  const FetchAndSearchCategoryFailure({required this.message});
}
