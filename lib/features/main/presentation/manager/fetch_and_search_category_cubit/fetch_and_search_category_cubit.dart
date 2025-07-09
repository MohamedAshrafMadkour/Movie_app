import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/features/main/data/Model/category_model.dart';
import 'package:movie_app/features/main/domain/repo/main_repo.dart';

part 'fetch_and_search_category_state.dart';

class FetchAndSearchCategoryCubit extends Cubit<FetchAndSearchCategoryState> {
  FetchAndSearchCategoryCubit(this.mainRepo)
    : super(FetchAndSearchCategoryInitial());
  final MainRepo mainRepo;
  Future<void> fetchAndSearchCategory({required int id}) async {
    emit(FetchAndSearchCategoryLoading());

    final result = await mainRepo.fetchSearchFilms(id: id);
    result.fold(
      (failure) =>
          emit(FetchAndSearchCategoryFailure(message: failure.errorMessage)),
      (success) => emit(FetchAndSearchCategorySuccess(categoryList: success)),
    );
  }
}
