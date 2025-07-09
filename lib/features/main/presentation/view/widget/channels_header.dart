import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/styles.dart';

class ChannelsHeader extends StatelessWidget {
  const ChannelsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Reviews',
      style: Styles.textBold14.copyWith(color: const Color(0xFF191D31)),
    );
  }
}
