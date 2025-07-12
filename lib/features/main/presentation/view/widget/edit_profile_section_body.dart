import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/size.dart';
import 'package:movie_app/core/helper/get_user_data.dart';
import 'package:movie_app/core/utils/assets.dart';
import 'package:movie_app/features/main/presentation/view/widget/custom_cached_image.dart';
import 'package:movie_app/features/main/presentation/view/widget/custom_divider.dart';
import 'package:movie_app/features/main/presentation/view/widget/custom_edit_container.dart';

class EditProfileSectionBody extends StatelessWidget {
  const EditProfileSectionBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        const CustomDivider(),
        const SizedBox(height: 20),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * .15,
          width: MediaQuery.sizeOf(context).width * .3,

          child: CustomCachedNetworkImageProfile(image: getUser().image ?? ""),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSize.kHorizontal),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Username',
                style: TextStyle(
                  color: Color(0xFF111111),
                  fontSize: 16,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w500,
                  height: 1.30,
                ),
              ),
              const SizedBox(height: 8),
              CustomEditContainer(
                text: getUser().name ?? "",
                image: Assets.imagesProfile,
              ),
              const SizedBox(height: 20),
              const Text(
                'Email',
                style: TextStyle(
                  color: Color(0xFF111111),
                  fontSize: 16,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w500,
                  height: 1.30,
                ),
              ),
              const SizedBox(height: 8),
              CustomEditContainer(
                text: getUser().email,
                image: Assets.imagesSms,
              ),
              const SizedBox(height: 20),
              const Text(
                'Birthday',
                style: TextStyle(
                  color: Color(0xFF111111),
                  fontSize: 16,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w500,
                  height: 1.30,
                ),
              ),
              const SizedBox(height: 8),
              CustomEditContainer(
                text: getUser().birthday ?? "",
                image: Assets.imagesProfile,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
