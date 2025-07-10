import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/styles.dart';
import 'package:movie_app/features/main/data/Model/all_films_model.dart';
import 'package:movie_app/features/main/presentation/view/details_view.dart';
import 'package:movie_app/features/main/presentation/view/widget/custom_cached_image.dart';

class RecommendationItem extends StatelessWidget {
  const RecommendationItem({super.key, required this.movies});
  final AllFilmsModel movies;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, DetailsView.routeName, arguments: movies);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[300]!,
                borderRadius: BorderRadius.circular(16),
              ),
              height: MediaQuery.sizeOf(context).height * .22,
              child: CustomCachedNetworkImage(
                image: "https://image.tmdb.org/t/p/w500/${movies.posterPath}",
              ),
            ),
            SizedBox(height: 6),
            FittedBox(
              child: Text(
                movies.originalTitle ?? "anonymous movie",
                style: Styles.textBold14,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(height: 6),
            FittedBox(
              child: Text(
                movies.title ?? "anonymous movie",
                style: Styles.textRegular12,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
