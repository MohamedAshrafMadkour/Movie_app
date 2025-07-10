import 'package:flutter/material.dart';
import 'package:movie_app/core/helper/custom_dialog.dart';
import 'package:movie_app/features/main/data/Model/setting_model.dart';
import 'package:movie_app/features/main/presentation/view/widget/help_section.dart';
import 'package:movie_app/features/main/presentation/view/widget/legal_section.dart';
import 'package:movie_app/features/main/presentation/view/widget/setting_list_tile.dart';

class SecondSettingSection extends StatelessWidget {
  const SecondSettingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SettingsListTile(
          setting: SettingModel.generateHelp[0],
          onTap: () {
            Navigator.pushNamed(context, LegalSection.routeName);
          },
        ),
        SizedBox(height: 15),
        SettingsListTile(
          setting: SettingModel.generateHelp[1],
          onTap: () {
            Navigator.pushNamed(context, HelpAndSupportSection.routeName);
          },
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * .1),

        SettingsListTile(
          setting: SettingModel.generateHelp[2],
          onTap: () {
            customDialog(context);
          },
        ),
        SizedBox(height: 15),
      ],
    );
  }
}
