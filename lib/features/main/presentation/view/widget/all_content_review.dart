import 'package:flutter/material.dart';
import 'package:movie_app/core/helper/custom_app_bar.dart';
import 'package:movie_app/core/utils/styles.dart';

class AllContentReview extends StatelessWidget {
  const AllContentReview({super.key, required this.content});
  final String? content;
  static const routeName = 'all-content';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, 'All Content'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              Text('All Content', style: Styles.textBold14),
              SizedBox(height: 16),
              Text(
                content ?? " ",
                style: Styles.textRegular12.copyWith(
                  color: const Color(0xFFA7AEC1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
