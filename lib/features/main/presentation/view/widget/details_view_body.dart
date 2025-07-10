import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/main/data/Model/all_films_model.dart';
import 'package:movie_app/features/main/presentation/manager/trailer_cubit/trailer_cubit.dart';
import 'package:movie_app/features/main/presentation/view/widget/custom_page_view.dart';
import 'package:movie_app/features/main/presentation/view/widget/custom_postwar_data.dart';
import 'package:movie_app/features/main/presentation/view/widget/tab_list_header.dart';

class DetailsViewBody extends StatefulWidget {
  const DetailsViewBody({super.key});

  @override
  State<DetailsViewBody> createState() => _DetailsViewBodyState();
}

class _DetailsViewBodyState extends State<DetailsViewBody> {
  late PageController pageController;
  int pageControllerIndex = 0;
  @override
  void initState() {
    var trailer = context.read<AllFilmsModel>().id;
    context.read<TrailerCubit>().fetchTrailer(id: trailer!);
    pageController = PageController();
    pageController.addListener(() {
      pageControllerIndex = pageController.page!.round();
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * .4,
            width: double.infinity,
            child: CustomPostwarData(),
          ),
        ),
        SizedBox(height: 16),
        TapListHeader(pageController: pageController),
        SizedBox(height: 24),
        Expanded(child: CustomPageView(pageController: pageController)),
      ],
    );
  }
}
