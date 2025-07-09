import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/styles.dart';

class UnActiveTab extends StatelessWidget {
  const UnActiveTab({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: Styles.textRegular14.copyWith(color: const Color(0xFF4C4E55)),
    );
  }
}
