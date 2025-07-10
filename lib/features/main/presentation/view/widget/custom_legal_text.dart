import 'package:flutter/material.dart';

class CustomLegalMainText extends StatelessWidget {
  const CustomLegalMainText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Text(
        text,
        style: TextStyle(
          color: const Color(0xFF111111),
          fontSize: 16,
          fontFamily: 'Outfit',
          fontWeight: FontWeight.w500,
          height: 1.30,
        ),
      ),
    );
  }
}

class CustomOpacityText extends StatelessWidget {
  const CustomOpacityText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.50,
      child: Text(
        text,
        style: TextStyle(
          color: Color(0xFFB0B0B3),
          fontSize: 14,
          fontFamily: 'Outfit',
          fontWeight: FontWeight.w400,
          height: 1.80,
        ),
      ),
    );
  }
}
