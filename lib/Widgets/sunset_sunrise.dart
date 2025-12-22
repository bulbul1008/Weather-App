import 'package:flutter/material.dart';
class SunsetSunrise extends StatelessWidget{
  final String sunrise;
  final String sunset;
  final String day_length;

  const SunsetSunrise({
    super.key,
    required this.sunrise,
    required this.sunset,
    required this.day_length,
});
Widget build (BuildContext context){
  return Container(
    alignment: Alignment.center,
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20,),
    width: 327,
    height: 229,
    decoration: BoxDecoration(
      color: Color(0xffFDFCFC),
      borderRadius: BorderRadius.circular(11),
    ),
    child: Container(
      height: 99,
      width: 290,
      child: Column(

        children: [
          Row(
         // height: 18,
           // width: 109,
            //color: Color(0xffC4C4C4),
            children:[ Text("SUNRISE & SUNSET",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xffC4C4C4),
              ),),
      ]
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Sunrise",
              style: TextStyle(
                color: Color(0xffC4C4C4),
              ),),
              Text("Sunset",
              style: TextStyle(
                color: Color(0xffC4C4C4),
              ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(sunrise,
                style: TextStyle(
                  color: Color(0xff9A9A9A),
                ),),
              Text(sunset,
                style: TextStyle(
                  color: Color(0xff9A9A9A),
                ),
              )
            ],
          ),
          Row(
            children: [
              Text("Length of day: $day_length",
               style: TextStyle(
                 color: Color(0xff9A9A9A),
               ),
                ),
            ],
          ),
          Row(
            children: [
              Text("Remaining daylight: ",
              style: TextStyle(
                color: Color(0xff9A9A9A),
              ),
              )
            ],
          )
        ],
      ),
    ),
  );
}

}