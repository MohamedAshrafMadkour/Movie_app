import 'package:flutter/material.dart';
import 'package:movie_app/features/Auth/presentation/view/widget/custom_text_form_field.dart';

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField({super.key, this.onSaved});
  final Function(String?)? onSaved;
  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: 'Password',
      onSaved: widget.onSaved,
      keyboardType: TextInputType.visiblePassword,
      icon: GestureDetector(
        onTap: () {},
        child: const Icon(Icons.visibility_off_outlined, color: Colors.black87),
      ),
    );
  }
}
