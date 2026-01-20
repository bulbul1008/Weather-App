import 'package:flutter/material.dart';

class TopIndicator extends StatelessWidget {
  final int currentIndex;
  final int totalPages;

  const TopIndicator({
    super.key,
    required this.currentIndex,
    this.totalPages = 3,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 80,
      // height: 22,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xffFDFCFC),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(totalPages, (index) {
          final bool isActive = index == currentIndex;

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 3),
            child: Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isActive
                    ? const Color(0xff001F70)
                    : const Color(0xffC4C4C4),
              ),
            ),
          );
        }),
      ),
    );
  }
}
