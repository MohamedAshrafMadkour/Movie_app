import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/helper/custom_app_bar.dart';
import 'package:movie_app/core/services/get_it_service.dart';
import 'package:movie_app/features/main/data/Model/category_model.dart';
import 'package:movie_app/features/main/domain/repo/main_repo.dart';
import 'package:movie_app/features/main/presentation/manager/fetch_and_search_category_cubit/fetch_and_search_category_cubit.dart';
import 'package:movie_app/features/main/presentation/view/widget/category_item_list.dart';
import 'package:movie_app/features/main/presentation/view/widget/category_list.dart';
import 'package:movie_app/features/main/presentation/view/widget/search_text_field.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchAndSearchCategoryCubit(getIt.get<MainRepo>()),
      child: Scaffold(
        appBar: customAppBar(context, 'Search'),
        body: const SearchViewBody(),
      ),
    );
  }
}

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  int currentIndex = 0;
  List<String> filmsCategory = [
    'Action',
    'Adventure',
    'Animation',
    'Comedy',
    'Crime',
    'Drama',
    'Romance',
    'Thriller',
  ];
  Map<String, dynamic> genresMap = {
    'Action': 28,
    'Adventure': 12,
    'Animation': 16,
    'Comedy': 35,
    'Crime': 80,
    'Drama': 18,
    'Romance': 10749,
    'Thriller': 53,
  };
  List<CategoryModel> categories = [];
  List<CategoryModel> filteredList = [];
  void handleCategoryList(List<CategoryModel> loadedList) {
    setState(() {
      categories = loadedList;
      filteredList = loadedList;
    });
  }

  void searchAboutItem(String keyword) {
    setState(() {
      filteredList = categories
          .where(
            (element) => element.originalTitle!.toLowerCase().contains(
              keyword.toLowerCase(),
            ),
          )
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SearchTextField(onChanged: searchAboutItem),
        ),
        const SizedBox(height: 30),
        CategoryList(
          onCategorySelected: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          Categories: filmsCategory,
        ),
        CategoryItemList(
          categoryList: filteredList,
          onCategoryTap: handleCategoryList,
          selectedCategory: filmsCategory[currentIndex],
          category: genresMap[filmsCategory[currentIndex]]!,
        ),
      ],
    );
  }
}
