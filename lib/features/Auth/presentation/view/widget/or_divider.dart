import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/styles.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(color: Color(0xFFDCDEDE))),
        const SizedBox(width: 18),
        Text(
          'or',
          textAlign: TextAlign.center,
          style: Styles.textBold14.copyWith(color: const Color(0xFF4C4E55)),
        ),
        const SizedBox(width: 18),
        const Expanded(child: Divider(color: Color(0xFFDCDEDE))),
      ],
    );
  }
}
