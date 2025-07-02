import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/assets.dart';
import 'package:movie_app/generated/l10n.dart';

class PageViewItemModel {
  final String image;
  final String title;
  final String description;
  final String buttonTitle;

  PageViewItemModel({
    required this.image,
    required this.title,
    required this.description,
    required this.buttonTitle,
  });
}

List<PageViewItemModel> pageViewItemModel(BuildContext context) {
  return [
    PageViewItemModel(
      image: Assets.imagesFrame,
      title: 'Watching can be from anywhere',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipisci elit, sed do eiusmod tempor incididunt sed do eiusmod tempor incididunt',
      buttonTitle: S.of(context).onboardingCustomButton1,
    ),
    PageViewItemModel(
      image: Assets.imagesArcher,
      title: 'Complete list of movies',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipisci elit, sed do eiusmod tempor incididunt sed do eiusmod tempor incididunt',
      buttonTitle: S.of(context).onboardingCustomButton2,
    ),
    PageViewItemModel(
      image: Assets.imagesFrame,
      title: 'Spent Time with Loved Ones!',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipisci elit, sed do eiusmod tempor incididunt sed do eiusmod tempor incididunt',
      buttonTitle: S.of(context).onboardingCustomButton3,
    ),
  ];
}
