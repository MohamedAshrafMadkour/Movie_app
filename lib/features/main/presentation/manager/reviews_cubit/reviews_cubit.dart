import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/features/main/data/Model/review_model/review_model.dart';
import 'package:movie_app/features/main/domain/repo/main_repo.dart';

part 'reviews_state.dart';

class ReviewsCubit extends Cubit<ReviewsState> {
  ReviewsCubit(this.mainRepo) : super(ReviewsInitial());
  final MainRepo mainRepo;
  Future<void> fetchReviews({required int id}) async {
    emit(FetchReviewsLoading());
    final result = await mainRepo.fetchAllReview(id: id);
    result.fold(
      (failure) => emit(FetchReviewsFailure(message: failure.errorMessage)),
      (success) => emit(FetchReviewsSuccess(reviews: success)),
    );
  }
}
