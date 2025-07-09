import 'package:flutter/material.dart';
import 'package:movie_app/core/helper/custom_app_bar.dart';
import 'package:movie_app/features/main/data/Model/all_films_model.dart';
import 'package:movie_app/features/main/presentation/view/widget/details_view_body.dart';
import 'package:provider/provider.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.model});
  static const routeName = 'details_view';
  final AllFilmsModel model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, 'Details'),
      body: Provider<AllFilmsModel>.value(
        value: model,
        child: DetailsViewBody(),
      ),
    );
  }
}
