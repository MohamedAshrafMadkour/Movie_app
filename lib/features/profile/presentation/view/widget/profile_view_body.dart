import 'dart:io';

import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/size.dart';
import 'package:movie_app/core/utils/styles.dart';
import 'package:movie_app/features/Auth/presentation/view/widget/custom_text_form_field.dart';
import 'package:movie_app/features/on_boarding/presentation/view/widgets/custom_button.dart';
import 'package:movie_app/features/profile/presentation/view/widget/image_profile.dart';
import 'package:movie_app/features/ready/presentation/view/ready_view.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  File? fileImage;
  late String name;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.kHorizontal),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 24),
              Center(
                child: ProfileImage(
                  onImageSelected: (image) {
                    fileImage = image;
                  },
                ),
              ),
              SizedBox(height: 36),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Profile Name',
                  style: Styles.textRegular12.copyWith(
                    color: const Color(0xFF34363E),
                  ),
                ),
              ),
              SizedBox(height: 6),
              CustomTextFormField(
                hintText: 'Name',
                keyboardType: TextInputType.name,
                onSaved: (value) {
                  name = value!;
                },
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * .4),
              CustomButton(
                title: 'SaveAndContinue',
                onPressed: () {
                  if (fileImage != null) {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      // context.read<ProfileCubit>().uploadImageAndUpdateName(
                      //   fileImage!,
                      //   name,
                      // );
                      Navigator.pushNamed(context, ReadyView.routeName);
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  } else {
                    // customSnackBar(context, 'Please select image');
                    Navigator.pushNamed(context, ReadyView.routeName);
                  }
                },
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
