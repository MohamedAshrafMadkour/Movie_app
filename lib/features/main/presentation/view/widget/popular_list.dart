import 'package:flutter/material.dart';
import 'package:movie_app/features/main/presentation/view/widget/popular_item.dart';

class PopularItemList extends StatelessWidget {
  const PopularItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: 10,

      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,

        childAspectRatio: 3.8 / 4.5,
      ),
      itemBuilder: (BuildContext context, int index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: const PopularItem(),
      ),
    );
  }
}
