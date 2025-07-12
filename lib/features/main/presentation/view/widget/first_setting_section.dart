import 'package:flutter/material.dart';
import 'package:movie_app/features/main/data/Model/setting_model.dart';
import 'package:movie_app/features/main/presentation/view/widget/edit_profile_section.dart';
import 'package:movie_app/features/main/presentation/view/widget/setting_list_tile.dart';
import 'package:movie_app/features/main/presentation/view/widget/updateing_password_section.dart';

class FirstSettingSection extends StatelessWidget {
  const FirstSettingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        SettingsListTile(
          setting: SettingModel.generateSetting[0],
          onTap: () {
            Navigator.pushNamed(context, EditProfileSection.routeName);
          },
        ),
        const SizedBox(height: 15),
        SettingsListTile(
          setting: SettingModel.generateSetting[1],
          onTap: () {
            Navigator.pushNamed(context, UpdatingPasswordSection.routeName);
          },
        ),

        const SizedBox(height: 15),
        SettingsListTile(setting: SettingModel.generateSetting[2]),
        const SizedBox(height: 20),
      ],
    );
  }
}
