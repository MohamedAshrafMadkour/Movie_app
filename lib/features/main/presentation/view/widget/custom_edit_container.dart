import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomEditContainer extends StatelessWidget {
  const CustomEditContainer({
    super.key,
    required this.image,
    required this.text,
  });
  final String image, text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * .06,
      decoration: ShapeDecoration(
        color: const Color(0xFFFEFEFE),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 1,
            strokeAlign: BorderSide.strokeAlignCenter,
            color: Color(0xFFE1E1E2),
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Row(
        children: [
          SvgPicture.asset(image),
          const SizedBox(width: 16),
          Text(
            text,
            style: const TextStyle(
              color: Color(0xFF111111),
              fontSize: 16,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w500,
              height: 1.30,
            ),
          ),
        ],
      ),
    );
  }
}
