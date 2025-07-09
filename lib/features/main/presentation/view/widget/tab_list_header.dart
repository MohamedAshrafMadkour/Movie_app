import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/size.dart';
import 'package:movie_app/features/main/presentation/view/widget/active_and_un_active_tab.dart';
import 'package:movie_app/features/main/presentation/view/widget/custom_animated_divider.dart';

class TapListHeader extends StatefulWidget {
  const TapListHeader({super.key, required this.pageController});

  final PageController pageController;

  @override
  State<TapListHeader> createState() => _TapListHeaderState();
}

class _TapListHeaderState extends State<TapListHeader> {
  int currentIndex = 0;
  bool isChoose = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSize.kHorizontal),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: tabList.asMap().entries.map((e) {
              int index = e.key;
              String value = e.value;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = index;
                    isChoose = true;
                    widget.pageController.jumpToPage(index);
                  });
                },
                child: ActiveAndUnActiveTab(
                  text: value,
                  isActive: currentIndex == index,
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 8),
        CustomAnimatedDivider(currentIndex: currentIndex),
      ],
    );
  }
}

List<String> tabList = ['About', 'Review', 'Channels'];
