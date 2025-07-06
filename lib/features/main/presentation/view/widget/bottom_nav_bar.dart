import 'package:flutter/material.dart';
import 'package:movie_app/features/main/domain/entity/bottom_navigation_bar_entity.dart';
import 'package:movie_app/features/main/presentation/view/widget/active_and_un_active_bar.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key, required this.onItemTapped});
  final ValueChanged<int> onItemTapped;
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFFEFEFE),
        boxShadow: [
          BoxShadow(
            color: Color(0x0F292929),
            blurRadius: 48,
            offset: Offset(0, -6),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: bottomNavBarItems.asMap().entries.map((e) {
              int index = e.key;
              return InkWell(
                onTap: () {
                  setState(() {
                    currentIndex = index;
                    widget.onItemTapped(index);
                  });
                },
                child: ActiveAndUnActiveIconBar(
                  isActive: currentIndex == index,
                  bottomNavBarEntity: e.value,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
