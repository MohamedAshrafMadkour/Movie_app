import 'package:flutter/material.dart';
import 'package:movie_app/features/main/domain/entity/bottom_navigation_bar_entity.dart';
import 'package:movie_app/features/main/presentation/view/widget/active_icon_bar.dart';
import 'package:movie_app/features/main/presentation/view/widget/un_active_icon_bar.dart';

class ActiveAndUnActiveIconBar extends StatelessWidget {
  const ActiveAndUnActiveIconBar({
    super.key,
    required this.isActive,
    required this.bottomNavBarEntity,
  });
  final bool isActive;
  final BottomNavBarEntity bottomNavBarEntity;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? ActiveIconBar(activeIcon: bottomNavBarEntity.activeImage)
        : UnActiveIconBar(unActiveIcon: bottomNavBarEntity.inactiveImage);
  }
}
