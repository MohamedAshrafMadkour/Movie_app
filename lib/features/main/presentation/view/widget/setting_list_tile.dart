import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/features/main/data/Model/setting_model.dart';

class SettingsListTile extends StatelessWidget {
  const SettingsListTile({super.key, required this.setting, this.onTap});
  final SettingModel setting;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height * .06,
        decoration: const ShapeDecoration(
          shape: RoundedRectangleBorder(),
          shadows: [
            BoxShadow(
              color: Color(0x26A7AEC1),
              blurRadius: 80,
              offset: Offset(0, 4),
              spreadRadius: 0,
            ),
          ],
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          leading: SvgPicture.asset(setting.image, height: 24, width: 24),
          title: Text(
            setting.title,
            style: const TextStyle(
              color: Color(0xFF111111),
              fontSize: 14,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w500,
              height: 1.30,
            ),
          ),
          trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
        ),
      ),
    );
  }
}
