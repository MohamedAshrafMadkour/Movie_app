import 'package:movie_app/core/utils/assets.dart';

class SettingModel {
  final String title;
  final String image;

  SettingModel({required this.title, required this.image});
  static List<SettingModel> generateSetting = [
    SettingModel(title: 'Edit Profile', image: Assets.imagesSettingUser),
    SettingModel(title: 'Change Password', image: Assets.imagesSettingLock),
    SettingModel(title: 'Language', image: Assets.imagesSettingLanguage),
  ];
  static List<SettingModel> generateHelp = [
    SettingModel(title: 'Legal and Policies', image: Assets.imagesSettingHelp),
    SettingModel(title: 'Help & Support', image: Assets.imagesSettingHelp),
    SettingModel(title: 'Logout', image: Assets.imagesSettingLogout),
  ];
}
