import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsGeometry.directional(start: 20,end: 20),
      padding: EdgeInsets.only(left: 20, right: 20, top: 16, bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        color: Color(0xffFDFCFC),
      ),
      child: Row(

        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child:
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search Location",
                  hintStyle: TextStyle(
                    fontSize: 15,
                    color: Color(0xffC4C4C4),
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),

          ),
          Icon(Icons.search,
          color: Color(0xffC4C4C4),),

        ],
      ),
    );
  }
}
