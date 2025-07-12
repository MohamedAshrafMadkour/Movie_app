import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/size.dart';
import 'package:movie_app/core/helper/custom_app_bar.dart';
import 'package:movie_app/features/main/presentation/view/widget/custom_divider.dart';
import 'package:movie_app/features/main/presentation/view/widget/first_setting_section.dart';
import 'package:movie_app/features/main/presentation/view/widget/second_setting_section.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: customAppBar(context, 'Settings'),
      body: const ProfileSectionBody(),
    );
  }
}

class ProfileSectionBody extends StatelessWidget {
  const ProfileSectionBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16),
        CustomDivider(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.kHorizontal),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              Text(
                'General',
                style: TextStyle(
                  color: Color(0xFF111111),
                  fontSize: 18,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w600,
                  height: 1.30,
                ),
              ),
              FirstSettingSection(),
              Text(
                'Preferences',
                style: TextStyle(
                  color: Color(0xFF111111),
                  fontSize: 18,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w600,
                  height: 1.30,
                ),
              ),
              SizedBox(height: 20),
              SecondSettingSection(),
            ],
          ),
        ),
      ],
    );
  }
}
