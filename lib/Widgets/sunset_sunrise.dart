import 'package:flutter/material.dart';
import 'package:dotted_line_flutter/dotted_line_flutter.dart';

class SunsetSunrise extends StatelessWidget {
  final String sunrise;
  final String sunset;
  final String day_length;

  const SunsetSunrise({
    super.key,
    required this.sunrise,
    required this.sunset,
    required this.day_length,
  });

  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      margin: EdgeInsetsGeometry.directional(start: 20, end: 20),
      decoration: BoxDecoration(
        color: Color(0xffFDFCFC),
        borderRadius: BorderRadius.circular(11),
      ),
      child: Container(
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            _buildSunriseAndSunsetText(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Sunrise", style: TextStyle(color: Color(0xffC4C4C4))),
                    Text(sunrise, style: TextStyle(color: Color(0xff9A9A9A))),
                    DottedLine(
                      axis: Axis.vertical,
                      lineThickness: 3,
                      dashGap: 4,
                      colors: [Color(0xffC4C4C4)],
                      // shadowColor: Colors.black,
                      //shadowBlurRadius: 30,
                      height: 60,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Sunset", style: TextStyle(color: Color(0xffC4C4C4))),
                    Text(sunset, style: TextStyle(color: Color(0xff9A9A9A))),
                    DottedLine(
                      axis: Axis.vertical,
                      lineThickness: 3,
                      dashGap: 4,
                      colors: [Color(0xffC4C4C4)],
                     // shadowColor: Colors.black,
                      //shadowBlurRadius: 30,
                      height: 60,
                    ),
                  ],
                ),
              ],
            ),
            // //SizedBox(height: 10),
            DottedLine(
              axis: Axis.horizontal,
             // lineThickness: 3,
              dashGap: 4,
              colors: [Color(0xffC4C4C4)],
             // shadowColor: Color(0xffC4C4C4),
              shadowBlurRadius: 0,
            ),
            Row(
              children: [
                Text(
                  "Length of day: $day_length",
                  style: TextStyle(color: Color(0xff9A9A9A)),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Remaining daylight: ",
                  style: TextStyle(color: Color(0xff9A9A9A)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Text _buildSunriseAndSunsetText() {
    return Text(
      "SUNRISE & SUNSET",
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: Color(0xffC4C4C4),
      ),
    );
  }
}
