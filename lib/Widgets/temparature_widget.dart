import 'package:flutter/material.dart';
class TemparatureWidget extends StatelessWidget {

  final  String temparature;
  const TemparatureWidget({super.key,
  required this.temparature
  });

  @override
  Widget build(BuildContext context) {
    return Container(
    margin: EdgeInsetsGeometry.directional(start: 20,end: 20),
      child: Column(
        children: [
          Text(temparature.replaceAll("C",""),
            style: TextStyle(
              fontSize: 70,
              fontWeight: FontWeight.w500,
              color: Color(0xff2C2C2C),
            ),
          )
        ],
      ),
    );
  }
}
