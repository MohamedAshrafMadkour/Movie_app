import 'package:flutter/material.dart';
import 'package:movie_app/features/main/presentation/view/widget/custom_legal_text.dart';

class CustomLegalData extends StatelessWidget {
  const CustomLegalData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomLegalMainText(text: 'Terms'),

        SizedBox(height: 16),
        CustomOpacityText(
          text:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget ornare quam vel facilisis feugiat amet sagittis arcu, tortor. Sapien, consequat ultrices morbi orci semper sit nulla. Leo auctor ut etiam est, amet aliquet ut vivamus. Odio vulputate est id tincidunt fames.',
        ),
        SizedBox(height: 16),
        CustomOpacityText(
          text:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget ornare quam vel facilisis feugiat amet sagittis arcu, tortor. Sapien, consequat ultrices morbi orci semper sit nulla. Leo auctor ut etiam est, amet aliquet ut vivamus. Odio vulputate est id tincidunt fames.',
        ),
        SizedBox(height: 16),
        CustomLegalMainText(text: 'Changes to the Service and/or Terms:'),
        SizedBox(height: 16),
        CustomOpacityText(
          text:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget ornare quam vel facilisis feugiat amet sagittis arcu, tortor. Sapien, consequat ultrices morbi orci semper sit nulla. Leo auctor ut etiam est, amet aliquet ut vivamus. Odio vulputate est id tincidunt fames.',
        ),
        SizedBox(height: 16),
        CustomOpacityText(
          text:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget ornare quam vel facilisis feugiat amet sagittis arcu, tortor. Sapien, consequat ultrices morbi orci semper sit nulla. Leo auctor ut etiam est, amet aliquet ut vivamus. Odio vulputate est id tincidunt fames.',
        ),
      ],
    );
  }
}
