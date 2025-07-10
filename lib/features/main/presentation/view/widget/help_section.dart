import 'package:flutter/material.dart';
import 'package:movie_app/core/helper/custom_app_bar.dart';
import 'package:movie_app/features/main/presentation/view/widget/help_section_body.dart';

class HelpAndSupportSection extends StatelessWidget {
  const HelpAndSupportSection({super.key});
  static const String routeName = 'Help_and_support_section';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, 'Help & Support'),
      body: const HelpSectionBody(),
    );
  }
}
