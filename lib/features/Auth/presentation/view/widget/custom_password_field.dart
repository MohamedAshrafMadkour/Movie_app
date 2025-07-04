import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/features/Auth/presentation/view/widget/custom_text_form_field.dart';

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField({super.key, this.onSaved});
  final Function(String?)? onSaved;
  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool isSecure = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: 'Password',
      onSaved: widget.onSaved,
      isObscure: isSecure,
      keyboardType: TextInputType.visiblePassword,
      icon: GestureDetector(
        onTap: () {
          setState(() {
            isSecure = !isSecure;
          });
        },
        child: isSecure
            ? const Icon(
                Icons.visibility_off_outlined,
                color: AppColors.kSecondColor,
              )
            : const Icon(
                Icons.visibility_outlined,
                color: AppColors.kSecondColor,
              ),
      ),
    );
  }
}
