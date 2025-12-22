import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.symmetric(horizontal: 16),
      width: 327,
      height: 46,
      decoration: BoxDecoration(
        color: Color(0xffFDFCFC),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(

        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            //padding: EdgeInsetsGeometry.all(),
            height: 23,
            width: 121,
            child:
              Text("Search Locationa",
              style: TextStyle(
                fontSize: 15,
                color: Color(0xffC4C4C4),
                //height: 23,
               // fontWeight: FontWeight.normal,
              ),),
          ),
          Icon(Icons.search,
          color: Color(0xffC4C4C4),),

        ],
      ),
    );
  }
}
