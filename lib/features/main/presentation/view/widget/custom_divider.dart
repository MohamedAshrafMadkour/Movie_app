import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1.50,
            strokeAlign: BorderSide.strokeAlignCenter,
            color: Color(0xFFE1E1E2),
          ),
        ),
      ),
    );
  }
}
