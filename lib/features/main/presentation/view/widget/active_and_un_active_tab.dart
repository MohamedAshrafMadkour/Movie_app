import 'package:flutter/material.dart';
import 'package:movie_app/features/main/presentation/view/widget/active_tab.dart';
import 'package:movie_app/features/main/presentation/view/widget/un_active_tab.dart';

class ActiveAndUnActiveTab extends StatelessWidget {
  const ActiveAndUnActiveTab({
    super.key,
    required this.text,
    required this.isActive,
  });
  final String text;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      crossFadeState: isActive
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      firstChild: ActiveTab(text: text),
      secondChild: UnActiveTab(text: text),
      duration: Duration(milliseconds: 300),
    );
  }
}
