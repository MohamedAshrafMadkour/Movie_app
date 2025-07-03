import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/styles.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: Color(0xFFDCDEDE))),
        SizedBox(width: 18),
        Text(
          'or',
          textAlign: TextAlign.center,
          style: Styles.textBold14.copyWith(color: const Color(0xFF4C4E55)),
        ),
        SizedBox(width: 18),
        Expanded(child: Divider(color: Color(0xFFDCDEDE))),
      ],
    );
  }
}
