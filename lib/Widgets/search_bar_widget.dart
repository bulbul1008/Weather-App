import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final VoidCallback onTap;

  const SearchBarWidget({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        color: const Color(0xffFDFCFC),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              readOnly: true,
              onTap: onTap,
              style: const TextStyle(color: Colors.black, fontSize: 15),
              decoration: const InputDecoration(
                hintText: "Search Location",
                hintStyle: TextStyle(color: Color(0xffC4C4C4)),
                border: InputBorder.none,
              ),
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: const Icon(
              Icons.search,
              color: Color(0xffC4C4C4),
            ),
          ),
        ],
      ),
    );
  }
}
