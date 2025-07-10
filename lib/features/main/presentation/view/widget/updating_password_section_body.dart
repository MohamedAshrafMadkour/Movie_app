import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/constants/size.dart';
import 'package:movie_app/features/Auth/presentation/manager/updating_password/updating_password_cubit.dart';
import 'package:movie_app/features/Auth/presentation/view/widget/custom_password_field.dart';
import 'package:movie_app/features/main/presentation/view/widget/custom_divider.dart';
import 'package:movie_app/features/on_boarding/presentation/view/widgets/custom_button.dart';

class UpdatingPasswordSectionBody extends StatefulWidget {
  const UpdatingPasswordSectionBody({super.key});

  @override
  State<UpdatingPasswordSectionBody> createState() =>
      _UpdatingPasswordSectionBodyState();
}

class _UpdatingPasswordSectionBodyState
    extends State<UpdatingPasswordSectionBody> {
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late String password, confirmPassword, currentPassword;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        CustomDivider(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSize.kHorizontal,
            ),
            child: SingleChildScrollView(
              child: Form(
                autovalidateMode: autoValidateMode,
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      'Current Password',
                      style: TextStyle(
                        color: const Color(0xFF111111),
                        fontSize: 16,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w500,
                        height: 1.30,
                      ),
                    ),
                    SizedBox(height: 10),
                    CustomPasswordField(
                      onSaved: (value) {
                        currentPassword = value!;
                      },
                    ),
                    SizedBox(height: 20),
                    Text(
                      'New Password',
                      style: TextStyle(
                        color: const Color(0xFF111111),
                        fontSize: 16,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w500,
                        height: 1.30,
                      ),
                    ),
                    SizedBox(height: 10),
                    CustomPasswordField(
                      onSaved: (value) {
                        password = value!;
                      },
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Confirm New Password',
                      style: TextStyle(
                        color: const Color(0xFF111111),
                        fontSize: 16,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w500,
                        height: 1.30,
                      ),
                    ),
                    SizedBox(height: 10),
                    CustomPasswordField(
                      onSaved: (value) {
                        confirmPassword = value!;
                      },
                    ),
                    SizedBox(height: 50),
                    CustomButton(
                      title: 'Change Now',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          context.read<UpdatingPasswordCubit>().updatePassword(
                            confirmPassword: confirmPassword,
                            currentPassword: currentPassword,
                            newPassword: password,
                          );
                        } else {
                          setState(() {
                            autoValidateMode = AutovalidateMode.always;
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
