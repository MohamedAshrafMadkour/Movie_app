import 'package:flutter/material.dart';

class CustomWhiteGround extends StatelessWidget {
  const CustomWhiteGround({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      bottom: MediaQuery.sizeOf(context).height * .1,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.50, -0.00),
            end: Alignment(0.50, 1.20),
            colors: [
              Colors.white.withValues(alpha: 0),
              Colors.white.withValues(alpha: 0.30),
              Colors.white.withValues(alpha: 0.80),
              Colors.white,
            ],
          ),
        ),
      ),
    );
  }
}
