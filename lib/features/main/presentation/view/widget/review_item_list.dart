import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/main/data/Model/all_films_model.dart';
import 'package:movie_app/features/main/presentation/manager/reviews_cubit/reviews_cubit.dart';
import 'package:movie_app/features/main/presentation/view/widget/review_item.dart';

class ReviewItemList extends StatefulWidget {
  const ReviewItemList({super.key});

  @override
  State<ReviewItemList> createState() => _ReviewItemListState();
}

class _ReviewItemListState extends State<ReviewItemList> {
  @override
  void initState() {
    context.read<ReviewsCubit>().fetchReviews(
      id: context.read<AllFilmsModel>().id!,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewsCubit, ReviewsState>(
      builder: (context, state) {
        if (state is FetchReviewsSuccess) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: ReviewItem(reviewModel: state.reviews[index]),
              ),
              childCount: state.reviews.length,
            ),
          );
        } else if (state is FetchReviewsFailure) {
          return SliverToBoxAdapter(child: Center(child: Text(state.message)));
        } else {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => const Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: ReviewItemShimmer(),
              ),
              childCount: 10,
            ),
          );
        }
      },
    );
  }
}
