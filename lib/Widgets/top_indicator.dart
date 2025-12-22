import 'package:flutter/material.dart';

class TopIndicator extends StatelessWidget {
  const TopIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 22,
      color: Color(0xffFDFCFC),
      padding:const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 8,
              height:8,
              decoration:BoxDecoration(
                color: Color(0xffC4C4C4),
                shape: BoxShape.circle,
              ),
            ),
            //SizedBox(width: 7,),
            Container(
              width: 8,
              height:8,
              decoration:BoxDecoration(
                color: Color(0xff001F70),
                shape: BoxShape.circle,
              ),
            ),
           // SizedBox(width: 7,),
            Container(
              width: 8,
              height:8,
              decoration:BoxDecoration(
                color: Color(0xffC4C4C4),
                shape: BoxShape.circle,
              ),
            ),
          ],

        ),
      ),
    );

  }
}