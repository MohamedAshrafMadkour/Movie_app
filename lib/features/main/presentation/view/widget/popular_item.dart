import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/assets.dart';

class PopularItem extends StatefulWidget {
  const PopularItem({super.key});

  @override
  State<PopularItem> createState() => _PopularItemState();
}

class _PopularItemState extends State<PopularItem> {
  bool _expanded = false;

  void _toggleExpand() {
    setState(() {
      _expanded = !_expanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleExpand,

      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            Image.asset(Assets.imagesShowman1, fit: BoxFit.fill),
            Container(color: const Color.fromRGBO(0, 0, 0, 0.5)),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 150),
              bottom: 0,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                width: MediaQuery.of(context).size.width * 0.6,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: _expanded
                      ? Color.fromRGBO(0, 0, 0, .7)
                      : Color.fromRGBO(0, 0, 0, .4),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedCrossFade(
                      firstChild: const SizedBox.shrink(),
                      secondChild: Text(
                        "anonymous meal name",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      crossFadeState: _expanded
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                      duration: const Duration(milliseconds: 150),
                    ),
                    const SizedBox(height: 4),
                    AnimatedCrossFade(
                      firstChild: const SizedBox.shrink(),
                      secondChild: Text(
                        "Romance, Drama",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      crossFadeState: _expanded
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                      duration: const Duration(milliseconds: 150),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
