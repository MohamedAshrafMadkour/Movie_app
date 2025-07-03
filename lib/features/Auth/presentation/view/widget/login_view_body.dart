import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/constants/size.dart';
import 'package:movie_app/core/utils/assets.dart';
import 'package:movie_app/core/utils/styles.dart';
import 'package:movie_app/features/Auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:movie_app/features/Auth/presentation/view/widget/custom_social_login.dart';
import 'package:movie_app/features/Auth/presentation/view/widget/custom_password_field.dart';
import 'package:movie_app/features/Auth/presentation/view/widget/custom_text_form_field.dart';
import 'package:movie_app/features/Auth/presentation/view/widget/dont_have_any_account.dart';
import 'package:movie_app/features/Auth/presentation/view/widget/or_divider.dart';
import 'package:movie_app/features/on_boarding/presentation/view/widgets/custom_button.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  late String email, password;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSize.kHorizontal),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.sizeOf(context).height * .03),
              Text(
                'Email',
                style: Styles.textRegular10.copyWith(
                  color: const Color(0xFF34363E),
                ),
              ),
              SizedBox(height: 6),
              CustomTextFormField(
                hintText: 'example@example.com',
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) {
                  email = value!;
                },
              ),
              SizedBox(height: 12),
              Text(
                'Password',
                style: Styles.textRegular10.copyWith(
                  color: const Color(0xFF34363E),
                ),
              ),
              SizedBox(height: 6),
              CustomPasswordField(
                onSaved: (value) {
                  password = value!;
                },
              ),
              SizedBox(height: 28),
              CustomButton(
                title: 'Continue',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.read<LoginCubit>().login(
                      email: email,
                      password: password,
                    );
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              ),
              SizedBox(height: 24),
              Center(
                child: Text(
                  'Forgot Password?',
                  style: Styles.textSemiBold16.copyWith(
                    color: const Color(0xFF685CF0),
                  ),
                ),
              ),
              SizedBox(height: 28),
              OrDivider(),
              SizedBox(height: 28),
              CustomSocialLogin(
                title: 'Continue with Google',
                image: Assets.imagesGoogleIcon,
                onTap: () {
                  context.read<LoginCubit>().loginWithGoogle();
                },
              ),
              SizedBox(height: 18),
              CustomSocialLogin(
                title: 'Continue with Facebook',
                image: Assets.imagesFacebook,
                onTap: () {
                  context.read<LoginCubit>().loginWithFacebook();
                },
              ),
              SizedBox(height: 43),
              Center(child: DontHaveAnyAccount()),
            ],
          ),
        ),
      ),
    );
  }
}
