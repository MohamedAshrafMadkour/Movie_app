import 'package:flutter/material.dart';
import 'package:movie_app/core/helper/custom_app_bar.dart';
import 'package:movie_app/features/main/presentation/view/widget/edit_profile_section_body.dart';

class EditProfileSection extends StatelessWidget {
  const EditProfileSection({super.key});
  static const routeName = 'edit_profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, 'Edit Profile'),
      body: EditProfileSectionBody(),
    );
  }
}
