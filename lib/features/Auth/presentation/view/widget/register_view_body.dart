import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/core/constants/size.dart';
import 'package:movie_app/core/helper/custom_dialog.dart';
import 'package:movie_app/core/utils/assets.dart';
import 'package:movie_app/core/utils/styles.dart';
import 'package:movie_app/features/Auth/presentation/view/widget/birthday_form_field.dart';
import 'package:movie_app/features/Auth/presentation/view/widget/custom_password_field.dart';
import 'package:movie_app/features/Auth/presentation/view/widget/custom_terms.dart';
import 'package:movie_app/features/Auth/presentation/view/widget/custom_text_form_field.dart';
import 'package:movie_app/features/main/presentation/view/widget/legal_section.dart';
import 'package:movie_app/features/on_boarding/presentation/view/widgets/custom_button.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  late String email, password, confirmPassword;
  String birthday = '';
  final TextEditingController _birthdayController = TextEditingController();
  DateTime? _selectedDate;
  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      helpText: 'Choose a date',
      confirmText: 'confirm',
      cancelText: 'cancel',
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        birthday =
            '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}';
        _birthdayController.text = birthday;
      });
    }
  }

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
              const SizedBox(height: 6),
              CustomTextFormField(
                hintText: 'Example',
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) {
                  email = value!;
                },
              ),
              const SizedBox(height: 12),
              Text(
                'Birthday',
                style: Styles.textRegular10.copyWith(
                  color: const Color(0xFF34363E),
                ),
              ),
              const SizedBox(height: 6),
              BirthdayFormField(
                controller: _birthdayController,
                hintStyle: Styles.textRegular12.copyWith(color: Colors.black),
                hintText: _birthdayController.text.isEmpty
                    ? 'Birthday'
                    : _birthdayController.text,
                onTap: () => _pickDate(context),
                onSaved: (value) {
                  birthday = value!;
                },
              ),
              const SizedBox(height: 12),
              Text(
                'Password',
                style: Styles.textRegular10.copyWith(
                  color: const Color(0xFF34363E),
                ),
              ),
              const SizedBox(height: 6),
              CustomPasswordField(
                onSaved: (value) {
                  password = value!;
                },
              ),
              const SizedBox(height: 12),
              Text(
                'Confirm Password',
                style: Styles.textRegular10.copyWith(
                  color: const Color(0xFF34363E),
                ),
              ),
              const SizedBox(height: 6),
              CustomPasswordField(
                onSaved: (value) {
                  confirmPassword = value!;
                },
              ),
              const SizedBox(height: 12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(Assets.imagesCheck, height: 18, width: 18),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Password must be at least 8 character, uppercase, lowercase, and unique code like #%!',
                      style: Styles.textRegular10.copyWith(
                        color: const Color(0xFF4C4E55),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * .15),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, LegalSection.routeName);
                },
                child: const CustomTerms(),
              ),
              const SizedBox(height: 16),
              CustomButton(
                title: 'Agree and continue',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    customRegisterDialog(
                      context,
                      email: email,
                      password: password,
                      birthday: birthday,
                      confirmPassword: confirmPassword,
                    );
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
