import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/size.dart';
import 'package:movie_app/core/helper/custom_app_bar.dart';
import 'package:movie_app/features/main/presentation/view/widget/custom_divider.dart';
import 'package:movie_app/features/main/presentation/view/widget/custom_legal_data.dart';

class LegalSection extends StatelessWidget {
  const LegalSection({super.key});
  static const routeName = 'legal_section';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, 'Legal Section'),
      body: const LegalSectionBody(),
    );
  }
}

class LegalSectionBody extends StatelessWidget {
  const LegalSectionBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 20),
        CustomDivider(),
        SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.kHorizontal),
          child: CustomLegalData(),
        ),
      ],
    );
  }
}
