import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/styles.dart';

class HelpSectionBody extends StatefulWidget {
  const HelpSectionBody({super.key});

  @override
  State<HelpSectionBody> createState() => _HelpSectionBodyState();
}

class _HelpSectionBodyState extends State<HelpSectionBody> {
  bool isExpended = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Lorem ipsum dolor sit amet',
                style: Styles.textMedium12.copyWith(
                  color: const Color(0xFF6C6C6C),
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    isExpended = !isExpended;
                  });
                },
                icon: isExpended
                    ? const Icon(Icons.keyboard_arrow_down_outlined, size: 30)
                    : const Icon(Icons.keyboard_arrow_right_outlined, size: 30),
              ),
            ],
          ),
          isExpended
              ? const Text(
                  'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.',
                  style: TextStyle(
                    color: Color(0xFF6C6C6C),
                    fontSize: 14,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w400,
                    height: 1.80,
                  ),
                )
              : Container(
                  width: 327,
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Color(0xFFE3E7EB),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
