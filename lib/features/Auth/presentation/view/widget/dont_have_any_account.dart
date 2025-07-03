import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/styles.dart';
import 'package:movie_app/features/Auth/presentation/view/register_view.dart';

class DontHaveAnyAccount extends StatelessWidget {
  const DontHaveAnyAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'Don’t have account?',
            style: Styles.textRegular12.copyWith(
              color: const Color(0xFF4C4E55),
            ),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () =>
                  Navigator.pushNamed(context, RegisterView.routeName),
            text: ' Sign Up',
            style: Styles.textSemiBold12.copyWith(
              color: const Color(0xFF685CF0),
            ),
          ),
        ],
      ),
    );
  }
}
