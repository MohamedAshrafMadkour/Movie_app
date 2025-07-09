import 'package:flutter/material.dart';
import 'package:movie_app/features/main/presentation/view/widget/active_and_un_active_category.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({
    super.key,
    required this.Categories,

    required this.onCategorySelected,
  });
  final List<String> Categories;

  final void Function(int) onCategorySelected;

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .07,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.Categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  currentIndex = index;
                  widget.onCategorySelected(index);
                });
              },
              child: ActiveAndUnActiveCategory(
                category: widget.Categories[index],
                isActive: currentIndex == index,
              ),
            ),
          );
        },
      ),
    );
  }
}
