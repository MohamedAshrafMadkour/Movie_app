part of 'reviews_cubit.dart';

sealed class ReviewsState extends Equatable {
  const ReviewsState();

  @override
  List<Object> get props => [];
}

final class ReviewsInitial extends ReviewsState {}

final class FetchReviewsLoading extends ReviewsState {}

final class FetchReviewsSuccess extends ReviewsState {
  final List<ReviewModel> reviews;
  const FetchReviewsSuccess({required this.reviews});
}

final class FetchReviewsFailure extends ReviewsState {
  final String message;
  const FetchReviewsFailure({required this.message});
}
