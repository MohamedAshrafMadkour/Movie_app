import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/main/data/Model/category_model.dart';
import 'package:movie_app/features/main/presentation/manager/fetch_and_search_category_cubit/fetch_and_search_category_cubit.dart';
import 'package:movie_app/features/main/presentation/view/widget/category_item.dart';

class CategoryItemList extends StatefulWidget {
  const CategoryItemList({
    super.key,
    required this.selectedCategory,
    required this.category,
    required this.onCategoryTap,
    required this.categoryList,
  });
  final String selectedCategory;
  final int category;
  final void Function(List<CategoryModel>) onCategoryTap;
  final List<CategoryModel> categoryList;
  @override
  State<CategoryItemList> createState() => _CategoryItemListState();
}

class _CategoryItemListState extends State<CategoryItemList> {
  @override
  void initState() {
    context.read<FetchAndSearchCategoryCubit>().fetchAndSearchCategory(
      id: widget.category,
    );

    super.initState();
  }

  @override
  void didUpdateWidget(covariant CategoryItemList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.category != widget.category) {
      context.read<FetchAndSearchCategoryCubit>().fetchAndSearchCategory(
        id: widget.category,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<
      FetchAndSearchCategoryCubit,
      FetchAndSearchCategoryState
    >(
      listener: (context, state) {
        if (state is FetchAndSearchCategorySuccess) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            widget.onCategoryTap(state.categoryList);
          });
        }
      },
      builder: (context, state) {
        if (state is FetchAndSearchCategorySuccess) {
          return Expanded(
            child: ListView.builder(
              itemCount: widget.categoryList.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: CategoryItem(
                    categoryModel: widget.categoryList[index],
                    selectedCategory: widget.selectedCategory,
                  ),
                ),
              ),
            ),
          );
        } else if (state is FetchAndSearchCategoryFailure) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
