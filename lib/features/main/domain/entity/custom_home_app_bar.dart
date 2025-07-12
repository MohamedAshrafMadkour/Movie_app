import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/core/helper/get_user_data.dart';
import 'package:movie_app/core/utils/assets.dart';
import 'package:movie_app/core/utils/styles.dart';
import 'package:movie_app/features/main/presentation/view/widget/custom_cached_image.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        height: 50,
        width: 50,
        child: CustomCachedNetworkImageProfile(
          image: getUser().image ?? "",
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      title: Text('Hi, ${getUser().name}', style: Styles.textBold14),
      subtitle: const Text('Let\'s watch a movie', style: Styles.textRegular12),
      trailing: SvgPicture.asset(Assets.imagesUnActiveUnactiveSearch),
    );
  }
}
