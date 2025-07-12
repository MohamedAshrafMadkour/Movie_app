import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/core/utils/assets.dart';
import 'package:movie_app/core/utils/styles.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key, this.onChanged});
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: SizedBox(
          height: 20,
          width: 20,
          child: Center(
            child: SvgPicture.asset(
              Assets.imagesUnActiveUnactiveSearch,
              colorFilter: const ColorFilter.mode(
                Color(0xFF7D7E83),
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
        suffixIcon: SizedBox(
          width: 20,
          child: Center(
            child: SvgPicture.asset(Assets.imagesSetting, height: 20),
          ),
        ),
        hintStyle: Styles.textRegular12.copyWith(
          color: const Color(0xFF7D7E83),
        ),
        hintText: 'Search....',
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(width: 1, color: Color(0xFFD9D9D9)),
      borderRadius: BorderRadius.circular(100),
    );
  }
}
