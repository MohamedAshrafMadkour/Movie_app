import 'package:movie_app/core/utils/assets.dart';

class BottomNavBarEntity {
  final String activeImage, inactiveImage;

  BottomNavBarEntity({required this.activeImage, required this.inactiveImage});
}

List<BottomNavBarEntity> get bottomNavBarItems => [
  BottomNavBarEntity(
    activeImage: Assets.imagesActiveActiveHome,
    inactiveImage: Assets.imagesUnActiveUnactiveHome,
  ),
  BottomNavBarEntity(
    activeImage: Assets.imagesActiveActiveSearch,
    inactiveImage: Assets.imagesUnActiveUnactiveSearch,
  ),
  BottomNavBarEntity(
    activeImage: Assets.imagesActiveActiveUser,
    inactiveImage: Assets.imagesUnActiveUnactiveProfile,
  ),
];
